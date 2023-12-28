<div class="card bg-light text-center mt-20">
    <div class="card-body py-15">
        <div class="row">
            {{-- <div class="col-sm-12 col-lg-3">
                <div class="d-flex justify-content-center">
                    
                </div>
            </div> --}}
            <div class="col-sm-12 col-lg-4">
                <div class="d-flex justify-content-center">
                    <div class="menu menu-rounded menu-column menu-active-bg menu-hover-bg menu-title-gray-700 fs-5 fw-semibold w-250px" id="#kt_aside_menu" data-kt-menu="true">
                        <div class="menu-item">
                            <div class="menu-content pb-2">
                                <span class="menu-section text-muted text-uppercase fs-4 fw-bold">Kontak</span>
                            </div>
                        </div>
                        {{-- <div class="menu-item">
                            <a href="#" class="menu-link active border-3 border-start border-primary">
                                <span class="menu-title">All Questions</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">675</span>
                            </a>
                        </div> --}}
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Telepon</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">021-12345678</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Fax</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">021-12345678</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Call Center</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">021-12345678</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Hotline</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">021-12345678</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Email</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">support@rspiss.go.id</span>
                            </a>
                        </div>
                       
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-4">
                <div class="d-flex justify-content-center">
                    <div class="menu menu-rounded menu-column menu-active-bg menu-hover-bg menu-title-gray-700 fs-5 fw-semibold w-250px" id="#kt_aside_menu" data-kt-menu="true">
                        <div class="menu-item">
                            <div class="menu-content pb-2">
                                <span class="menu-section text-muted text-uppercase fs-4 fw-bold">Sosial Media</span>
                            </div>
                        </div>
                        {{-- <div class="menu-item">
                            <a href="#" class="menu-link active border-3 border-start border-primary">
                                <span class="menu-title">All Questions</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">675</span>
                            </a>
                        </div> --}}
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Facebook</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">facebook.com/rspi</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Instagram</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">@rspiss</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="#" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Twitter</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">@rspiss_twit</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-4">
                <div class="d-flex justify-content-center">
                    <div class="menu menu-rounded menu-column menu-active-bg menu-hover-bg menu-title-gray-700 fs-5 fw-semibold w-250px" id="#kt_aside_menu" data-kt-menu="true">
                        <div class="menu-item">
                            <div class="menu-content pb-2">
                                <span class="menu-section text-muted text-uppercase fs-4 fw-bold">Pintasan</span>
                            </div>
                        </div>
                        {{-- <div class="menu-item">
                            <a href="#" class="menu-link active border-3 border-start border-primary">
                                <span class="menu-title">All Questions</span>
                                <span class="menu-badge fs-7 fw-normal text-muted">675</span>
                            </a>
                        </div> --}}
                        <div class="menu-item">
                            <a href="{{url('/')}}" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Beranda</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="{{url('/kelas')}}" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Kelas</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="{{url('/agenda')}}" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Agenda</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a href="{{url('/about-us')}}" class="menu-link border-3 border-start border-transparent">
                                <span class="menu-title">Tentang Kami</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        {{-- <div class="row mt-10">
            <div class="col-sm-12">
                <a href="#" class="mx-4">
                    <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/facebook-4.svg')}}" class="h-30px my-2" alt="" />
                </a>
                <a href="#" class="mx-4">
                    <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/instagram-2-1')}}.svg" class="h-30px my-2" alt="" />
                </a>
            </div>
        </div> --}}
    </div>
</div>

{{-- <div class="card bg-light text-center">
    <div class="card-body py-12">
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/facebook-4.svg')}}" class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/instagram-2-1')}}.svg" class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/github.svg"')}} class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/behance.svg"')}} class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/pinterest-p.svg')}}" class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/twitter.svg"')}} class="h-30px my-2" alt="" />
        </a>
        <a href="#" class="mx-4">
            <img src="{{asset('public/Twebsite/v1/media/svg/brand-logos/dribbble-icon-1')}}.svg" class="h-30px my-2" alt="" />
        </a>
    </div>
</div> --}}