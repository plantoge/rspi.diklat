@extends('layout.website.masterWebsite')

@section('konten')

<div class="mb-18">
    <div class="mb-10">
        <div class="text-center mb-15">
            <h3 class="fs-2hx text-dark mb-5">Agenda</h3>
            <div class="fs-5 text-muted fw-bold">
                {{$informasi->DESKRIPSI_SINGKAT_AGENDA}}
            </div>
        </div>

        <div class="tns" style="direction: ltr">
            <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
                @if (count($agenda) >= 1)
                    @foreach ($agenda as $agenda)
                        <a class="d-block overlay" data-fslightbox="lightbox-basic" href="{{url('/storage/app/gambar_website/'.$agenda->GAMBAR)}}">
                            <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded min-h-400px"
                                style="background-image:url('{{url('/storage/app/gambar_website/'.$agenda->GAMBAR)}}')">
                            </div>
                        
                            <div class="overlay-layer card-rounded bg-dark bg-opacity-25 shadow">
                                <i class="bi bi-eye-fill text-white fs-3x"></i>
                            </div>
                        </a>
                    @endforeach
                @else
                    <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                        <img src="https://placehold.co/2000x800/png" class="card-rounded shadow mw-100" alt="" />
                    </div>
                    <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                        <img src="https://placehold.co/2000x800/png" class="card-rounded shadow mw-100" alt="" />
                    </div>
                @endif
                ...
            </div>
        </div>

    </div>
    <div class="fs-5 fw-bold text-gray-600">
        {!! $informasi->DESKRIPSI_AGENDA !!}
    </div>
</div>

@endsection