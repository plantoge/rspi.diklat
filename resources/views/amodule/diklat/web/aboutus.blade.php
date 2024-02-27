@extends('layout.website.masterWebsite')

@section('css')
<style>
    .oval {
        /* width: 400px;
        height: 250px; */
        float:left;
    }
    #gambar {
        display: inline-block;
    }
</style>
@endsection
@section('konten')
<div class="mb-18">
    <div class="mb-10">
        <div class="text-center mb-15">
            <h3 class="fs-2hx text-dark mb-5">Profile</h3>
            {{-- <div class="fs-5 text-muted fw-bold">
                Within the last 10 years, we have sold over 100,000 admin theme copies that have been
                <br />successfully deployed by small businesses to global enterprises
            </div> --}}
        </div>

    </div>
    <div class="row">
        {{-- <div class="col-sm-12 col-lg-4">
        </div> --}}
        <div class="col-sm-12 col-lg-12" >
            
            <div class="float-start">
                <img src="{{url('/storage/app/gambar_website/'.$profile->GAMBAR)}}" style="display: inline-block;" class="me-5 card-rounded mw-100 mb-10">
                {{-- <img src="https://placehold.co/500x600/png" style="display: inline-block;" class="me-5 card-rounded mw-100"> --}}
            </div>
            <div class="fs-6 fw-bold text-gray-600">
                {!! $informasi->DESKRIPSI_TENTANGKAMI !!}
            </div>
        </div>
    </div>

    @include('layout.website.include.nilaiplus')

    <div class="tns mt-10" style="direction: ltr">
        <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
        @if (count($sotk) >= 1)
            @foreach ($sotk as $sotk)
                <a class="d-block overlay" data-fslightbox="lightbox-basic" href="{{url('/storage/app/gambar_website/'.$sotk->GAMBAR)}}">
                    <div class="overlay-wrapper bgi-no-repeat bgi-position-center bgi-size-cover card-rounded min-h-400px"
                        style="background-image:url('{{url('/storage/app/gambar_website/'.$sotk->GAMBAR)}}')">
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
        @endif
        ...
        </div>
    </div>

</div>
@endsection