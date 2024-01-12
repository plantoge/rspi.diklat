@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form action="{{url('/panel-keunggulan/'.$id.'/update')}}" method="post" enctype="multipart/form-data">
        @csrf
        @method('PATCH')
        <h2 class="pb-5">Buat Events</h2>
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Icon / Font / Fontawesome 6</label>
                    <input type="text" id="icon" name="icon" class="form-control mb-2" placeholder="" value="{{$keunggulan->KEUNGGULAN_FONTAWESOME}}">
                    <div class="text-muted fs-7">cari font / icon nya <a href="https://fontawesome.com/search?o=r&m=free" target="_blank" class="btn btn-link">disini</a></div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Judul</label>
                    <input type="text" id="judul" name="judul" class="form-control mb-2" placeholder="" value="{{$keunggulan->KEUNGGULAN_JUDUL}}">
                    <div class="text-muted fs-7"></div>
                </div>
            </div>

            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Deskripsi</label>
                    <textarea id="deskripsi" name="deskripsi" class="tox-target" value="{{$keunggulan->KEUNGGULAN_DESKRIPSI}}">
                        {{$keunggulan->KEUNGGULAN_DESKRIPSI}}
                    </textarea>
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
      var title = $('#judul').val();
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