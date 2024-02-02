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
    {{-- <form action="{{url('/panel-berita/store')}}" method="post" enctype="multipart/form-data"> --}}
    <form id="forminput" method="post" enctype="multipart/form-data">
        @csrf
        <h2 class="pb-5">Buat Berita</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Title</label>
                    <input type="text" id="title" name="title" class="form-control mb-2" placeholder="" value="{{old('title')}}" onchange="generateSlug()">
                    <input type="text" id="slug" name="slug" value="{{old('slug')}}" hidden>
                    <small class="text-muted" id="textSlug"></small>
                    <small id="titleError" class="text-danger"></small>
                    {{-- @error('title')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Arsip">Arsip</option>
                        <option value="Publik">Publik</option>
                    </select>  
                    <small id="statusError" class="text-danger"></small>
                    {{-- @error('status')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror       --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Kategori</label>
                    <select class="form-select" id="kategori" name="kategori">
                        @foreach ($kategori as $kategori)
                            <option value="{{$kategori->BERITA_KATEGORI_ID}}" @if(old('kategori') == $kategori->BERITA_KATEGORI_ID) selected @endif>{{$kategori->BERITA_KATEGORI}}</option>
                        @endforeach
                    </select>
                    <small id="kategoriError" class="text-danger"></small>  
                    {{-- @error('kategori')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror       --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Upload Gambar Utama</label>
                    <input type="file" id="gambar" name="gambar" class="form-control mb-2">
                    <small id="gambarError" class="text-danger"></small>
                    {{-- @error('gambar')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="require form-label">Konten</label>
                    <textarea id="konten" name="konten" class="tox-target">{{old('konten')}}</textarea>
                    <small id="kontenError" class="text-danger"></small>
                    {{-- @error('konten')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror       --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-6">
                <button id="submitButton" class="btn btn-primary submit">Simpan</button>
            </div>
        </div>
    </form>
</div>

@endsection

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.js')}}"></script>
<script src="{{url('public/plugin/js/formatrupiah.js')}}"></script>
<script src="{{url('public/Twebsite/v1/plugins/custom/ckeditor/ckeditor-inline.bundle.js')}}"></script>
<script src="{{url('public/Twebsite/v1/plugins/custom/tinymce/tinymce.bundle.js')}}"></script>

<script>
    $('#submitButton').on('click', function(e) {
        e.preventDefault();
        let csrfToken = $('input[name="_token"]').val();

        let file      = new FormData($('#forminput')[0]);
        let konten    = tinymce.get('konten').getContent()
        file.append('konten', konten)

        $.ajax({
            type: 'POST',
            url: `{{url('/panel-berita/store')}}`,
            data: file,

            dataType: 'json',
            contentType: false,
            processData: false,
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            beforeSend: function() {
                swal.fire({
                title: 'Mohon Tunggu!',
                html: 'Sedang mengirim data ke server',
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
                        text: "Berhasil! " + data.message,
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

    });
</script>

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
      
      $('#slug').val(slug);
      $('#textSlug').html('Slug: ' + slug);
    }

    function createSlug(text) {
      return text.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
    }

    function getStatus() {
      let status = document.getElementById('status');
      let selectedValue = status.value;

      // Menampilkan nilai (value) terpilih ke konsol
      $(".submit").html(selectedValue);
    }
</script>
@endsection