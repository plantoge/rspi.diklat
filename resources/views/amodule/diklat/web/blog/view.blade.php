@extends('layout.website.masterWebsite')

@section('konten')

<div class="row">

    <div class="col-sm-12 col-lg-10 offset-lg-1">
        <div class="mb-18">
            <div class="mb-10">
                <div class="text-center mb-15">
                    <h3 class="fs-2hx text-dark mb-5">{{$berita->BERITA_TITLE}}</h3>
                    <div class="fs-5 text-muted fw-bold">
                       
                    </div>
                    <div class="row my-10">
                        
                        <div class="col-lg-3 col-6">
                            <div class="item text-center">
                                <h5>
                                    Penulis
                                </h5>
                                <p>
                                    {{$berita->name}}
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="item text-center">
                                <h5>
                                    Dibuat
                                </h5>
                                <p>
                                    {{\Carbon\Carbon::parse($berita->dibuat)->format('d F Y h:i')}}
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="item text-center">
                                <h5>
                                    Diperbaharui
                                </h5>
                                <p>
                                    {{\Carbon\Carbon::parse($berita->diperbaharui)->format('d F Y h:i')}}
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6">
                            <div class="item text-center">
                                <h5>
                                    Status
                                </h5>
                                <p>
                                    Publish
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="tns" style="direction: ltr">
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
                </div>
        
            </div>
            <div class="fs-5 fw-bold text-gray-600">
                {!! $berita->BERITA_KONTEN !!}
            </div>
        </div>
    </div>

</div>


@endsection