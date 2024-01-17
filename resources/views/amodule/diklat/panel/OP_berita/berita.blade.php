@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    <style>
        @media print {
            body * {
                visibility: hidden;
            }

            #btnprint, .badge {
                display: none;
            }

            #printInvoice, #printInvoice * {
                visibility: visible;
            }

            #printInvoice {
                /* position: absolute; */
                /* left: 0; */
                top: -100px;
                /* border: 0.5px solid grey; */
            }
        }
    </style>
@endsection

@section('konten')

<div id="printInvoice" class="card">
    <div class="card-body p-lg-20">
        <div class="d-flex flex-column flex-xl-row">
            <div class="flex-lg-row-fluid me-xl-18 mb-10 mb-xl-0">
                <div class="d-flex flex-stack mb-10 mb-lg-15">
                    <a href="#">
                        <img alt="Logo" class="h-50px" src="{{url('public/Twebsite/v1/media/logos/logo-desc.png')}}" />
                    </a>
                    <div class="my-1">
                        {{-- <a href="#" class="btn btn-sm btn-light me-2">Download</a> --}}
                        <a id="back" class="btn btn-sm btn-dark me-1" onclick="window.history.back()">Kembali</a>
                        <a id="btnprint" class="btn btn-sm btn-primary me-1" onclick="window.print()">Print</a>
                    </div>
                </div>
                <div class="mb-0">
                    
                    <div class="mb-18">
                        <div class="mb-10">
                            <div class="text-center mb-15">
                                <h3 class="fs-1hx text-dark mb-5">{{$berita->BERITA_TITLE}}</h3>
                                <div class="fs-5 text-muted fw-bold">
                                    <span class="badge badge-primary">{{$berita->BERITA_STATUS}}</span>
                                </div>
                            </div>
                            
                            <img src="{{url('storage/app/gambar_berita/'.$berita->BERITA_GAMBAR)}}" class="img-fluid" alt="">
                            {{-- <div class="tns" style="direction: ltr">
                                <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
                                    <a class="d-block overlay" data-fslightbox="lightbox-basic" href="{{url('/storage/app/gambar_berita/'.$berita->BERITA_GAMBAR)}}">
                                        <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded min-h-400px"
                                            style="background-image:url('{{url('/storage/app/gambar_berita/'.$berita->BERITA_GAMBAR)}}')">
                                        </div>
                                    
                                        <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                            <i class="bi bi-eye-fill text-white fs-3x"></i>
                                        </div>
                                    </a>
                                    ...
                                </div>
                            </div> --}}
                    
                        </div>
                        <div class="fs-5 fw-bold text-gray-600">
                            {!! $berita->BERITA_KONTEN !!}
                        </div>
                        <small class="text-muted float-end">Created : {{$berita->name}} - {{$berita->created_at}}</small>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
</div>

@endsection

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.js')}}"></script>
@endsection