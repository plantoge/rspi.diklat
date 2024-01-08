<!DOCTYPE html>
<html lang="en" data-bs-theme-mode="dark">
	<head><base href="../">
		<title>Diklat by RSPISS</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="csrf-token" content="{{ csrf_token() }}">
		{{-- <meta name="description" content="Ceres admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />
		<meta name="keywords" content="Ceres theme, bootstrap, bootstrap 5, admin themes, free admin themes, bootstrap admin, bootstrap dashboard" />
		<meta charset="utf-8" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="Ceres HTML Free - Bootstrap 5 HTML Multipurpose Admin Dashboard Theme" />
		<meta property="og:url" content="https://keenthemes.com/products/ceres-html-pro" />
		<meta property="og:site_name" content="Keenthemes | Ceres HTML Free" />
		<link rel="canonical" href="Https://preview.keenthemes.com/ceres-html-free" />
		<link rel="shortcut icon" href="v1/media/logos/favicon.ico" /> --}}

		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
		<link href="{{asset('public/Twebsite/v1/plugins/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
		<link href="{{asset('public/Twebsite/v1/css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
		<link href="{{asset('public/Tdashboard/v2/plugins/custom/toastr/toastr.min.css')}}" rel="stylesheet">
		@yield('css')
		<style>
			@keyframes blink {
				0% { opacity: 1; }
				50% { opacity: 0; }
				100% { opacity: 1; }
			}
	
			.blinking-text {
				animation: blink 1s infinite;
				text-decoration: line-through;
				text-decoration-thickness: 1.5px;
			}

			.duabaris {
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
				overflow: hidden;
				text-overflow: ellipsis;
			}
		</style>
	</head>
	<body id="kt_body" style="background-image: url({{asset('public/Twebsite/v1/media/patterns/header-bg.png')}})" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled">
		<div class="d-flex flex-column flex-root">
			<div class="page d-flex flex-row flex-column-fluid">
				<div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
					
					<div id="kt_header" class="header align-items-stretch" data-kt-sticky="true" data-kt-sticky-name="header" data-kt-sticky-offset="{default: '200px', lg: '300px'}">
						<div class="container-xxl d-flex align-items-center">
							<div class="d-flex align-items-center d-lg-none ms-n2 me-3" title="Show aside menu">
								<div class="btn btn-icon btn-custom w-30px h-30px w-md-40px h-md-40px" id="kt_header_menu_mobile_toggle">
									<span class="svg-icon svg-icon-2x">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
											<path d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z" fill="black" />
											<path opacity="0.3" d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z" fill="black" />
										</svg>
									</span>
								</div>
							</div>
							<div class="header-logo me-5 me-md-10 flex-grow-1 flex-lg-grow-0">
								<a href="{{url('/')}}">
									<img alt="Logo" src="{{asset('public/Twebsite/v1/media/logos/logo-desc.png')}}" class="h-40px h-lg-60px logo-default" />
									<img alt="Logo" src="{{asset('public/Twebsite/v1/media/logos/logo-desc.png')}}" class="h-40px h-lg-60px logo-sticky" />
								</a>
							</div>
							<div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
								
								<div class="d-flex align-items-stretch" id="kt_header_nav">
									<div class="header-menu align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="header-menu" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_header_menu_mobile_toggle" data-kt-swapper="true" data-kt-swapper-mode="prepend" data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
										<div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch" id="#kt_header_menu" data-kt-menu="true">
											{{-- <div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<div class="menu-item ps-3 d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
													<div class="d-flex align-items-center flex-wrap py-0">
														<a href="##" class="btn btn-link btn-custo btn-color-secondary text-secondary btn-active-color-success my-0 me-5 me-lg-5">Beranda</a>
													</div>
												</div>
											</div> --}}

											<div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3" onclick="window.location.href='{{url('/')}}'">
													<span class="menu-title">Beranda</span>
												</span>
											</div>
											<div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3" onclick="window.location.href='{{url('/kelas')}}'">
													<span class="menu-title">Kelas</span>
												</span>
											</div>
											<div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3" onclick="window.location.href='{{url('/agenda')}}'">
													<span class="menu-title">Agenda</span>
												</span>
											</div>
											<div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3" onclick="window.location.href='{{url('/about-us')}}'">
													<span class="menu-title">Tentang Kami</span>
												</span>
											</div>
											
											{{-- <div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3">
													<span class="menu-title">Menu</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
												<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
													<div class="menu-item">
														<a class="menu-link active py-3" href="../dist/general/about.html">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Home</span>
														</a>
													</div>
												</div>
											</div> --}}
											
											{{-- <div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3">
													<span class="menu-title">Auth</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
												<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
													<div data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-placement="right-start" class="menu-item menu-accordion mb-1">
														<span class="menu-link py-3">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Base</span>
															<span class="menu-arrow"></span>
														</span>
														<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Sign-in
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Sign-up
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Two-steps Auth
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Password Reset
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">New Password
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
														</div>
													</div>
													<div data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-placement="right-start" class="menu-item menu-accordion mb-1">
														<span class="menu-link py-3">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Extended</span>
															<span class="menu-arrow"></span>
														</span>
														<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Multi-steps
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Free Trial
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Coming Soon
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
														</div>
													</div>
													<div data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-placement="right-start" class="menu-item menu-accordion mb-1">
														<span class="menu-link py-3">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">General</span>
															<span class="menu-arrow"></span>
														</span>
														<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Welcome
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Verify Email
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Password Confirmation
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Close Account
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Error 404
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Error 500
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
														</div>
													</div>
													<div data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-placement="right-start" class="menu-item menu-accordion mb-1">
														<span class="menu-link py-3">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Email</span>
															<span class="menu-arrow"></span>
														</span>
														<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
															<div class="menu-item">
																<a class="menu-link py-3" href="#" target="blank" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Verify Email
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" target="blank" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Password Reset
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
															<div class="menu-item">
																<a class="menu-link py-3" href="#" target="blank" data-kt-page="pro">
																	<span class="menu-bullet">
																		<span class="bullet bullet-dot"></span>
																	</span>
																	<span class="menu-title">Password Change
																	<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div> --}}
											
										</div>
									</div>
								</div>

								{{-- CLEAR --}}
								<div class="d-flex align-items-stretch flex-shrink-0">
									<div class="topbar d-flex align-items-stretch flex-shrink-0">
										{{-- .............. --}}

										{{-- .............. --}}

										@auth
											<div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
												<div class="cursor-pointer symbol symbol-30px symbol-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
													<img alt="Pic" src="{{url('public/Twebsite/v1/media/avatars/blank.png')}}" />
												</div>
												<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-275px" data-kt-menu="true">
													<div class="menu-item px-3">
														<div class="menu-content d-flex align-items-center px-3">
															<div class="symbol symbol-50px me-5">
																<img alt="Logo" src="{{url('public/Twebsite/v1/media/avatars/blank.png')}}" />
															</div>
															<div class="d-flex flex-column">
																<div class="fw-bolder d-flex align-items-center fs-5">{{auth()->user()->name}}
																	{{-- <span class="badge badge-light-success fw-bolder fs-8 px-2 py-1 ms-2">Pro</span> --}}
																</div>
																<a href="#" class="fw-bold text-muted text-hover-primary fs-7">{{auth()->user()->email}}</a>
															</div>
														</div>
													</div>
													<div class="separator my-2"></div>
													{{-- <div class="menu-item px-5">
														<a href="#" class="menu-link px-5">My Profile</a>
													</div> --}}
													<div class="menu-item px-5">
														<a href="{{url('/panel')}}" class="menu-link px-5">
															@if (auth()->user()->roles->contains('name', 'operator'))
																<span class="menu-text">Panel</span>
															@elseif (auth()->user()->roles->contains('name', 'visitor'))
																<span class="menu-text">My Course</span>
															@elseif (auth()->user()->roles->contains('name', 'superadmin')) 
																<span class="menu-text">Panel</span>
															@else
																<span class="menu-text">My Course</span>
															@endif
															{{-- <span class="menu-badge">
																<span class="badge badge-light-danger badge-circle fw-bolder fs-7">3</span>
															</span> --}}
														</a>
													</div>
													<div class="menu-item px-5">
														<a href="{{url('/auth-signout')}}" class="menu-link px-5">Sign Out</a>
													</div>
													{{-- <div class="separator my-2"></div>
													<div class="menu-item px-5">
														<div class="menu-content px-5">
															<label class="form-check form-switch form-check-custom form-check-solid pulse pulse-success" for="kt_user_menu_dark_mode_toggle">
																<input class="form-check-input w-30px h-20px" type="checkbox" value="1" name="mode" id="kt_user_menu_dark_mode_toggle" data-kt-url="../dist/index.html" />
																<span class="pulse-ring ms-n1"></span>
																<span class="form-check-label text-gray-600 fs-7">Dark Mode</span>
															</label>
														</div>
													</div> --}}
												</div>
											</div>
										@else	
											<div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
												<div class="d-flex align-items-center flex-wrap py-0">
													<a href="#" class="btn btn-sm btn-custo btn-secondary btn-color-dark text-dark btn-active-color-succes my-0 me-5 me-lg-5" data-bs-toggle="modal" data-bs-target="#modal_login">Masuk</a>
												</div>
											</div>
										@endauth

                                        

									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="toolbar py-5 py-lg-6" id="kt_toolbar">
						{{-- <div id="kt_toolbar_container" class="container-xxl d-flex flex-stack flex-wrap">
							<h3 class="text-white fw-bolder fs-2qx me-5">Diklat - RSPI</h3>
							<div class="d-flex align-items-center flex-wrap py-2">
								<a href="#" class="btn btn-custom btn-color-white btn-active-color-success my-2 me-2 me-lg-6" data-bs-toggle="modal" data-bs-target="#modal_login">Login</a>
							</div>
						</div> --}}
					</div>

					<div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
						<div class="content flex-row-fluid" id="kt_content">
							<div class="card">
								<div class="card-body p-lg-17">
									{{-- @php
									dd(Request::segment(1));
									@endphp --}}
									@include('layout.website.include.notif')

									@yield('konten')

									@if(Request::segment(1) == null)

										@include('layout.website.include.sambutan')
										
										{{-- @include('layout.website.include.berita') --}}
										
										@include('layout.website.include.testimoni')
										
										@include('layout.website.include.katalog_awal')
									
									@endif

									@include('layout.website.include.footer')

								</div>
							</div>
						</div>
					</div>
					<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
						<div class="container-xxl d-flex flex-column flex-md-row align-items-center justify-content-between">
							<div class="text-dark order-2 order-md-1">
								<span class="text-muted fw-bold me-1">2023 - RSPI Sulianti Saroso</span>
								{{-- <a href="https://x.com" target="_blank" class="text-gray-800 text-hover-primary">x</a> --}}
							</div>
							{{-- <ul class="menu menu-gray-600 menu-hover-primary fw-bold order-1">
								<li class="menu-item">
									<a href="#" target="_blank" class="menu-link px-2">About</a>
								</li>
								<li class="menu-item">
									<a href="#" target="_blank" class="menu-link px-2">Support</a>
								</li>
								<li class="menu-item">
									<a href="#" target="_blank" class="menu-link px-2">Purchase</a>
								</li>
							</ul> --}}
						</div>
					</div>
				</div>
			</div>
		</div>

		{{-- MODAL--------------------------------------------------------------------- --}}
		
		<div class="modal fade" id="modal_login" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog mw-650px">
				<div class="modal-content">
					<div class="modal-header pb-0 border-0 justify-content-end">
						<div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
							<span class="svg-icon svg-icon-1">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="black" />
									<rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="black" />
								</svg>
							</span>
						</div>
					</div>
					<div class="modal-body scroll-y mx-5 mx-xl-18 pt-0 pb-15">
						<div class="text-center mb-13">
							<h1 class="mb-3">Sign In</h1>
							<div class="text-muted fw-bold fs-5">Klik tautan disini jika belum punya 
							{{-- <a href="{{url('daftar')}}" class="link-primary fw-bolder">Daftar Akun</a>. --}}
                            <a href="#" class="link-primary fw-bolder" data-bs-toggle="modal" data-bs-target="#modal_register">Daftar Akun</a>
                        </div>
						</div>
						
						<div class="separator d-flex flex-center mb-8">
							<span class="text-uppercase bg-body fs-7 fw-bold text-muted px-3">atau</span>
						</div>
						<form action="{{url('auth-post-signin')}}" method="post">
							@csrf
							<input type="text" name="email" class="form-control form-control-solid mb-8" placeholder="Email">
							<input type="password" name="password" class="form-control form-control-solid mb-8" placeholder="Password">
							<button class="btn btn-md btn-bg-success w-100 fw-bold text-white">Sign In</button>
						</form>
						{{-- <button class="btn btn-md btn-bg-secondary w-100 fw-bold text-dark">Sign Up</button></button> --}}
						
						{{-- <div class="d-flex flex-stack">
							<div class="me-5 fw-bold">
								<label class="fs-6">Adding Users by Team Members</label>
								<div class="fs-7 text-muted">If you need more info, please check budget planning</div>
							</div>
							<label class="form-check form-switch form-check-custom form-check-solid">
								<input class="form-check-input" type="checkbox" value="1" checked="checked" />
								<span class="form-check-label fw-bold text-muted">Allowed</span>
							</label>
						</div> --}}
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modal_register" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog mw-650px">
				<div class="modal-content">
					<div class="modal-header pb-0 border-0 justify-content-end">
						<div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
							<span class="svg-icon svg-icon-1">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="black" />
									<rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="black" />
								</svg>
							</span>
						</div>
					</div>
					<div class="modal-body scroll-y mx-5 mx-xl-18 pt-0 pb-15">
						<div class="text-center mb-13">
							<h1 class="mb-3">Sign Up</h1>
							<div class="text-muted fw-bold fs-5">
                                Anda sudah punya akun ? 
                                <a href="#" class="link-primary fw-bolder" data-bs-toggle="modal" data-bs-target="#modal_login">Sign In</a><div class="">
                                .
                            </div>
						</div>
						{{-- <div class="btn btn-light-primary fw-bolder w-100 mb-8">
						<img alt="Logo" src="{{asset('public/Twebsite/v1/media/svg/brand-logos/google-icon.svg')}}" class="h-20px me-3" />Invite Gmail Contacts</div> --}}
						<div class="separator d-flex flex-center mb-8">
							<span class="text-uppercase bg-body fs-7 fw-bold text-muted px-3">atau</span>
						</div>
						<form action="{{url('auth-post-signup')}}" method="post">
							@csrf
							<input type="text" class="form-control form-control-solid mb-8" name="name" placeholder="Name">
							<input type="email" class="form-control form-control-solid mb-8" name="email" placeholder="Email">
							<input type="password" class="form-control form-control-solid mb-8" name="password" placeholder="Password">
							<input type="password" class="form-control form-control-solid mb-8" name="password_confirmation" placeholder="Ulangi Password">
							<input type="text" class="form-control form-control-solid mb-8" name="phone" placeholder="phone Ex: 08123456789" maxlength="16">
							<button type="submit" class="btn btn-md btn-bg-success w-100 fw-bold text-white">Sign Up</button>
						</form>
						{{-- <button class="btn btn-md btn-bg-secondary w-100 fw-bold text-dark">Sign Up</button></button> --}}
						
						{{-- <div class="d-flex flex-stack">
							<div class="me-5 fw-bold">
								<label class="fs-6">Adding Users by Team Members</label>
								<div class="fs-7 text-muted">If you need more info, please check budget planning</div>
							</div>
							<label class="form-check form-switch form-check-custom form-check-solid">
								<input class="form-check-input" type="checkbox" value="1" checked="checked" />
								<span class="form-check-label fw-bold text-muted">Allowed</span>
							</label>
						</div> --}}
					</div>
				</div>
			</div>
		</div>

        <div id="kt_scrolltop" class="scrolltop" data-kt-scrolltop="true">
			<span class="svg-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
					<rect opacity="0.5" x="13" y="6" width="13" height="2" rx="1" transform="rotate(90 13 6)" fill="black" />
					<path d="M12.5657 8.56569L16.75 12.75C17.1642 13.1642 17.8358 13.1642 18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25L12.7071 5.70711C12.3166 5.31658 11.6834 5.31658 11.2929 5.70711L5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75C6.16421 13.1642 6.83579 13.1642 7.25 12.75L11.4343 8.56569C11.7467 8.25327 12.2533 8.25327 12.5657 8.56569Z" fill="black" />
				</svg>
			</span>
		</div>

		<script>var hostUrl = "v1/";</script>
		<script src="{{url('public/Tdashboard/v2/js/jquery-3.6.3.min.js')}}"></script>
		<script src="{{asset('public/Twebsite/v1/plugins/global/plugins.bundle.js')}}"></script>
		<script src="{{asset('public/Twebsite/v1/js/scripts.bundle.js')}}"></script>
		<script src="{{asset('public/Twebsite/v1/plugins/custom/fslightbox/fslightbox.bundle.js')}}"></script>
		<script src="{{asset('public/Twebsite/v1/js/custom/widgets.js')}}"></script>
		<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
		<script src="{{asset('public/Tdashboard/v2/plugins/custom/toastr/toastr.min.js')}}"></script>
		<script src="{{url('public/Tdashboard/v2/plugins/custom/toastr/toastrku.js')}}"></script>
		<script src="{{url('public/Plugin/moment/moment.js')}}"></script>
		@yield('js')
	</body>
</html>