@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    
@endsection

@section('konten')

<div class="card-body pt-0">
    <form id="formsaya" method="post" enctype="multipart/form-data">
        @csrf
        @method('PATCH')
        <h2 class="pb-5">Buat Events</h2>
        <div class="row">
            
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Judul</label>
                    <input type="text" id="judul" name="judul" class="form-control mb-2" placeholder="" value="{{$event->EVENT_JUDUL}}" onchange="generateSlug()">
                    <input type="text" id="slug" name="slug" class="form-control mb-2" placeholder="" value="{{$event->EVENT_SLUG}}" hidden>
                    <div class="text-muted fs-7">Nama harus bersifat yang unik dan tidak boleh sama persis dengan yang sudah ada</div>
                    <div class="text-muted fs-7 slug">{{$event->EVENT_SLUG}}</div>
                    <small id="judulError" class="text-danger"></small>
                    {{-- @error('judul')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-12">

                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Deskripsi Singkat</label>
                    <textarea name="deskripsi_singkat" id="deskripsi_singkat" id="" cols="30" rows="3" class="form-control" value="{{$event->EVENT_DESKRIPSI_SINGKAT}}">{{$event->EVENT_DESKRIPSI_SINGKAT}}</textarea>        
                    <small id="deskripsi_singkatError" class="text-danger"></small>
                    {{-- @error('deskripsi_singkat')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-6">

                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Kategori</label>
                    <select class="form-select" id="kategori" name="kategori">
                        <option value="Kelas" @if($event->EVENT_KATEGORI == 'Kelas') selected @endif>Kelas</option>
                        <option value="Webinar" @if($event->EVENT_KATEGORI == 'Webinar') selected @endif>Webinar</option>
                        <option value="Pelatihan" @if($event->EVENT_KATEGORI == 'Pelatihan') selected @endif>Pelatihan</option>
                    </select>  
                    <small id="kategoriError" class="text-danger"></small>
                    {{-- @error('kategori')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror       --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">

                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Ubah Kegiatan</label>
                    <input class="form-control mb-2" placeholder="Pick date rage" id="jadwal_kegiatan" name="jadwal_kegiatan"/>
                    <small class="text-danger"><b>{{$event->EVENT_JADWAL_AWAL}}</b> / <b>{{$event->EVENT_JADWAL_AKHIR}}</b></small>
                    <small id="jadwal_kegiatanError" class="text-danger"></small>
                    {{-- @error('jadwal_kegiatan')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Harga</label>
                    <input type="text" id="harga" name="harga" value="@matauang($event->EVENT_HARGA)" class="form-control mb-2" onkeyup="formatIDR(this, '#harga');">
                    <small id="hargaError" class="text-danger"></small>
                    {{-- @error('harga')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-6">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="required form-label">Diskon</label>
                    <input type="text" id="diskon" name="diskon" value="@matauang($event->EVENT_DISKON)" class="form-control mb-2" onkeyup="formatIDR(this, '#diskon');">
                    <small id="diskonError" class="text-danger"></small>
                    {{-- @error('diskon')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>

            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Deskripsi</label>
                    <textarea id="deskripsi" name="deskripsi" class="tox-target">
                        {{$event->EVENT_DESKRIPSI_PANJANG}}
                    </textarea>
                    <small id="deskripsiError" class="text-danger"></small>
                    {{-- @error('deskripsi')
                    <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            <div class="col-sm-12 col-lg-12">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    <label class="form-label">Ganti Gambar</label>
                    <input type="file" id="gambar" name="gambar" class="form-control mb-2">
                    <input type="text" id="gambar_lama" name="gambar_lama" value="{{$event->EVENT_GAMBAR}}" class="form-control mb-2" hidden>
                    <small class="text-dark">2MB | jpeg | jpg | png</small>
                    <a href="{{url('storage/app/gambar_event/' . $event->EVENT_GAMBAR)}}" target="_blank" class="btn btn-link btn-sm">{{$event->EVENT_GAMBAR}}</a>
                    <small id="gambarError" class="text-danger"></small>
                    {{-- @error('gambar')
                        <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            
            <div class="col-sm-12 col-lg-3">
                <div class="mb-5 fv-row fv-plugins-icon-container">
                    {{-- <label class="required form-label">Arsip / Publish</label> --}}
                    <select class="form-select" id="status" name="status" onchange="getStatus()">
                        <option value="Arsip" @if($event->EVENT_ACTIVE == 'Arsip') selected @endif>Arsip</option>
                        <option value="Publish" @if($event->EVENT_ACTIVE == 'Publish') selected @endif>Publish</option>
                    </select>        
                    <small id="statusError" class="text-danger"></small>
                    {{-- @error('status')
                    <small class="text-danger"><b>{{$message}}</b></small>
                    @enderror --}}
                </div>
            </div>
            
            <div class="col-sm-12 col-lg-6">
                <button class="btn btn-primary submit">{{$event->EVENT_ACTIVE}}</button>
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
    $(document).ready(function(){
        $('#jadwal_kegiatan').daterangepicker({
            "drops": "auto",
            "opens": "center",
            "singleDatePicker": false,
            "locale": {
                "format": 'YYYY-MM-DD', // Ubah format tanggal sesuai keinginan Anda
                "separator": ' / '
            },
            "startDate": {{$event->EVENT_JADWAL_AWAL}},
            "endDate": {{$event->EVENT_JADWAL_AKHIR}}
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
        
            $('#slug').val(slug);
            $('.slug').html('Slug: ' + slug);
        }

        function createSlug(text) {
            return text.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '')
        }

        function getStatus() {
            let status = document.getElementById('status')
            let selectedValue = status.value;

            // Menampilkan nilai (value) terpilih ke konsol
            $(".submit").html(selectedValue)
        }
    })
</script>

<script>
    $(document).ready(function() {
        // $('#submitButton').on('click', function(e) {
        $('#formsaya').submit(function(e) {
            e.preventDefault();
            let csrfToken = $('input[name="_token"]').val();

            let file      = new FormData($('#formsaya')[0]);
            let deskripsi = tinymce.get('deskripsi').getContent()
            file.append('deskripsi', deskripsi)

            $.ajax({
                type: 'POST',
                url: `{{url('/events/'.$id.'/update')}}`,
                data: file,

                dataType: 'json',
                contentType: false,
                processData: false,
                headers: {
                    'X-HTTP-Method-Override': 'PATCH', //only route patch and delete
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
                        let judul = data.errors.judul
                        let deskripsi_singkat = data.errors.deskripsi_singkat
                        let kategori = data.errors.kategori
                        let jadwal_kegiatan = data.errors.jadwal_kegiatan
                        let harga = data.errors.harga
                        let diskon = data.errors.diskon
                        let gambar = data.errors.gambar
                        let deskripsi = data.errors.deskripsi
                        let status = data.errors.status
                                                
                        judul               ? $('#judulError').html('<b>'+judul+'</b>')                        : $('#judulError').html('<b></b>') 
                        deskripsi_singkat   ? $('#deskripsisingkatError').html('<b>'+deskripsi_singkat+'</b>') : $('#deskripsisingkatError').html('<b></b>') 
                        jadwal_kegiatan     ? $('#jadwalKegiatanError').html('<b>'+jadwal_kegiatan+'</b>')     : $('#jadwalKegiatanError').html('<b></b>') 
                        harga               ? $('#hargaError').html('<b>'+harga+'</b>')                        : $('#hargaError').html('<b></b>') 
                        diskon              ? $('#diskonError').html('<b>'+diskon+'</b>')                      : $('#diskonError').html('<b></b>') 
                        gambar              ? $('#gambarError').html('<b>'+gambar+'</b>')                      : $('#gambarError').html('<b></b>') 
                        deskripsi           ? $('#deskripsiError').html('<b>'+deskripsi+'</b>')                : $('#deskripsiError').html('<b></b>') 
                        status              ? $('#statusError').html('<b>'+status+'</b>')                      : $('#statusError').html('<b></b>') 
                        
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
                                window.location.href = `{{url('events')}}`;
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