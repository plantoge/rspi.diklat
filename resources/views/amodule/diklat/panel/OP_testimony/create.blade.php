@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form action="{{url('/panel-testimony/store')}}" method="post" enctype="multipart/form-data">
        @csrf
        <h2 class="pb-5">Buat Testimony</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Nama</label>
                    <input type="text" id="testimony_nama" name="testimony_nama" class="form-control mb-2" placeholder="" value="{{old('testimony_nama')}}">
                    @error('testimony_nama')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror
                </div>
            </div>

            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label required">Upload Foto/Gambar</label>
                    <input type="file" id="testimony_gambar" name="testimony_gambar" class="form-control mb-2 ">
                    @error('testimony_gambar')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror
                </div>
            </div>


            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label required">Deskripsi</label>
                    <textarea id="testimony_deskripsi" name="testimony_deskripsi" class="tox-target">
                        {{old('testimony_deskripsi')}}
                    </textarea>
                    {{-- <div class="ql-toolbar ql-snow"><span class="ql-formats"><span class="ql-header ql-picker"><span class="ql-picker-label" tabindex="0" role="button" aria-expanded="false" aria-controls="ql-picker-options-0"><svg viewBox="0 0 18 18"> <polygon class="ql-stroke" points="7 11 9 13 11 11 7 11"></polygon> <polygon class="ql-stroke" points="7 7 9 5 11 7 7 7"></polygon> </svg></span><span class="ql-picker-options" aria-hidden="true" tabindex="-1" id="ql-picker-options-0"><span tabindex="0" role="button" class="ql-picker-item" data-value="1"></span><span tabindex="0" role="button" class="ql-picker-item" data-value="2"></span><span tabindex="0" role="button" class="ql-picker-item"></span></span></span><select class="ql-header" style="display: none;"><option value="1"></option><option value="2"></option><option selected="selected"></option></select></span><span class="ql-formats"><button type="button" class="ql-bold"><svg viewBox="0 0 18 18"> <path class="ql-stroke" d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z"></path> <path class="ql-stroke" d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z"></path> </svg></button><button type="button" class="ql-italic"><svg viewBox="0 0 18 18"> <line class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line> <line class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line> <line class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line> </svg></button><button type="button" class="ql-underline"><svg viewBox="0 0 18 18"> <path class="ql-stroke" d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3"></path> <rect class="ql-fill" height="1" rx="0.5" ry="0.5" width="12" x="3" y="15"></rect> </svg></button></span><span class="ql-formats"><button type="button" class="ql-image"><svg viewBox="0 0 18 18"> <rect class="ql-stroke" height="10" width="12" x="3" y="4"></rect> <circle class="ql-fill" cx="6" cy="7" r="1"></circle> <polyline class="ql-even ql-fill" points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12"></polyline> </svg></button><button type="button" class="ql-code-block"><svg viewBox="0 0 18 18"> <polyline class="ql-even ql-stroke" points="5 7 3 9 5 11"></polyline> <polyline class="ql-even ql-stroke" points="13 7 15 9 13 11"></polyline> <line class="ql-stroke" x1="10" x2="8" y1="5" y2="13"></line> </svg></button></span></div><div id="kt_ecommerce_add_product_description" name="kt_ecommerce_add_product_description" class="min-h-200px mb-2 ql-container ql-snow"><div class="ql-editor ql-blank" data-gramm="false" contenteditable="true" data-placeholder="Type your text here..."><p><br></p></div><div class="ql-clipboard" contenteditable="true" tabindex="-1"></div><div class="ql-tooltip ql-hidden"><a class="ql-preview" rel="noopener noreferrer" target="_blank" href="about:blank"></a><input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL"><a class="ql-action"></a><a class="ql-remove"></a></div></div> --}}
                    @error('testimony_deskripsi')
                    <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror
                </div>
            </div>

            
            <div class="col-sm-12 col-lg-6">
                <button type="submit" class="btn btn-primary submit">Simpan</button>
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
        selector: "#testimony_deskripsi", 
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
      var title = $('#judul').val();
      var slug = createSlug(title);
      
      console.log("Generated Slug:", slug);
      $('#slug').val(slug);
      $('.slug').html('Slug: ' + slug);
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