@extends('layout.panel.masterPanel')

@section('css')

@endsection

@section('konten')
<h1>Welcome, {{auth()->user()->name}}</h1>
@endsection

@if(auth()->user()->roles->contains('name', 'operator'))
@section('konten2')
<div class="card card-page mb-3">
    <div class="card-body">
        
        <form id="formsaya" method="post" enctype="multipart/form-data">
            @csrf
            @method('patch')
            <h2 class="pb-5">Data Informasi Website</h2>
            <div class="containe"> 
            <div class="row row-cols-2">
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Telepon</label>
                        <input type="text" id="telepon" name="telepon" value="{{$informasi->TELEPON}}" class="form-control mb-2" placeholder="" disabled>
                        <small id="teleponError" class="text-danger"></small>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Fax</label>
                        <input type="text" id="fax" name="fax" value="{{$informasi->FAX}}" class="form-control mb-2" placeholder="" disabled>
                        <small id="faxError" class="text-danger"></small>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-6">    
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Call Center</label>
                        <input type="text" id="callcenter" name="callcenter" value="{{$informasi->CALLCENTER}}" class="form-control mb-2" placeholder="" disabled>
                        <small id="callcenterError" class="text-danger"></small>
                    </div>
                </div>
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Hotline</label>
                        <input type="text" id="hotline" name="hotline" value="{{$informasi->HOTLINE}}" class="form-control mb-2" placeholder="" disabled>
                        <small id="hotlineError" class="text-danger"></small>
                    </div>
                </div>
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Email</label>
                        <input type="text" id="email" name="email" value="{{$informasi->EMAIL}}" class="form-control mb-2" placeholder="">
                        <small id="emailError" class="text-danger"></small>
                    </div>
                </div>
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">WhatsApp</label>
                        <input type="text" id="whatsapp" name="whatsapp" value="{{$informasi->WHATSAPP}}" class="form-control mb-2" placeholder="ex: 812345678">
                        <small id="whatsappError" class="text-danger"></small>
                    </div>
                </div>
                    
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Facebook</label>
                        <input type="text" id="facebook" name="facebook" value="{{$informasi->FACEBOOK}}" class="form-control mb-2" placeholder="">
                        <small id="facebookError" class="text-danger"></small>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-6">    
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Instagram</label>
                        <input type="text" id="instagram" name="instagram" value="{{$informasi->INSTAGRAM}}" class="form-control mb-2" placeholder="">
                        <small id="instagramError" class="text-danger"></small>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Twitter</label>
                        <input type="text" id="twitter" name="twitter" value="{{$informasi->TWITTER}}" class="form-control mb-2" placeholder="">
                        <small id="twitterError" class="text-danger"></small>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Footer</label>
                        <input type="text" id="alamat_satu" name="alamat_satu" value="{{$informasi->ALAMAT_SATU}}" class="form-control mb-2" placeholder="">
                        <small id="emailError" class="text-danger"></small>
                    </div>
                </div>
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Alamat Footer</label>
                        <textarea name="alamat_dua" id="" rows="2" class="form-control mb-2" value="{{$informasi->ALAMAT_DUA}}">{{$informasi->ALAMAT_DUA}}</textarea>
                        {{-- <input type="text" id="alamat_dua" name="alamat_dua" value="{{$informasi->ALAMAT_DUA}}" class="form-control mb-2" placeholder=""> --}}
                        <small id="emailError" class="text-danger"></small>
                    </div>
                </div>
                
                <div class="col sm-12 col-lg-6">    
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Singkat Poin Plus</label>
                        <textarea name="deskripsi_singkat_poinplus" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_POINTPLUS}}">{{$informasi->DESKRIPSI_SINGKAT_POINTPLUS}}</textarea>
                        <small id="deskripsi_singkat_poinplus_error" class="text-danger"></small>
                    </div>
                </div>
                <div class="col sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Singkat Event Beranda</label>
                        <textarea name="deskripsi_singkat_event_beranda" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_EVENT_BERANDA}}">{{$informasi->DESKRIPSI_SINGKAT_EVENT_BERANDA}}</textarea>
                        <small id="deskripsi_singkat_event_beranda_error" class="text-danger"></small>
                    </div>
                </div>
                <div class="col sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Singkat Event</label>
                        <textarea name="deskripsi_singkat_event" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_EVENT}}">{{$informasi->DESKRIPSI_SINGKAT_EVENT}}</textarea>
                        <small id="deskripsi_singkat_event_error" class="text-danger"></small>
                    </div>
                </div>
                <div class="col sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Singkat Testimony</label>
                        <textarea name="deskripsi_singkat_testimony" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_TESTIMONY}}">{{$informasi->DESKRIPSI_SINGKAT_TESTIMONY}}</textarea>
                        <small id="deskripsi_singkat_testimony_error" class="text-danger"></small>
                    </div>
                </div>
                <div class="col sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Singkat Agenda</label>
                        <textarea name="deskripsi_singkat_agenda" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_AGENDA}}">{{$informasi->DESKRIPSI_SINGKAT_AGENDA}}</textarea>
                        <small id="deskripsi_singkat_agenda_error" class="text-danger"></small>
                    </div>
                </div>
                <div class="col sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Deskripsi Berita / Blog</label>
                        <textarea name="deskripsi_singkat_berita" id="" rows="2" class="form-control mb-2" value="{{$informasi->DESKRIPSI_SINGKAT_BERITA}}">{{$informasi->DESKRIPSI_SINGKAT_BERITA}}</textarea>
                        <small id="deskripsi_singkat_berita_error" class="text-danger"></small>
                    </div>
                </div>

            </div>
            </div>
            
            <h2 class="pb-5 pt-5">Kata Sambutan Beranda</h2>
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        {{-- <label class="form-label">Deskripsi</label> --}}
                        <textarea id="sambutan_beranda" name="sambutan_beranda" class="tox-target">
                            {!! $informasi->SAMBUTAN_BERANDA !!}
                        </textarea>
                        <small id="sambutan_beranda_error" class="text-danger"></small>
                    </div>
                </div>
            </div>
            <h2 class="pb-5 pt-5">Deskripsi Agenda</h2>
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        {{-- <label class="form-label">Deskripsi</label> --}}
                        <textarea id="deskripsi_agenda" name="deskripsi_agenda" class="tox-target">
                            {!! $informasi->DESKRIPSI_AGENDA !!}
                        </textarea>
                        <small id="deskripsi_agenda_error" class="text-danger"></small>
                    </div>
                </div>
            </div>
            <h2 class="pb-5 pt-5">Deskripsi Tentang Kami</h2>
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        {{-- <label class="form-label">Deskripsi</label> --}}
                        <textarea id="deskripsi_tentangkami" name="deskripsi_tentangkami" class="tox-target">
                            {!! $informasi->DESKRIPSI_TENTANGKAMI !!}
                        </textarea>
                        <small id="deskripsi_tentangkami_error" class="text-danger"></small>
                    </div>
                </div>
            </div>
            <div class="row">
                
                <div class="col-sm-12 col-lg-12">
                    <button class="btn btn-primary btn-sm">UPDATE</button>
                </div>
                
            </div>
        </form>

    </div>
</div>
@endsection
@endif

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/tinymce/tinymce.bundle.js')}}"></script>

<script>
    tinymce.init({
        selector: "#sambutan_beranda",
        branding: false,
        toolbar: [
            "styleselect fontselect fontsizeselect | undo redo | cut copy paste | table | bold italic | link | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | blockquote subscript superscript | advlist | autolink | lists charmap | print preview | code |"  // Menambahkan opsi tabel ke dalam toolbar
        ],
        plugins: "advlist autolink link lists charmap print preview code table" 
    });

    tinymce.init({
        selector: "#deskripsi_agenda",
        branding: false,
        toolbar: [
            "styleselect fontselect fontsizeselect | undo redo | cut copy paste | table | bold italic | link | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | blockquote subscript superscript | advlist | autolink | lists charmap | print preview | code |"  // Menambahkan opsi tabel ke dalam toolbar
        ],
        plugins: "advlist autolink link lists charmap print preview code table" 
    });

    tinymce.init({
        selector: "#deskripsi_tentangkami",
        branding: false,
        toolbar: [
            "styleselect fontselect fontsizeselect | undo redo | cut copy paste | table | bold italic | link | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | blockquote subscript superscript | advlist | autolink | lists charmap | print preview | code |"  // Menambahkan opsi tabel ke dalam toolbar
        ],
        plugins: "advlist autolink link lists charmap print preview code table" 
    });

</script>

<script>
    $(document).ready(function(){
        $('#formsaya').submit(function(e){
            e.preventDefault();

            let csrfToken           = $('input[name="_token"]').val();
            let file                = new FormData($('#formsaya')[0]);
            let sambutan_beranda    = tinymce.get('sambutan_beranda').getContent()
            let deskripsi_agenda    = tinymce.get('deskripsi_agenda').getContent()
            let deskripsi_tentangkami    = tinymce.get('deskripsi_tentangkami').getContent()
            file.append('sambutan_beranda', sambutan_beranda)
            file.append('deskripsi_agenda', deskripsi_agenda)
            file.append('deskripsi_tentangkami', deskripsi_tentangkami)

            $.ajax({
                type: 'POST',
                url: `{{url('/panel-informasi/store')}}`,
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
                        
                        title    ? $('#titleError').html('<b>'+title+'</b>') : $('#titleError').html('<b></b>') 

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
                                window.location.href = `{{url('panel')}}`;
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