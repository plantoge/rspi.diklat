<div class="mb-18 pb-10">
    <div class="mb-10">
        {{-- <div class="text-center mb-15">
            <h3 class="fs-2hx text-dark mb-5">About Us</h3>
            <div class="fs-5 text-muted fw-bold">Within the last 10 years, we have sold over 100,000 admin theme copies that have been
            <br />successfully deployed by small businesses to global enterprises</div>
        </div> --}}

        <div class="tns" style="direction: ltr">
            <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
                @if (count($gambar) >= 1)
                    @foreach ($gambar as $gmbr)
                        <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                            <img src="{{url('/storage/app/gambar_website/'.$gmbr->GAMBAR)}}" class="card-rounded shadow mw-100" alt="" />
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
        {!! $informasi->SAMBUTAN_BERANDA !!}
    </div>
</div>