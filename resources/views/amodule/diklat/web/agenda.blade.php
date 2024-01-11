@extends('layout.website.masterWebsite')

@section('konten')

<div class="mb-18">
    <div class="mb-10">
        <div class="text-center mb-15">
            <h3 class="fs-2hx text-dark mb-5">Agenda</h3>
            <div class="fs-5 text-muted fw-bold">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos, laboriosam maxime ut odit 
                iure nemo est magnam sed quibusdam quasi doloremque expedita aspernatur ea suscipit voluptatum vero eum esse! Repudiandae!
            </div>
        </div>

        <div class="tns" style="direction: ltr">
            <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
                @if (count($agenda) >= 1)
                    @foreach ($agenda as $agenda)
                        <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                            <img src="{{url('/storage/app/gambar_website/'.$agenda->GAMBAR)}}" class="card-rounded shadow mw-100" alt="" />
                        </div>
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