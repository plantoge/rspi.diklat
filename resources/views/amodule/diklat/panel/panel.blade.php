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
        
        <form action="{{url('/panel-informasi/store')}}" method="post" enctype="multipart/form-data">
            @csrf
            <h2 class="pb-5">Data Informasi Website</h2>
            <div class="row">
                
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Telepon</label>
                        <input type="text" id="telepon" name="telepon" value="{{$informasi->TELEPON}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Fax</label>
                        <input type="text" id="fax" name="fax" value="{{$informasi->FAX}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Call Center</label>
                        <input type="text" id="callcenter" name="callcenter" value="{{$informasi->CALLCENTER}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Hotline</label>
                        <input type="text" id="hotline" name="hotline" value="{{$informasi->HOTLINE}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Email</label>
                        <input type="text" id="email" name="email" value="{{$informasi->EMAIL}}" class="form-control mb-2" placeholder="">
                    </div>
                    
                </div>
                <div class="col-sm-12 col-lg-6">
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Facebook</label>
                        <input type="text" id="facebook" name="facebook" value="{{$informasi->FACEBOOK}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Instagram</label>
                        <input type="text" id="instagram" name="instagram" value="{{$informasi->INSTAGRAM}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">Twitter</label>
                        <input type="text" id="twitter" name="twitter" value="{{$informasi->TWITTER}}" class="form-control mb-2" placeholder="">
                    </div>
                    <div class="mb-5 fv-row fv-plugins-icon-container">
                        <label class="required form-label">WhatsApp</label>
                        <input type="text" id="whatsapp" name="whatsapp" value="{{$informasi->WHATSAPP}}" class="form-control mb-2" placeholder="ex: 0812345678">
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

</script>
@endsection