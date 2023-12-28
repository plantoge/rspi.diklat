<div class="row gy-5 g-xl-6">
    <!--begin::Col-->
    <div class="col-xl-6">
        <!--begin::Charts Widget 1-->
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Header-->
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column">
                    <span class="card-label fw-bolder fs-3 mb-1">PENDAPATAN DAN BELANJA KAS BLU</span>
                    {{-- <span class="card-label fw-bolder fs-3 mb-1">Realisasi Pendapatan & Belanja Kas BLU</span> --}}
                    <span class="text-muted fw-bold fs-7">Deskripsi</span>
                </h3>
                <!--begin::Toolbar-->
                {{-- <div class="card-toolbar" data-kt-buttons="true">
                    <select class="form-select form-select-sm form-select-solid w-325px" data-control="select2" data-hide-search="true" data-placeholder="Rkakl">
                        <option value="">Pilih.. </option>
                        @foreach ($master as $i)
                            <option value="{{$i->id}}">{{$i->nama_rkakl}}</option>
                        @endforeach
                    </select>
                </div> --}}
                <!--end::Toolbar-->
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body d-flex align-items-end pb-0 px-5">
                <!--begin::Chart-->
                <div id="realisasi_pendapatan" class="w-100" style="height: 350px"></div>
                <!--end::Chart-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Charts Widget 1-->
    </div>
    <!--end::Col-->
    <!--begin::Col-->
    <div class="col-xl-6">
        <!--begin::Charts Widget 1-->
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Header-->
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column">
                    <span class="card-label fw-bolder fs-3 mb-1">JUMLAH POSISI SALDO KAS</span>
                    {{-- <span class="card-label fw-bolder fs-3 mb-1">Saldo Kas BLU</span> --}}
                    <span class="text-muted fw-bold fs-7">Deskripsi</span>
                </h3>
                <!--begin::Toolbar-->
                {{-- <div class="card-toolbar" data-kt-buttons="true">
                    <select class="form-select form-select-sm form-select-solid w-325px" data-control="select2" data-hide-search="true" data-placeholder="Rkakl">
                        <option value="">Pilih.. </option>
                        @foreach ($master as $i)
                            <option value="{{$i->id}}">{{$i->nama_rkakl}}</option>
                        @endforeach
                    </select>
                </div> --}}
                <!--end::Toolbar-->
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body d-flex align-items-end pb-0 px-5">
                <!--begin::Chart-->
                <div id="saldo_kas_blu" class="w-100" style="height: 350px"></div>
                <!--end::Chart-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Charts Widget 1-->
    </div>
    <!--end::Col-->
    <!--begin::Col-->
    <div class="col-xl-6">
        <!--begin::Charts Widget 1-->
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Header-->
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column">
                    <span class="card-label fw-bolder fs-3 mb-1">SALDO REK BLU</span>
                    {{-- <span class="card-label fw-bolder fs-3 mb-1">Saldo Rekening BLU</span> --}}
                    <span class="text-muted fw-bold fs-7">Deskripsi</span>
                </h3>
                <!--begin::Toolbar-->
                {{-- <div class="card-toolbar" data-kt-buttons="true">
                    <select class="form-select form-select-sm form-select-solid w-325px" data-control="select2" data-hide-search="true" data-placeholder="Rkakl">
                        <option value="">Pilih.. </option>
                        @foreach ($master as $i)
                            <option value="{{$i->id}}">{{$i->nama_rkakl}}</option>
                        @endforeach
                    </select>
                </div> --}}
                <!--end::Toolbar-->
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body d-flex align-items-end pb-0 px-5">
                <!--begin::Chart-->
                <div id="saldo_rekening_blu" class="w-100" style="height: 350px"></div>
                <!--end::Chart-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Charts Widget 1-->
    </div>
    <!--end::Col-->
</div>