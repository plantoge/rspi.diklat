@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form id="formsaya" method="post" enctype="multipart/form-data">
        @csrf
        <h2 class="pb-5">Buat Keunggulan</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Icon / Font / Fontawesome 6</label>
                    <input type="text" id="icon" name="icon" class="form-control mb-2" placeholder="" value="{{old('icon')}}">
                    <div class="text-muted fs-7">cari font / icon nya <a href="https://fontawesome.com/search?o=r&m=free" target="_blank" class="btn btn-link">disini</a></div>
                    <small id="iconError" class="text-danger"></small>
                    {{-- @error('icon')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Judul</label>
                    <input type="text" id="judul" name="judul" class="form-control mb-2" placeholder="" value="{{old('judul')}}">
                    <div class="text-muted fs-7"></div>
                    <small id="judulError" class="text-danger"></small>
                    {{-- @error('judul')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Deskripsi</label>
                    <textarea id="deskripsi" name="deskripsi" class="tox-target">
                        {{old('deskripsi')}}
                    </textarea>
                    <small id="deskripsiError" class="text-danger"></small>
                    {{-- @error('deskripsi')
                    <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
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

    function getStatus() {
      let status = document.getElementById('status');
      let selectedValue = status.value;

      // Menampilkan nilai (value) terpilih ke konsol
      $(".submit").html(selectedValue);
    }
</script>

<script>
    $(document).ready(function() {
        // $('#submitButton').on('click', function(e) {
        $('#formsaya').submit(function(e) {
            e.preventDefault();
            let csrfToken = $('input[name="_token"]').val();

            let file      = new FormData($('#formsaya')[0]);
            let konten    = tinymce.get('deskripsi').getContent()
            file.append('konten', konten)

            $.ajax({
                type: 'POST',
                url: `{{url('/panel-keunggulan/store')}}`,
                data: file,

                dataType: 'json',
                contentType: false,
                processData: false,
                headers: {
                    // 'X-HTTP-Method-Override': 'PATCH|DELETE', //only route patch and delete
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
                    
                    if(data.status_code == 422){
                        let icon = data.errors.icon
                        let deskripsi = data.errors.deskripsi
                        let judul = data.errors.judul
                        
                        icon    ? $('#iconError').html('<b>'+icon+'</b>')       : $('#iconError').html('<b></b>') 
                        deskripsi   ? $('#deskripsiError').html('<b>'+deskripsi+'</b>')     : $('#deskripsiError').html('<b></b>') 
                        judul   ? $('#judulError').html('<b>'+judul+'</b>')     : $('#judulError').html('<b></b>') 

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
                                window.location.href = `{{url('panel-keunggulan')}}`;
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

    })
</script>
@endsection