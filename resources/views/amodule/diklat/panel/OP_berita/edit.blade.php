@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form action="{{url('/panel-berita-kategori/'.$id.'/update')}}" method="post" enctype="multipart/form-data">
        @csrf
        @method('PATCH')
        <h2 class="pb-5">Ubah Berita</h2>
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Title</label>
                    <input type="text" id="title" name="title" class="form-control mb-2" placeholder="" value="{{old('title')}}" onchange="generateSlug()">
                    <input type="text" id="slug" name="slug" value="{{old('slug')}}" hidden>
                    <small class="text-muted" id="textSlug"></small>
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Arsip">Arsip</option>
                        <option value="Publik">Publik</option>
                    </select>  
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
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Upload Gambar Utama</label>
                    <input type="file" id="gambar" name="gambar" class="form-control mb-2">
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="require form-label">Konten</label>
                    <textarea id="konten" name="konten" class="tox-target">{{old('konten')}}</textarea>
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
        selector: "#deskripsi", 
        // height : "100",
        branding: false
    });

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
@endsection