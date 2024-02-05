@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
<style>
    .tox-fullscreen {
        height: 100% !important; /* Set tinggi elemen fullscreen menjadi 100% dari tinggi layar */
    }

    .tox-container {
        height: 100% !important; /* Set tinggi elemen container menjadi 100% dari tinggi layar */
    }
</style>
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form id="formsaya" method="post" enctype="multipart/form-data">
        @csrf
        @method('PATCH')
        <h2 class="pb-5">Ubah Berita</h2>
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Title</label>
                    <input type="text" id="title" name="title" class="form-control mb-2" placeholder="" value="{{$berita->BERITA_TITLE}}" onchange="generateSlug()">
                    <input type="text" id="slug" name="slug" value="{{$berita->BERITA_SLUG}}" hidden>
                    <small class="text-muted" id="textSlug"></small>
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Arsip" @if($berita->BERITA_STATUS == 'Arsip') selected @endif>Arsip</option>
                        <option value="Publik" @if($berita->BERITA_STATUS == 'Publik') selected @endif>Publik</option>
                    </select>  
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Kategori</label>
                    <select class="form-select" id="kategori" name="kategori">
                        @foreach ($kategori as $kat)
                            <option value="{{$kat->BERITA_KATEGORI_ID}}" @if($berita->BERITA_KATEGORI_ID == $kat->BERITA_KATEGORI_ID) selected @endif>{{$kat->BERITA_KATEGORI}}</option>
                        @endforeach
                    </select>  
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Ganti Gambar Utama</label>
                    <input type="file" id="gambar" name="gambar" class="form-control mb-2">
                    <a href="{{url('storage/app/gambar_berita/' . $berita->BERITA_GAMBAR)}}" target="_blank" class="btn  btn-link btn-sm">{{$berita->BERITA_GAMBAR}}</a>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="require form-label">Konten</label>
                    <textarea id="konten" name="konten" class="tox-target" value="{{$berita->BERITA_KONTEN}}">{!! $berita->BERITA_KONTEN !!}</textarea>
                </div>
            </div>

            <div class="col-sm-12 col-lg-6">
                <button class="btn btn-primary submit">Simpan</button>
            </div>
        </div>
    </form>
</div>

@endsection

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.js')}}"></script>
<script src="{{url('public/Twebsite/v1/plugins/custom/tinymce/tinymce.bundle.js')}}"></script>
<script src="{{asset('public/plugin/js/formatrupiah.js')}}"></script>
<script>
    tinymce.init({
        selector: "#konten",
        branding: false,
        plugins: 'advlist autolink lists link fullscreen table charmap print preview anchor lineheight',
        toolbar: 'fullscreen undo redo | formatselect | ' +
            'bold italic backcolor | alignleft aligncenter alignright alignjustify | lineheight ' +
            'bullist numlist outdent indent | removeformat | link | ' +
            'table | hr | subscript superscript | ' +
            'fontselect fontsizeselect | code | preview | forecolor backcolor | ',
    });
</script>
<script>
    function formatIDR(element, field) {
        var el      = $(element);
        var parent  = el.parent().parent().parent();
        var data    = parent.find(field).val();
        var hasil   = prosesRupiah(data);
        const nominal = parseInt(hasil.replace(/\./g, ''));
        parent.find(field).val(hasil);
    }

    function generateSlug() {
      var title = $('#title').val();
      var slug = createSlug(title);
      
      console.log("Generated Slug:", slug);
      $('#slug').val(slug);
      $('.slug').html('Slug: ' + slug);
    }

    function createSlug(text) {
      return text.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
    }

</script>

<script>
    $(document).ready(function(){
        $('#formsaya').submit(function(e){
            e.preventDefault();

            let csrfToken = $('input[name="_token"]').val();
            let file      = new FormData($('#formsaya')[0]);
            let konten    = tinymce.get('konten').getContent()
            file.append('konten', konten)

            $.ajax({
                type: 'POST',
                url: `{{url('/panel-berita/'.$id.'/update')}}`,
                data: file,

                dataType: 'json',
                contentType: false,
                processData: false,
                headers: {
                    'X-HTTP-Method-Override': 'PATCH',
                    'X-CSRF-TOKEN': csrfToken
                },
                beforeSend: function() {
                    swal.fire({
                    title: 'Mohon Tunggu!',
                    html: 'Sedang proses data ke server',
                    didOpen: () => {
                        swal.showLoading()
                    }
                    })
                },
                success:function(data){
                    swal.close();
                    console.log(data);    
                    
                    if(data.status_code == 422){
                        let title = data.errors.title
                        let gambar = data.errors.gambar
                        let konten = data.errors.konten
                        let status = data.errors.status
                        let kategori = data.errors.kategori
                        
                        title    ? $('#titleError').html('<b>'+title+'</b>')       : $('#titleError').html('<b></b>') 
                        gambar   ? $('#gambarError').html('<b>'+gambar+'</b>')     : $('#gambarError').html('<b></b>') 
                        konten   ? $('#kontenError').html('<b>'+konten+'</b>')     : $('#kontenError').html('<b></b>') 
                        status   ? $('#statusError').html('<b>'+status+'</b>')     : $('#statusError').html('<b></b>') 
                        kategori ? $('#kategoriError').html('<b>'+kategori+'</b>') : $('#kategoriError').html('<b></b>') 

                    }else if(data.status_code == 200){
                        Swal.fire({
                            text: data.message,
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "Ok",
                            customClass: {
                                confirmButton: "btn btn-success"
                            }
                        }).then((result) => {
                            // Jika tombol "OK" diklik, lakukan redirect
                            if (result.isConfirmed) {
                                window.location.href = `{{url('panel-berita')}}`;
                            }
                        });
                    }      
                },
                error: function(xhr, status, error) {
                    swal.close()                
                    console.log(status)
                    console.log(error)

                    Swal.fire({
                        text: "ada yang salah, hubungi SIMRS",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                },
            });
        })
    })
</script>
@endsection