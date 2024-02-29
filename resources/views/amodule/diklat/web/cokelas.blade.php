@extends('layout.website.masterWebsite')

@section('konten')
<form id="formcheckout" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-18 pt-0">
        <div class="text-center mb-0">
            <h3 class="fs-2hx text-dark mb-5">Checkout</h3>
            <div class="fs-5 text-muted fw-bold">Silahkan untuk membayar terlebih dahulu. jangan lupa untuk mengupload bukti pembayaran <br> dibawah ini yang sudah di sediakan</div>
        </div>
        <div class="container">
            <div class="row d-flex flex-row justify-content-center">
                <div class="col-sm-12 col-lg-5 px-10 my-10 d-flex flex-row align-items-center gap-2 justify-content-end">
                    @if ($kelas->EVENT_GAMBAR)
                    <img class="img-fluid" src="https://placehold.co/400x500/png" alt="" sizes="" srcset="">
                    @else
                    <img class="img-fluid" src="{{asset('storage/app/gambar_event/'.$kelas->EVENT_GAMBAR)}}" alt="" sizes="" srcset="">
                    @endif
                </div>
                <div class="col-sm-12 col-lg-7 px-10 my-10 d-fle flex-ro align-items-cente gap-2 justify-content-start">
                    
                    <div class="m-0 pb-3">
                        <!--begin::Invoice sidebar-->
                        <div class="d-print-none border border-dashed border-gray-300 card-rounded h-lg-100 min-w-md-350px p-9 bg-lighten">
                            <!--begin::Title-->
                            <h6 class="mb-8 fw-boldest text-gray-600 text-hover-primary">Detail Pembayaran</h6>
                            <!--end::Title-->
                            <!--begin::Item-->
                            <div class="mb-6">
                                <div class="fw-bold text-gray-600 fs-7">Rekening:</div>
                                <div class="fw-bolder text-gray-800 fs-6">123456789000</div>
                            </div>
                            <!--end::Item-->
                            <!--begin::Item-->
                            <div class="mb-6">
                                <div class="fw-bold text-gray-600 fs-7">Account:</div>
                                <div class="fw-bolder text-gray-800 fs-6">
                                    RSPI Sulianti Saroso
                                    <br/>
                                    Nama
                                </div>
                            </div>
                            <!--end::Item-->
                            {{-- <div class="mb-15">
                                <div class="fw-bold text-gray-600 fs-7">Payment Term:</div>
                                <div class="fw-bolder fs-6 text-gray-800 d-flex align-items-center">14 days
                                <span class="fs-7 text-danger d-flex align-items-center">
                                <span class="bullet bullet-dot bg-danger mx-2"></span>Due in 7 days</span></div>
                            </div> --}}
                            <!--begin::Title-->
                            <h6 class="mb-8 fw-boldest text-gray-600 text-hover-primary">Kelas</h6>
                            <!--end::Title-->
                            <!--begin::Item-->
                            <div class="mb-6">
                                <div class="fw-bold text-gray-600 fs-7">Kelas</div>
                                <div class="fw-bolder fs-6 text-gray-800">
                                    {{$kelas->EVENT_JUDUL}}
                                    <a href="{{url('info-kelas/'.$slug.'/'.$id)}}" class="link-primary ps-1">Lihat Kelas</a>
                                </div>
                            </div>
                            <div class="mb-6">
                                <div class="fw-bold text-gray-600 fs-7">Harga</div>
                                <div class="fw-bolder fs-6 text-gray-800">
                                    @if($kelas->EVENT_HARGA == 0)
                                        <span class="dw-bold"> Gratis</span>
                                    @else
                                        @if ($kelas->EVENT_DISKON == 0)
                                            <span class="dw-bold"> Rp. @matauang($kelas->EVENT_HARGA)</span>
                                        @else
                                            @php 
                                                $harga_diskon = $kelas->EVENT_HARGA - $kelas->EVENT_DISKON;
                                            @endphp
                                            {{-- <span class="fw-bold blinking-text text-danger"> Rp. @matauang($kelas->EVENT_HARGA)</span> --}}
                                            <span class="dw-bold"> Rp. @matauang($harga_diskon)</span>
                                        @endif
                                    @endif
                                </div>
                            </div>
                            
                            {{-- <div class="m-0">
                                <div class="mb-3">
                                    <label for="bukti" class="required form-label">Upload bukti pembayaran</label>
                                    <input class="form-control" type="file" id="bukti" name="bukti">
                                    <small>Maks: 2mb & jpeg,jpg,png</small>
                                </div>
                                @error('bukti')
                                    <small class="text-danger"><b>{{$message}}</b></small>
                                @enderror
                            </div> --}}
                            <!--end::Item-->
                        </div>
                        <!--end::Invoice sidebar-->
                    </div>
                    
                    <input type="text" name="id" value="{{$id}}" hidden>
                    <input type="text" name="slug" value="{{$slug}}" hidden>
                    <button 
                        type="submit" 
                        class="btn btn-success w-100"
                        {{-- onclick="window.open('https://wa.me/+62{{$informasi->WHATSAPP}}?text=I%27m%20interested%20in%20your%20car%20for%20sale', '_blank')" --}}
                        >Chat WhatsApp Admin Kami</button>
                    {{-- <a target="_blank" href="https://wa.me/+62{{$informasi->WHATSAPP}}?text=I%27m%20interested%20in%20your%20car%20for%20sale" class="btn btn-sm btn-success">Whatsapp</a> --}}
                </div>
            </div>
            
        </div>
    </div>
</form>
@endsection
@section('js')

<script>
    $(document).ready(function() {
        $('#formcheckout').submit(function(e) {
            e.preventDefault();

            Swal.fire({
                title: "Berminat dengan Event ini ?",
                text: "Halaman akan di arahkan ke Halaman WhatsApp Admin kami setelahnya",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya",
                cancelButtonText: "Gak Jadi",
            }).then((result) => {
    
                if (result.isConfirmed) {
                    let csrfToken = $('meta[name="csrf-token"]').attr('content');
                    let file      = new FormData($('#formcheckout')[0]);

                    $.ajax({
                        type: 'POST',
                        url: `{{url('/checkout-kelas-proses')}}`,
                        data: file,
                        dataType: 'json',
                        contentType: false,
                        processData: false,
                        headers: {
                            // 'X-HTTP-Method-Override': 'DELETE', //only route patch and delete
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
                            
                            if(data.status_code == 404){
                                Swal.fire({
                                    text: data.message,
                                    icon: "error",
                                    buttonsStyling: false,
                                    confirmButtonText: "Ok",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                })
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
                                        text = data.data.textwhatsapp;
                                        url = `https://wa.me/+62{{$informasi->WHATSAPP}}?text=${text}`;
                                        window.open(url, '_blank')
                                        window.location.href = `{{url('order')}}`;

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
    
                }
            });
    
        })
    
    
    })
</script>

@endsection