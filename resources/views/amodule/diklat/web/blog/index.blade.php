@extends('layout.website.masterWebsite')

@section('konten')

<div class="row">

    <div class="col-sm-12 col-lg-9">
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column">
                    <span class="card-label fw-bolder fs-1 text-dark">Blog</span>
                    {{-- <span class="text-muted mt-1 fw-bold fs-7">Latest tech trends</span> --}}
                    {{-- <span class="text-muted mt-3 fw-bold fs-7"><p>Page {{ $berita->currentPage() }} of {{ $berita->lastPage() }}</p></span> --}}
                </h3>
                
            </div>
            <div class="card-body pt-5">
                @foreach ($berita as $data)
                    <div class="row border-bottom border-secondary mb-3">
                        <div class="col-sm-12 col-lg-3">
                            <div class="symbol symbol-square symbol-200px p-3">
                                <span class="symbol-label">
                                    <img src="{{url('storage/app/gambar_berita/'.$data->BERITA_GAMBAR)}}" class="h-50 w-100 align-self-center" alt="" />
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-9">
                            <div class="d-flex align-items-center flex-row-fluid flex-wrap p-4">
                                <div class="flex-grow-1 me-2 empatbaris">
                                    <a href="{{url('/blog/'.$data->BERITA_SLUG)}}" class="text-gray-800 text-hover-primary fs-1 fw-bolder">
                                        {{$data->BERITA_TITLE}}
                                    </a>
                                    <span class="text-muted fw-bold d-block fs-7 " style="text-align: justify;">
                                        {!! $data->BERITA_KONTEN !!}
                                    </span>
                                </div>
                                {{-- <span class="badge badge-light fw-bolder my-0">+82$</span> --}}
                                <a href="{{url('/blog/'.$data->BERITA_SLUG)}}" class="btn btn-link ">Selengkapnya</a>
                            </div>
                        </div>
                    </div>                    
                @endforeach

                <div class="float-en text-end mb-5">
                    Page {{ $berita->currentPage() }} of {{ $berita->lastPage() }}
                </div>
                <div>
                    {{ $berita->appends(['search' => request('search')])->links() }}
                </div>
            </div>
        </div>
    </div>

    {{-- <div class="col-sm-12 col-lg-4">
    </div> --}}
</div>


@endsection