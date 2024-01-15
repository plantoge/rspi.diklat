@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
@endsection

@section('konten')

<div class="card-body pt-0">
    <form action="{{url('/panel-berita/store')}}" method="post" enctype="multipart/form-data">
        @csrf
        <h2 class="pb-5">Buat Kategori</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Title</label>
                    <input type="text" id="title" name="title" class="form-control mb-2" placeholder="" value="{{old('title')}}" onchange="generateSlug()">
                    <input type="text" id="slug" name="slug" value="{{old('slug')}}" hidden>
                    <small class="text-muted" id="textSlug"></small>
                    @error('title')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Arsip">Arsip</option>
                        <option value="Publik">Publik</option>
                    </select>  
                    @error('status')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror      
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Kategori</label>
                    <select class="form-select" id="kategori" name="kategori">
                        @foreach ($kategori as $kategori)
                            <option value="{{$kategori->BERITA_KATEGORI_ID}}" @if(old('kategori') == 'Pelatihan') selected @endif>{{$kategori->BERITA_KATEGORI}}</option>
                        @endforeach
                    </select>  
                    @error('kategori')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror      
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Konten</label>
                    <textarea id="konten" name="konten" class="tox-target"></textarea>
                    @error('konten')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror      
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
    $('#jadwal_kegiatan').daterangepicker({
        "drops": "auto",
        "opens": "center",
        "singleDatePicker": false,
        "locale": {
            "format": 'YYYY-MM-DD', // Ubah format tanggal sesuai keinginan Anda
            "separator": ' / '
        },
        // "startDate": '',
        // "endDate": ''
    });

    tinymce.init({
        selector: "#konten",
        branding: false,
        height: 500,
        plugins: 'advlist autolink lists link table charmap print preview anchor lineheight',
        toolbar: 'undo redo | formatselect | ' +
            'bold italic backcolor | alignleft aligncenter alignright alignjustify | lineheight ' +
            'bullist numlist outdent indent | removeformat | link | ' +
            'table | hr | subscript superscript | ' +
            'fontselect fontsizeselect | code | preview | forecolor backcolor | fullscreen | help ',
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