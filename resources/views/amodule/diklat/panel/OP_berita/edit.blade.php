@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form action="{{url('/panel-berita/'.$id.'/update')}}" method="post" enctype="multipart/form-data">
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
@endsection