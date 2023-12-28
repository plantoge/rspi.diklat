@extends('layout.website.masterWebsite')

@section('konten')
<div class="mb-18 pt-0">
    <div class="text-center mb-0">
        <h3 class="fs-2hx text-dark mb-5">Checkout</h3>
        <div class="fs-5 text-muted fw-bold">Silahkan untuk membayar terlebih dahulu. jangan lupa untuk mengupload bukti pembayaran <br> dibawah ini yang sudah di sediakan</div>
    </div>
    <div class="container">
        <div class="row d-flex flex-row justify-content-center">
            <div class="col-sm-12 col-lg-5 px-10 my-10 d-flex flex-row align-items-center gap-2 justify-content-end">
                <img class="img-fluid" src="https://placehold.co/400x500/png" alt="" sizes="" srcset="">
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
                            <div class="fw-bolder text-gray-800 fs-6">codelabpay@codelab.co</div>
                        </div>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <div class="mb-6">
                            <div class="fw-bold text-gray-600 fs-7">Account:</div>
                            <div class="fw-bolder text-gray-800 fs-6">Nl24IBAN34553477847370033
                            <br />AMB NLANBZTC</div>
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
                            <div class="fw-bolder fs-6 text-gray-800">Judul Kelas
                            <a href="{{url('info-kelas/'.$slug.'/'.$id)}}" class="link-primary ps-1">Lihat Kelas</a></div>
                        </div>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <div class="mb-6">
                            <div class="fw-bold text-gray-600 fs-7">Completed By:</div>
                            <div class="fw-bolder text-gray-800 fs-6">Mr. Dewonte Paul</div>
                        </div>
                        <!--end::Item-->
                        <!--begin::Item-->
                        <div class="m-0">
                            <div class="mb-3">
                                <label for="formFile" class="form-label">Upload bukti pembayaran</label>
                                <input class="form-control" type="file" id="formFile">
                            </div>
                        </div>
                        <!--end::Item-->
                    </div>
                    <!--end::Invoice sidebar-->
                </div>
                <a href="{{url('panel')}}" class="btn btn-success w-100">Upload & Lanjut di Panel</a>
            </div>
        </div>
    
    </div>
</div>
@endsection