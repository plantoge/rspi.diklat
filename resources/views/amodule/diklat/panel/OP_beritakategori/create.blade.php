@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    {{-- <form action="{{url('/panel-berita-kategori/store')}}" method="post" enctype="multipart/form-data"> --}}
    <form id="formdata" method="post" enctype="multipart/form-data">
        @csrf
        <h2 class="pb-5">Buat Kategori</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Title</label>
                    <input type="text" id="title" name="title" class="form-control mb-2" placeholder="" value="{{old('title')}}" onchange="generateSlug()">
                    <small id="titleError" class="text-danger"></small>
                    {{-- @error('title')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">slug</label>
                    <input type="text" id="slug" name="slug" class="form-control mb-2" placeholder="" value="{{old('slug')}}">
                    <div class="text-muted fs-7"></div>
                    <small id="slugError" class="text-danger"></small>
                    {{-- @error('slug')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-6">
                <button id="submitButton" class="btn btn-primary">Simpan</button>
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
    // document.getElementById('submitButton').addEventListener('click', function(e) {
    $('#submitButton').on('click', function(e) {
        e.preventDefault();
        const formData = $('#formdata').serialize();
        let csrfToken = $('input[name="_token"]').val();

        $.ajax({
            type: 'POST',
            url: `{{url('/panel-berita-kategori/store')}}`,
            data: formData,
            dataType: 'json',
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
                
                if(data.status_code == 422){
                    let title = data.errors.title
                    let slug = data.errors.slug
                    
                    title    ? $('#titleError').html('<b>'+title+'</b>')       : $('#titleError').html('<b></b>') 
                    slug     ? $('#slugError').html('<b>'+slug+'</b>')        : $('#slugError').html('<b></b>') 
                }else if(data.status_code == 200){
                    Swal.fire({
                        text: "Berhasil",
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "Ok",
                        customClass: {
                            confirmButton: "btn btn-success"
                        }
                    }).then((result) => {
                        // Jika tombol "OK" diklik, lakukan redirect
                        if (result.isConfirmed) {
                            window.location.href = `{{url('panel-berita-kategori')}}`;
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
@endsection