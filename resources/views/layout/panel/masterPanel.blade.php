<!DOCTYPE html>
<html lang="en">
	<head><base href="../">
		<title>RSPISS - Upanel</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		{{-- <meta name="description" content="Ceres admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />
		<meta name="keywords" content="Ceres theme, bootstrap, bootstrap 5, admin themes, free admin themes, bootstrap admin, bootstrap dashboard" />
		<meta charset="utf-8" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="Ceres HTML Free - Bootstrap 5 HTML Multipurpose Admin Dashboard Theme" />
		<meta property="og:url" content="https://keenthemes.com/products/ceres-html-pro" />
		<meta property="og:site_name" content="Keenthemes | Ceres HTML Free" />
		<link rel="canonical" href="Https://preview.keenthemes.com/ceres-html-free" />
		<link rel="shortcut icon" href="assets/media/logos/favicon.ico" /> --}}
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<link href="{{url('public/Twebsite/v1/plugins/custom/fullcalendar/fullcalendar.bundle.css')}}" rel="stylesheet" type="text/css" />
		<link href="{{url('public/Twebsite/v1/plugins/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
		<link href="{{url('public/Twebsite/v1/css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
	</head>
	<body id="kt_body" style="background-image: url({{url('public/Twebsite/v1/media/patterns/header-bg.png')}})" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled aside-enabled">
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
								<a href="../dist/index.html">
									<img alt="Logo" src="{{url('public/Twebsite/v1/media/logos/logo-light.svg')}}" class="h-15px h-lg-20px logo-default" />
									<img alt="Logo" src="{{url('public/Twebsite/v1/media/logos/logo-default.svg')}}" class="h-15px h-lg-20px logo-sticky" />
								</a>
							</div>
							<div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
								<div class="d-flex align-items-stretch" id="kt_header_nav">
									<div class="header-menu align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="header-menu" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_header_menu_mobile_toggle" data-kt-swapper="true" data-kt-swapper-mode="prepend" data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
										<div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch" id="#kt_header_menu" data-kt-menu="true">
											
											{{-- MENU --}}
											{{-- <div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3">
													<span class="menu-title">Pages</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
												<div class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown menu-rounded-0 py-lg-4 w-lg-225px">
													<div class="menu-item">
														<a class="menu-link py-3" href="../dist/general/about.html">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">About Us</span>
														</a>
													</div>
													<div class="menu-item">
														<a class="menu-link py-3" href="../dist/general/invoice.html">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Invoice</span>
														</a>
													</div>
													<div class="menu-item">
														<a class="menu-link py-3" href="../dist/general/faq.html">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">FAQ</span>
														</a>
													</div>
													<div class="menu-item">
														<a class="menu-link py-3" href="#" data-kt-page="pro">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Wizard
															<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
														</a>
													</div>
													<div class="menu-item">
														<a class="menu-link py-3" href="#" data-kt-page="pro">
															<span class="menu-bullet">
																<span class="bullet bullet-dot"></span>
															</span>
															<span class="menu-title">Pricing
															<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
														</a>
													</div>
												</div>
											</div>
											<div data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3" onclick="window.location.href='#'">
													<span class="menu-title">Menu Single</span>
												</span>
											</div> --}}
										</div>
									</div>
								</div>
								<div class="d-flex align-items-stretch flex-shrink-0">
									<div class="topbar d-flex align-items-stretch flex-shrink-0">

                                        {{-- notifikasi --}}
										{{-- <div class="d-flex align-items-center ms-1 ms-lg-3">
											<div class="btn btn-icon btn-custom btn-active-light position-relative w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
												<span class="svg-icon svg-icon-1">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
														<path d="M11.2929 2.70711C11.6834 2.31658 12.3166 2.31658 12.7071 2.70711L15.2929 5.29289C15.6834 5.68342 15.6834 6.31658 15.2929 6.70711L12.7071 9.29289C12.3166 9.68342 11.6834 9.68342 11.2929 9.29289L8.70711 6.70711C8.31658 6.31658 8.31658 5.68342 8.70711 5.29289L11.2929 2.70711Z" fill="black" />
														<path d="M11.2929 14.7071C11.6834 14.3166 12.3166 14.3166 12.7071 14.7071L15.2929 17.2929C15.6834 17.6834 15.6834 18.3166 15.2929 18.7071L12.7071 21.2929C12.3166 21.6834 11.6834 21.6834 11.2929 21.2929L8.70711 18.7071C8.31658 18.3166 8.31658 17.6834 8.70711 17.2929L11.2929 14.7071Z" fill="black" />
														<path opacity="0.3" d="M5.29289 8.70711C5.68342 8.31658 6.31658 8.31658 6.70711 8.70711L9.29289 11.2929C9.68342 11.6834 9.68342 12.3166 9.29289 12.7071L6.70711 15.2929C6.31658 15.6834 5.68342 15.6834 5.29289 15.2929L2.70711 12.7071C2.31658 12.3166 2.31658 11.6834 2.70711 11.2929L5.29289 8.70711Z" fill="black" />
														<path opacity="0.3" d="M17.2929 8.70711C17.6834 8.31658 18.3166 8.31658 18.7071 8.70711L21.2929 11.2929C21.6834 11.6834 21.6834 12.3166 21.2929 12.7071L18.7071 15.2929C18.3166 15.6834 17.6834 15.6834 17.2929 15.2929L14.7071 12.7071C14.3166 12.3166 14.3166 11.6834 14.7071 11.2929L17.2929 8.70711Z" fill="black" />
													</svg>
												</span>
											</div>
											<div class="menu menu-sub menu-sub-dropdown menu-column w-350px w-lg-375px" data-kt-menu="true">
												<div class="d-flex flex-column bgi-no-repeat rounded-top" style="background-image:url('{{url('public/Twebsite/v1/media/patterns/dropdown-header-bg.png')}}')">
													<h3 class="text-white fw-bold px-9 mt-10 mb-6">Notifications
													<span class="fs-8 opacity-75 ps-3">24 reports</span></h3>
													<ul class="nav nav-line-tabs nav-line-tabs-2x nav-stretch fw-bold px-9">
														<li class="nav-item">
															<a class="nav-link text-white opacity-75 opacity-state-100 pb-4 active" data-bs-toggle="tab" href="#kt_topbar_notifications_1">Alerts</a>
														</li>
														<li class="nav-item">
															<a class="nav-link text-white opacity-75 opacity-state-100 pb-4" data-bs-toggle="tab" href="#kt_topbar_notifications_2">Updates</a>
														</li>
														<li class="nav-item">
															<a class="nav-link text-white opacity-75 opacity-state-100 pb-4" data-bs-toggle="tab" href="#kt_topbar_notifications_3">Logs</a>
														</li>
													</ul>
												</div>
												<div class="tab-content">
													<div class="tab-pane fade show active" id="kt_topbar_notifications_1" role="tabpanel">
														<div class="scroll-y mh-325px my-5 px-8">
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-primary">
																			<span class="svg-icon svg-icon-2 svg-icon-primary">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<path opacity="0.3" d="M11 6.5C11 9 9 11 6.5 11C4 11 2 9 2 6.5C2 4 4 2 6.5 2C9 2 11 4 11 6.5ZM17.5 2C15 2 13 4 13 6.5C13 9 15 11 17.5 11C20 11 22 9 22 6.5C22 4 20 2 17.5 2ZM6.5 13C4 13 2 15 2 17.5C2 20 4 22 6.5 22C9 22 11 20 11 17.5C11 15 9 13 6.5 13ZM17.5 13C15 13 13 15 13 17.5C13 20 15 22 17.5 22C20 22 22 20 22 17.5C22 15 20 13 17.5 13Z" fill="black" />
																					<path d="M17.5 16C17.5 16 17.4 16 17.5 16L16.7 15.3C16.1 14.7 15.7 13.9 15.6 13.1C15.5 12.4 15.5 11.6 15.6 10.8C15.7 9.99999 16.1 9.19998 16.7 8.59998L17.4 7.90002H17.5C18.3 7.90002 19 7.20002 19 6.40002C19 5.60002 18.3 4.90002 17.5 4.90002C16.7 4.90002 16 5.60002 16 6.40002V6.5L15.3 7.20001C14.7 7.80001 13.9 8.19999 13.1 8.29999C12.4 8.39999 11.6 8.39999 10.8 8.29999C9.99999 8.19999 9.20001 7.80001 8.60001 7.20001L7.89999 6.5V6.40002C7.89999 5.60002 7.19999 4.90002 6.39999 4.90002C5.59999 4.90002 4.89999 5.60002 4.89999 6.40002C4.89999 7.20002 5.59999 7.90002 6.39999 7.90002H6.5L7.20001 8.59998C7.80001 9.19998 8.19999 9.99999 8.29999 10.8C8.39999 11.5 8.39999 12.3 8.29999 13.1C8.19999 13.9 7.80001 14.7 7.20001 15.3L6.5 16H6.39999C5.59999 16 4.89999 16.7 4.89999 17.5C4.89999 18.3 5.59999 19 6.39999 19C7.19999 19 7.89999 18.3 7.89999 17.5V17.4L8.60001 16.7C9.20001 16.1 9.99999 15.7 10.8 15.6C11.5 15.5 12.3 15.5 13.1 15.6C13.9 15.7 14.7 16.1 15.3 16.7L16 17.4V17.5C16 18.3 16.7 19 17.5 19C18.3 19 19 18.3 19 17.5C19 16.7 18.3 16 17.5 16Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Project Alice</a>
																		<div class="text-gray-400 fs-7">Phase 1 development</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">1 hr</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-danger">
																			<span class="svg-icon svg-icon-2 svg-icon-danger">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="black" />
																					<rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="black" />
																					<rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">HR Confidential</a>
																		<div class="text-gray-400 fs-7">Confidential staff documents</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">2 hrs</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-warning">
																			<span class="svg-icon svg-icon-2 svg-icon-warning">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<path opacity="0.3" d="M20 15H4C2.9 15 2 14.1 2 13V7C2 6.4 2.4 6 3 6H21C21.6 6 22 6.4 22 7V13C22 14.1 21.1 15 20 15ZM13 12H11C10.5 12 10 12.4 10 13V16C10 16.5 10.4 17 11 17H13C13.6 17 14 16.6 14 16V13C14 12.4 13.6 12 13 12Z" fill="black" />
																					<path d="M14 6V5H10V6H8V5C8 3.9 8.9 3 10 3H14C15.1 3 16 3.9 16 5V6H14ZM20 15H14V16C14 16.6 13.5 17 13 17H11C10.5 17 10 16.6 10 16V15H4C3.6 15 3.3 14.9 3 14.7V18C3 19.1 3.9 20 5 20H19C20.1 20 21 19.1 21 18V14.7C20.7 14.9 20.4 15 20 15Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Company HR</a>
																		<div class="text-gray-400 fs-7">Corporeate staff profiles</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">5 hrs</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-success">
																			<span class="svg-icon svg-icon-2 svg-icon-success">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<path opacity="0.3" d="M5 15C3.3 15 2 13.7 2 12C2 10.3 3.3 9 5 9H5.10001C5.00001 8.7 5 8.3 5 8C5 5.2 7.2 3 10 3C11.9 3 13.5 4 14.3 5.5C14.8 5.2 15.4 5 16 5C17.7 5 19 6.3 19 8C19 8.4 18.9 8.7 18.8 9C18.9 9 18.9 9 19 9C20.7 9 22 10.3 22 12C22 13.7 20.7 15 19 15H5ZM5 12.6H13L9.7 9.29999C9.3 8.89999 8.7 8.89999 8.3 9.29999L5 12.6Z" fill="black" />
																					<path d="M17 17.4V12C17 11.4 16.6 11 16 11C15.4 11 15 11.4 15 12V17.4H17Z" fill="black" />
																					<path opacity="0.3" d="M12 17.4H20L16.7 20.7C16.3 21.1 15.7 21.1 15.3 20.7L12 17.4Z" fill="black" />
																					<path d="M8 12.6V18C8 18.6 8.4 19 9 19C9.6 19 10 18.6 10 18V12.6H8Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Project Jet</a>
																		<div class="text-gray-400 fs-7">New frontend admin theme</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">2 days</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-primary">
																			<span class="svg-icon svg-icon-2 svg-icon-primary">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<path opacity="0.3" d="M6 22H4V3C4 2.4 4.4 2 5 2C5.6 2 6 2.4 6 3V22Z" fill="black" />
																					<path d="M18 14H4V4H18C18.8 4 19.2 4.9 18.7 5.5L16 9L18.8 12.5C19.3 13.1 18.8 14 18 14Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Project Breafing</a>
																		<div class="text-gray-400 fs-7">Product launch status update</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">21 Jan</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-info">
																			<span class="svg-icon svg-icon-2 svg-icon-info">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																					<path opacity="0.3" d="M22 5V19C22 19.6 21.6 20 21 20H19.5L11.9 12.4C11.5 12 10.9 12 10.5 12.4L3 20C2.5 20 2 19.5 2 19V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5ZM7.5 7C6.7 7 6 7.7 6 8.5C6 9.3 6.7 10 7.5 10C8.3 10 9 9.3 9 8.5C9 7.7 8.3 7 7.5 7Z" fill="black" />
																					<path d="M19.1 10C18.7 9.60001 18.1 9.60001 17.7 10L10.7 17H2V19C2 19.6 2.4 20 3 20H21C21.6 20 22 19.6 22 19V12.9L19.1 10Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Banner Assets</a>
																		<div class="text-gray-400 fs-7">Collection of banner images</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">21 Jan</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center">
																	<div class="symbol symbol-35px me-4">
																		<span class="symbol-label bg-light-warning">
																			<span class="svg-icon svg-icon-2 svg-icon-warning">
																				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
																					<path opacity="0.3" d="M8.9 21L7.19999 22.6999C6.79999 23.0999 6.2 23.0999 5.8 22.6999L4.1 21H8.9ZM4 16.0999L2.3 17.8C1.9 18.2 1.9 18.7999 2.3 19.1999L4 20.9V16.0999ZM19.3 9.1999L15.8 5.6999C15.4 5.2999 14.8 5.2999 14.4 5.6999L9 11.0999V21L19.3 10.6999C19.7 10.2999 19.7 9.5999 19.3 9.1999Z" fill="black" />
																					<path d="M21 15V20C21 20.6 20.6 21 20 21H11.8L18.8 14H20C20.6 14 21 14.4 21 15ZM10 21V4C10 3.4 9.6 3 9 3H4C3.4 3 3 3.4 3 4V21C3 21.6 3.4 22 4 22H9C9.6 22 10 21.6 10 21ZM7.5 18.5C7.5 19.1 7.1 19.5 6.5 19.5C5.9 19.5 5.5 19.1 5.5 18.5C5.5 17.9 5.9 17.5 6.5 17.5C7.1 17.5 7.5 17.9 7.5 18.5Z" fill="black" />
																				</svg>
																			</span>
																		</span>
																	</div>
																	<div class="mb-0 me-2">
																		<a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Icon Assets</a>
																		<div class="text-gray-400 fs-7">Collection of SVG icons</div>
																	</div>
																</div>
																<span class="badge badge-light fs-8">20 March</span>
															</div>
														</div>
														<div class="py-3 text-center border-top">
															<a href="../dist/account/activity.html" class="btn btn-color-gray-600 btn-active-color-primary">View All
															<span class="svg-icon svg-icon-5">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																	<rect opacity="0.5" x="18" y="13" width="13" height="2" rx="1" transform="rotate(-180 18 13)" fill="black" />
																	<path d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z" fill="black" />
																</svg>
															</span>
														</div>
													</div>
													<div class="tab-pane fade" id="kt_topbar_notifications_2" role="tabpanel">
														<div class="d-flex flex-column px-9">
															<div class="pt-10 pb-0">
																<h3 class="text-dark text-center fw-bolder">Get Pro Access</h3>
																<div class="text-center text-gray-600 fw-bold pt-1">Outlines keep you honest. They stoping you from amazing poorly about drive</div>
																<div class="text-center mt-5 mb-9">
																	<a href="#" class="btn btn-sm btn-primary px-6" data-bs-toggle="modal" data-bs-target="#kt_modal_create_app">Join Now</a>
																</div>
															</div>
															<div class="text-center mb-5 px-4">
																<img src="assets/media/illustrations/dozzy-1/3.png" alt="" class="w-100 mh-175px" />
															</div>
														</div>
													</div>
													<div class="tab-pane fade" id="kt_topbar_notifications_3" role="tabpanel">
														<div class="scroll-y mh-325px my-5 px-8">
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-success me-4">200 OK</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">New order</a>
																</div>
																<span class="badge badge-light fs-8">Just now</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-danger me-4">500 ERR</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">New customer</a>
																</div>
																<span class="badge badge-light fs-8">2 hrs</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-success me-4">200 OK</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Payment process</a>
																</div>
																<span class="badge badge-light fs-8">5 hrs</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-warning me-4">300 WRN</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Search query</a>
																</div>
																<span class="badge badge-light fs-8">2 days</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-success me-4">200 OK</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">API connection</a>
																</div>
																<span class="badge badge-light fs-8">1 week</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-success me-4">200 OK</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Database restore</a>
																</div>
																<span class="badge badge-light fs-8">Mar 5</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-warning me-4">300 WRN</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">System update</a>
																</div>
																<span class="badge badge-light fs-8">May 15</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-warning me-4">300 WRN</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Server OS update</a>
																</div>
																<span class="badge badge-light fs-8">Apr 3</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-warning me-4">300 WRN</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">API rollback</a>
																</div>
																<span class="badge badge-light fs-8">Jun 30</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-danger me-4">500 ERR</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Refund process</a>
																</div>
																<span class="badge badge-light fs-8">Jul 10</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-danger me-4">500 ERR</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Withdrawal process</a>
																</div>
																<span class="badge badge-light fs-8">Sep 10</span>
															</div>
															<div class="d-flex flex-stack py-4">
																<div class="d-flex align-items-center me-2">
																	<span class="w-70px badge badge-light-danger me-4">500 ERR</span>
																	<a href="#" class="text-gray-800 text-hover-primary fw-bold">Mail tasks</a>
																</div>
																<span class="badge badge-light fs-8">Dec 10</span>
															</div>
														</div>
														<div class="py-3 text-center border-top">
															<a href="#" class="btn btn-color-gray-600 btn-active-color-primary">View All
															<span class="svg-icon svg-icon-5">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																	<rect opacity="0.5" x="18" y="13" width="13" height="2" rx="1" transform="rotate(-180 18 13)" fill="black" />
																	<path d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z" fill="black" />
																</svg>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div> --}}
										
										<div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
											<div class="cursor-pointer symbol symbol-30px symbol-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
												<img alt="Pic" src="{{url('public/Twebsite/v1/media/avatars/150-26.jpg')}}" />
											</div>
											<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-275px" data-kt-menu="true">
												<div class="menu-item px-3">
													<div class="menu-content d-flex align-items-center px-3">
														<div class="symbol symbol-50px me-5">
															<img alt="Logo" src="{{url('public/Twebsite/v1/media/avatars/150-26.jpg')}}" />
														</div>
														<div class="d-flex flex-column">
															<div class="fw-bolder d-flex align-items-center fs-5">Max Smith
															<span class="badge badge-light-success fw-bolder fs-8 px-2 py-1 ms-2">Pro</span></div>
															<a href="#" class="fw-bold text-muted text-hover-primary fs-7">max@kt.com</a>
														</div>
													</div>
												</div>
												<div class="separator my-2"></div>
												<div class="menu-item px-5">
													<a href="#" class="menu-link px-5">My Profile</a>
												</div>
												<div class="menu-item px-5">
													<a href="#" class="menu-link px-5">
														<span class="menu-text">My Course</span>
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

										<div class="d-flex align-items-center d-lg-none ms-4" title="Show header menu">
											<div class="btn btn-icon btn-custom w-30px h-30px w-md-40px h-md-40px" id="kt_aside_mobile_toggle">
												<span class="svg-icon svg-icon-1">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
														<path d="M13 11H3C2.4 11 2 10.6 2 10V9C2 8.4 2.4 8 3 8H13C13.6 8 14 8.4 14 9V10C14 10.6 13.6 11 13 11ZM22 5V4C22 3.4 21.6 3 21 3H3C2.4 3 2 3.4 2 4V5C2 5.6 2.4 6 3 6H21C21.6 6 22 5.6 22 5Z" fill="black" />
														<path opacity="0.3" d="M21 16H3C2.4 16 2 15.6 2 15V14C2 13.4 2.4 13 3 13H21C21.6 13 22 13.4 22 14V15C22 15.6 21.6 16 21 16ZM14 20V19C14 18.4 13.6 18 13 18H3C2.4 18 2 18.4 2 19V20C2 20.6 2.4 21 3 21H13C13.6 21 14 20.6 14 20Z" fill="black" />
													</svg>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="toolbar py-5 py-lg-6" id="kt_toolbar">
						{{-- <div id="kt_toolbar_container" class="container-xxl d-flex flex-stack flex-wrap">
							<h3 class="text-white fw-bolder fs-2qx me-5">Nama User</h3>
							<div class="d-flex align-items-center flex-wrap py-2">
								<a href="#" class="btn btn-custom btn-color-white btn-active-color-success my-2 me-2 me-lg-6" data-bs-toggle="modal" data-bs-target="#kt_modal_invite_friends">Invite Friend</a>
								<a href="#" class="btn btn-success my-2" tooltip="New App" data-bs-toggle="modal" data-bs-target="#kt_modal_create_app">New Goal</a>
							</div>
						</div> --}}
					</div>
					<div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
						
						<div id="kt_aside" class="aside card" data-kt-drawer="true" data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_mobile_toggle" data-kt-sticky="true" data-kt-sticky-name="aside-sticky" data-kt-sticky-offset="{default: false, lg: '200px'}" data-kt-sticky-width="{lg: '265px'}" data-kt-sticky-left="auto" data-kt-sticky-top="95px" data-kt-sticky-animation="false" data-kt-sticky-zindex="95">
							<div class="aside-menu flex-column-fluid">
								<div class="hover-scroll-overlay-y my-5 my-lg-6" id="kt_aside_menu_wrapper" data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_header, #kt_toolbar, #kt_aside_footer, #kt_footer" data-kt-scroll-wrappers="#kt_aside, #kt_aside_menu" data-kt-scroll-offset="0px">
									<div class="d-flex flex-center flex-column mb-10">
										<div class="symbol mb-3 symbol-100px symbol-circle">
											<img alt="Pic" src="{{url('public/Twebsite/v1/media/avatars/150-26.jpg')}}" />
										</div>
										<a href="#" class="fs-2 text-gray-800 text-hover-primary fw-bolder mb-1">{{auth()->user()->name}}</a>
										<div class="fs-7 fw-bold text-gray-400 mb-2">{{auth()->user()->email}}</div>
										{{-- <div class="d-flex flex-center">
											<a href="#" class="btn btn-sm btn-light-primary py-2 px-4 fw-bolder me-2" data-kt-drawer-show="true" data-kt-drawer-target="#kt_drawer_chat">Send Message</a>
										</div> --}}
									</div>
									
									<div class="menu menu-column menu-title-gray-800 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500" id="#kt_aside_menu" data-kt-menu="true">
										<div class="menu-item">
											<a class="menu-link" href="#" data-kt-page="pro">
												<span class="menu-icon">
													<i class="fas fa-coins fa-lg"></i>
												</span>
												<span class="menu-title">Transaksi Saya
												{{-- <span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span> --}}
											</a>
										</div>
										{{-- <div data-kt-menu-trigger="click" class="menu-item menu-accordion mb-1">
											<span class="menu-link">
												<span class="menu-icon">
													<span class="svg-icon svg-icon-2">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
															<path opacity="0.3" d="M22 12C22 17.5 17.5 22 12 22C6.5 22 2 17.5 2 12C2 6.5 6.5 2 12 2C17.5 2 22 6.5 22 12ZM12 7C10.3 7 9 8.3 9 10C9 11.7 10.3 13 12 13C13.7 13 15 11.7 15 10C15 8.3 13.7 7 12 7Z" fill="black" />
															<path d="M12 22C14.6 22 17 21 18.7 19.4C17.9 16.9 15.2 15 12 15C8.8 15 6.09999 16.9 5.29999 19.4C6.99999 21 9.4 22 12 22Z" fill="black" />
														</svg>
													</span>
												</span>
												<span class="menu-title">Account</span>
												<span class="menu-arrow"></span>
											</span>
											<div class="menu-sub menu-sub-accordion">
												<div class="menu-item">
													<a class="menu-link" href="../dist/account/overview.html">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">Overview</span>
													</a>
												</div>
												<div class="menu-item">
													<a class="menu-link" href="#" data-kt-page="pro">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">Settings
														<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
													</a>
												</div>
												<div class="menu-item">
													<a class="menu-link" href="#" data-kt-page="pro">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">Security
														<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
													</a>
												</div>
												<div class="menu-item">
													<a class="menu-link" href="#" data-kt-page="pro">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">Audit Logs
														<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
													</a>
												</div>
												<div class="menu-item">
													<a class="menu-link" href="../dist/account/activity.html">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">Activity</span>
													</a>
												</div>
											</div>
										</div> --}}
										
										{{-- <div class="menu-item">
											<a class="menu-link" href="#" data-kt-page="pro">
												<span class="menu-icon">
													<span class="svg-icon svg-icon-2">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
															<path opacity="0.3" d="M21 22H3C2.4 22 2 21.6 2 21V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5V21C22 21.6 21.6 22 21 22Z" fill="black" />
															<path d="M6 6C5.4 6 5 5.6 5 5V3C5 2.4 5.4 2 6 2C6.6 2 7 2.4 7 3V5C7 5.6 6.6 6 6 6ZM11 5V3C11 2.4 10.6 2 10 2C9.4 2 9 2.4 9 3V5C9 5.6 9.4 6 10 6C10.6 6 11 5.6 11 5ZM15 5V3C15 2.4 14.6 2 14 2C13.4 2 13 2.4 13 3V5C13 5.6 13.4 6 14 6C14.6 6 15 5.6 15 5ZM19 5V3C19 2.4 18.6 2 18 2C17.4 2 17 2.4 17 3V5C17 5.6 17.4 6 18 6C18.6 6 19 5.6 19 5Z" fill="black" />
															<path d="M8.8 13.1C9.2 13.1 9.5 13 9.7 12.8C9.9 12.6 10.1 12.3 10.1 11.9C10.1 11.6 10 11.3 9.8 11.1C9.6 10.9 9.3 10.8 9 10.8C8.8 10.8 8.59999 10.8 8.39999 10.9C8.19999 11 8.1 11.1 8 11.2C7.9 11.3 7.8 11.4 7.7 11.6C7.6 11.8 7.5 11.9 7.5 12.1C7.5 12.2 7.4 12.2 7.3 12.3C7.2 12.4 7.09999 12.4 6.89999 12.4C6.69999 12.4 6.6 12.3 6.5 12.2C6.4 12.1 6.3 11.9 6.3 11.7C6.3 11.5 6.4 11.3 6.5 11.1C6.6 10.9 6.8 10.7 7 10.5C7.2 10.3 7.49999 10.1 7.89999 10C8.29999 9.90003 8.60001 9.80003 9.10001 9.80003C9.50001 9.80003 9.80001 9.90003 10.1 10C10.4 10.1 10.7 10.3 10.9 10.4C11.1 10.5 11.3 10.8 11.4 11.1C11.5 11.4 11.6 11.6 11.6 11.9C11.6 12.3 11.5 12.6 11.3 12.9C11.1 13.2 10.9 13.5 10.6 13.7C10.9 13.9 11.2 14.1 11.4 14.3C11.6 14.5 11.8 14.7 11.9 15C12 15.3 12.1 15.5 12.1 15.8C12.1 16.2 12 16.5 11.9 16.8C11.8 17.1 11.5 17.4 11.3 17.7C11.1 18 10.7 18.2 10.3 18.3C9.9 18.4 9.5 18.5 9 18.5C8.5 18.5 8.1 18.4 7.7 18.2C7.3 18 7 17.8 6.8 17.6C6.6 17.4 6.4 17.1 6.3 16.8C6.2 16.5 6.10001 16.3 6.10001 16.1C6.10001 15.9 6.2 15.7 6.3 15.6C6.4 15.5 6.6 15.4 6.8 15.4C6.9 15.4 7.00001 15.4 7.10001 15.5C7.20001 15.6 7.3 15.6 7.3 15.7C7.5 16.2 7.7 16.6 8 16.9C8.3 17.2 8.6 17.3 9 17.3C9.2 17.3 9.5 17.2 9.7 17.1C9.9 17 10.1 16.8 10.3 16.6C10.5 16.4 10.5 16.1 10.5 15.8C10.5 15.3 10.4 15 10.1 14.7C9.80001 14.4 9.50001 14.3 9.10001 14.3C9.00001 14.3 8.9 14.3 8.7 14.3C8.5 14.3 8.39999 14.3 8.39999 14.3C8.19999 14.3 7.99999 14.2 7.89999 14.1C7.79999 14 7.7 13.8 7.7 13.7C7.7 13.5 7.79999 13.4 7.89999 13.2C7.99999 13 8.2 13 8.5 13H8.8V13.1ZM15.3 17.5V12.2C14.3 13 13.6 13.3 13.3 13.3C13.1 13.3 13 13.2 12.9 13.1C12.8 13 12.7 12.8 12.7 12.6C12.7 12.4 12.8 12.3 12.9 12.2C13 12.1 13.2 12 13.6 11.8C14.1 11.6 14.5 11.3 14.7 11.1C14.9 10.9 15.2 10.6 15.5 10.3C15.8 10 15.9 9.80003 15.9 9.70003C15.9 9.60003 16.1 9.60004 16.3 9.60004C16.5 9.60004 16.7 9.70003 16.8 9.80003C16.9 9.90003 17 10.2 17 10.5V17.2C17 18 16.7 18.4 16.2 18.4C16 18.4 15.8 18.3 15.6 18.2C15.4 18.1 15.3 17.8 15.3 17.5Z" fill="black" />
														</svg>
													</span>
												</span>
												<span class="menu-title">Calendar
												<span class="badge badge-pro badge-light-danger fw-bold fs-9 px-2 py-1 ms-1">Pro</span></span>
											</a>
										</div> --}}
									</div>
								</div>
							</div>
							<div class="aside-footer flex-column-auto pt-5 pb-7 px-5" id="kt_aside_footer">
								<a href="../dist/documentation/getting-started.html" class="btn btn-custom btn-primary w-100" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss-="click" title="200+ in-house components and 3rd-party plugins">
									<span class="btn-label">Docs &amp; Components</span>
									<span class="svg-icon btn-icon svg-icon-2">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
											<path opacity="0.3" d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22ZM15 17C15 16.4 14.6 16 14 16H8C7.4 16 7 16.4 7 17C7 17.6 7.4 18 8 18H14C14.6 18 15 17.6 15 17ZM17 12C17 11.4 16.6 11 16 11H8C7.4 11 7 11.4 7 12C7 12.6 7.4 13 8 13H16C16.6 13 17 12.6 17 12ZM17 7C17 6.4 16.6 6 16 6H8C7.4 6 7 6.4 7 7C7 7.6 7.4 8 8 8H16C16.6 8 17 7.6 17 7Z" fill="black" />
											<path d="M15 8H20L14 2V7C14 7.6 14.4 8 15 8Z" fill="black" />
										</svg>
									</span>
								</a>
							</div>
						</div>

						<div class="content flex-row-fluid" id="kt_content">
							<div class="card card-page">
								<div class="card-body">
									{{-- <div class="row g-5 g-xl-8">
										<div class="col-xxl-6">
											<div class="card card-xl-stretch mb-5 mb-xl-8">
												<div class="card-header align-items-center border-0 mt-5">
													<h3 class="card-title align-items-start flex-column">
														<span class="fw-bolder text-dark fs-2">Folders</span>
														<span class="text-gray-400 mt-2 fw-bold fs-6">32 Active Folders</span>
													</h3>
													<div class="card-toolbar">
														<button type="button" class="btn btn-sm btn-icon btn-icon-primary btn-active-light-primary me-n3" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
															<span class="svg-icon svg-icon-2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="5" y="5" width="5" height="5" rx="1" fill="#000000" />
																		<rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																		<rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																		<rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																	</g>
																</svg>
															</span>
														</button>
														<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3" data-kt-menu="true">
															<div class="menu-item px-3">
																<div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Payments</div>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3">Create Invoice</a>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link flex-stack px-3">Create Payment
																<i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Specify a target name for future usage and reference"></i></a>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3">Generate Bill</a>
															</div>
															<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-end">
																<a href="#" class="menu-link px-3">
																	<span class="menu-title">Subscription</span>
																	<span class="menu-arrow"></span>
																</a>
																<div class="menu-sub menu-sub-dropdown w-175px py-4">
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Plans</a>
																	</div>
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Billing</a>
																	</div>
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Statements</a>
																	</div>
																	<div class="separator my-2"></div>
																	<div class="menu-item px-3">
																		<div class="menu-content px-3">
																			<label class="form-check form-switch form-check-custom form-check-solid">
																				<input class="form-check-input w-30px h-20px" type="checkbox" value="1" checked="checked" name="notifications" />
																				<span class="form-check-label text-muted fs-6">Recuring</span>
																			</label>
																		</div>
																	</div>
																</div>
															</div>
															<div class="menu-item px-3 my-1">
																<a href="#" class="menu-link px-3">Settings</a>
															</div>
														</div>
													</div>
												</div>
												<div class="card-body pt-1">
													<div class="d-flex flex-stack item-border-hover px-3 py-2 ms-n4 mb-3">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-40px symbol-circle me-4">
																<span class="symbol-label bg-light-primary">
																	<span class="svg-icon svg-icon-1 svg-icon-primary">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																			<path opacity="0.3" d="M11 6.5C11 9 9 11 6.5 11C4 11 2 9 2 6.5C2 4 4 2 6.5 2C9 2 11 4 11 6.5ZM17.5 2C15 2 13 4 13 6.5C13 9 15 11 17.5 11C20 11 22 9 22 6.5C22 4 20 2 17.5 2ZM6.5 13C4 13 2 15 2 17.5C2 20 4 22 6.5 22C9 22 11 20 11 17.5C11 15 9 13 6.5 13ZM17.5 13C15 13 13 15 13 17.5C13 20 15 22 17.5 22C20 22 22 20 22 17.5C22 15 20 13 17.5 13Z" fill="black" />
																			<path d="M17.5 16C17.5 16 17.4 16 17.5 16L16.7 15.3C16.1 14.7 15.7 13.9 15.6 13.1C15.5 12.4 15.5 11.6 15.6 10.8C15.7 9.99999 16.1 9.19998 16.7 8.59998L17.4 7.90002H17.5C18.3 7.90002 19 7.20002 19 6.40002C19 5.60002 18.3 4.90002 17.5 4.90002C16.7 4.90002 16 5.60002 16 6.40002V6.5L15.3 7.20001C14.7 7.80001 13.9 8.19999 13.1 8.29999C12.4 8.39999 11.6 8.39999 10.8 8.29999C9.99999 8.19999 9.20001 7.80001 8.60001 7.20001L7.89999 6.5V6.40002C7.89999 5.60002 7.19999 4.90002 6.39999 4.90002C5.59999 4.90002 4.89999 5.60002 4.89999 6.40002C4.89999 7.20002 5.59999 7.90002 6.39999 7.90002H6.5L7.20001 8.59998C7.80001 9.19998 8.19999 9.99999 8.29999 10.8C8.39999 11.5 8.39999 12.3 8.29999 13.1C8.19999 13.9 7.80001 14.7 7.20001 15.3L6.5 16H6.39999C5.59999 16 4.89999 16.7 4.89999 17.5C4.89999 18.3 5.59999 19 6.39999 19C7.19999 19 7.89999 18.3 7.89999 17.5V17.4L8.60001 16.7C9.20001 16.1 9.99999 15.7 10.8 15.6C11.5 15.5 12.3 15.5 13.1 15.6C13.9 15.7 14.7 16.1 15.3 16.7L16 17.4V17.5C16 18.3 16.7 19 17.5 19C18.3 19 19 18.3 19 17.5C19 16.7 18.3 16 17.5 16Z" fill="black" />
																		</svg>
																	</span>
																</span>
															</div>
															<div class="ps-1 mb-1">
																<a href="#" class="fs-5 text-gray-800 text-hover-primary fw-boldest">Project Alice</a>
																<div class="text-gray-400 fw-bold">Phase 1 development</div>
															</div>
														</div>
														<span class="badge badge-light rounded-pill fs-7 fw-boldest">43 files</span>
													</div>
													<div class="d-flex flex-stack item-border-hover px-3 py-2 ms-n4 mb-3">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-40px symbol-circle me-4">
																<span class="symbol-label bg-light-danger">
																	<span class="svg-icon svg-icon-1 svg-icon-danger">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																			<rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="black" />
																			<rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="black" />
																			<rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="black" />
																		</svg>
																	</span>
																</span>
															</div>
															<div class="ps-1 mb-1">
																<a href="#" class="fs-5 text-gray-800 text-hover-primary fw-boldest">HR Confidential</a>
																<div class="text-gray-400 fw-bold">Confidential staff documents</div>
															</div>
														</div>
														<span class="badge badge-light rounded-pill fs-7 fw-boldest">24 files</span>
													</div>
													<div class="d-flex flex-stack item-border-hover px-3 py-2 ms-n4 mb-3">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-40px symbol-circle me-4">
																<span class="symbol-label bg-light-success">
																	<span class="svg-icon svg-icon-1 svg-icon-success">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																			<path opacity="0.3" d="M5 15C3.3 15 2 13.7 2 12C2 10.3 3.3 9 5 9H5.10001C5.00001 8.7 5 8.3 5 8C5 5.2 7.2 3 10 3C11.9 3 13.5 4 14.3 5.5C14.8 5.2 15.4 5 16 5C17.7 5 19 6.3 19 8C19 8.4 18.9 8.7 18.8 9C18.9 9 18.9 9 19 9C20.7 9 22 10.3 22 12C22 13.7 20.7 15 19 15H5ZM5 12.6H13L9.7 9.29999C9.3 8.89999 8.7 8.89999 8.3 9.29999L5 12.6Z" fill="black" />
																			<path d="M17 17.4V12C17 11.4 16.6 11 16 11C15.4 11 15 11.4 15 12V17.4H17Z" fill="black" />
																			<path opacity="0.3" d="M12 17.4H20L16.7 20.7C16.3 21.1 15.7 21.1 15.3 20.7L12 17.4Z" fill="black" />
																			<path d="M8 12.6V18C8 18.6 8.4 19 9 19C9.6 19 10 18.6 10 18V12.6H8Z" fill="black" />
																		</svg>
																	</span>
																</span>
															</div>
															<div class="ps-1 mb-1">
																<a href="#" class="fs-5 text-gray-800 text-hover-primary fw-boldest">Project Rider</a>
																<div class="text-gray-400 fw-bold">New frontend admin theme</div>
															</div>
														</div>
														<span class="badge badge-light rounded-pill fs-7 fw-boldest">75 files</span>
													</div>
													<div class="d-flex flex-stack item-border-hover px-3 py-2 ms-n4 mb-3">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-40px symbol-circle me-4">
																<span class="symbol-label bg-light-info">
																	<span class="svg-icon svg-icon-1 svg-icon-info">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																			<path opacity="0.3" d="M22 5V19C22 19.6 21.6 20 21 20H19.5L11.9 12.4C11.5 12 10.9 12 10.5 12.4L3 20C2.5 20 2 19.5 2 19V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5ZM7.5 7C6.7 7 6 7.7 6 8.5C6 9.3 6.7 10 7.5 10C8.3 10 9 9.3 9 8.5C9 7.7 8.3 7 7.5 7Z" fill="black" />
																			<path d="M19.1 10C18.7 9.60001 18.1 9.60001 17.7 10L10.7 17H2V19C2 19.6 2.4 20 3 20H21C21.6 20 22 19.6 22 19V12.9L19.1 10Z" fill="black" />
																		</svg>
																	</span>
																</span>
															</div>
															<div class="ps-1 mb-1">
																<a href="#" class="fs-5 text-gray-800 text-hover-primary fw-boldest">Banner Assets</a>
																<div class="text-gray-400 fw-bold">Collection of banner images</div>
															</div>
														</div>
														<span class="badge badge-light rounded-pill fs-7 fw-boldest">16 files</span>
													</div>
													<div class="d-flex flex-stack item-border-hover px-3 py-2 ms-n4 mb-6">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-40px symbol-circle me-4">
																<span class="symbol-label bg-light-warning">
																	<span class="svg-icon svg-icon-1 svg-icon-warning">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
																			<path opacity="0.3" d="M8.9 21L7.19999 22.6999C6.79999 23.0999 6.2 23.0999 5.8 22.6999L4.1 21H8.9ZM4 16.0999L2.3 17.8C1.9 18.2 1.9 18.7999 2.3 19.1999L4 20.9V16.0999ZM19.3 9.1999L15.8 5.6999C15.4 5.2999 14.8 5.2999 14.4 5.6999L9 11.0999V21L19.3 10.6999C19.7 10.2999 19.7 9.5999 19.3 9.1999Z" fill="black" />
																			<path d="M21 15V20C21 20.6 20.6 21 20 21H11.8L18.8 14H20C20.6 14 21 14.4 21 15ZM10 21V4C10 3.4 9.6 3 9 3H4C3.4 3 3 3.4 3 4V21C3 21.6 3.4 22 4 22H9C9.6 22 10 21.6 10 21ZM7.5 18.5C7.5 19.1 7.1 19.5 6.5 19.5C5.9 19.5 5.5 19.1 5.5 18.5C5.5 17.9 5.9 17.5 6.5 17.5C7.1 17.5 7.5 17.9 7.5 18.5Z" fill="black" />
																		</svg>
																	</span>
																</span>
															</div>
															<div class="ps-1 mb-1">
																<a href="#" class="fs-5 text-gray-800 text-hover-primary fw-boldest">Icon Assets</a>
																<div class="text-gray-400 fw-bold">Collection of SVG icons</div>
															</div>
														</div>
														<span class="badge badge-light rounded-pill fs-7 fw-boldest">64 files</span>
													</div>
													<div class="rounded border border-primary bg-light-primary border-dashed px-6 py-5">
														<a href="#" class="link-primary fw-bolder fs-6 me-1">Intive New .NET Collaborators</a>
														<span class="text-gray-800 fw-bold fs-6">to creating great outstanding business to business .jsp modular class outstanding scripts</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xxl-6">
											<div class="card card-xl-stretch mb-5 mb-xl-8">
												<div class="card-header border-0 pt-5">
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bolder text-dark">Trends</span>
														<span class="text-muted mt-1 fw-bold fs-7">Latest tech trends</span>
													</h3>
													<div class="card-toolbar">
														<button type="button" class="btn btn-sm btn-icon btn-color-primary btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
															<span class="svg-icon svg-icon-2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
																	<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																		<rect x="5" y="5" width="5" height="5" rx="1" fill="#000000" />
																		<rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																		<rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																		<rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
																	</g>
																</svg>
															</span>
														</button>
														<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3" data-kt-menu="true">
															<div class="menu-item px-3">
																<div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Payments</div>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3">Create Invoice</a>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link flex-stack px-3">Create Payment
																<i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Specify a target name for future usage and reference"></i></a>
															</div>
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3">Generate Bill</a>
															</div>
															<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-end">
																<a href="#" class="menu-link px-3">
																	<span class="menu-title">Subscription</span>
																	<span class="menu-arrow"></span>
																</a>
																<div class="menu-sub menu-sub-dropdown w-175px py-4">
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Plans</a>
																	</div>
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Billing</a>
																	</div>
																	<div class="menu-item px-3">
																		<a href="#" class="menu-link px-3">Statements</a>
																	</div>
																	<div class="separator my-2"></div>
																	<div class="menu-item px-3">
																		<div class="menu-content px-3">
																			<label class="form-check form-switch form-check-custom form-check-solid">
																				<input class="form-check-input w-30px h-20px" type="checkbox" value="1" checked="checked" name="notifications" />
																				<span class="form-check-label text-muted fs-6">Recuring</span>
																			</label>
																		</div>
																	</div>
																</div>
															</div>
															<div class="menu-item px-3 my-1">
																<a href="#" class="menu-link px-3">Settings</a>
															</div>
														</div>
													</div>
												</div>
												<div class="card-body pt-5">
													<div class="d-flex align-items-sm-center mb-7">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/plurk.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Top Authors</a>
																<span class="text-muted fw-bold d-block fs-7">Mark, Rowling, Esther</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+82$</span>
														</div>
													</div>
													<div class="d-flex align-items-sm-center mb-7">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/telegram.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Popular Authors</a>
																<span class="text-muted fw-bold d-block fs-7">Randy, Steve, Mike</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+280$</span>
														</div>
													</div>
													<div class="d-flex align-items-sm-center mb-7">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/vimeo.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">New Users</a>
																<span class="text-muted fw-bold d-block fs-7">John, Pat, Jimmy</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+4500$</span>
														</div>
													</div>
													<div class="d-flex align-items-sm-center mb-7">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/bebo.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Active Customers</a>
																<span class="text-muted fw-bold d-block fs-7">Mark, Rowling, Esther</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+4500$</span>
														</div>
													</div>
													<div class="d-flex align-items-sm-center mb-7">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/kickstarter.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Bestseller Theme</a>
																<span class="text-muted fw-bold d-block fs-7">Disco, Retro, Sports</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+4500$</span>
														</div>
													</div>
													<div class="d-flex align-items-sm-center">
														<div class="symbol symbol-circle symbol-50px me-5">
															<span class="symbol-label">
																<img src="assets/media/svg/brand-logos/fox-hub.svg" class="h-50 align-self-center" alt="" />
															</span>
														</div>
														<div class="d-flex align-items-center flex-row-fluid flex-wrap">
															<div class="flex-grow-1 me-2">
																<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Fox Broker App</a>
																<span class="text-muted fw-bold d-block fs-7">Finance, Corporate, Apps</span>
															</div>
															<span class="badge badge-light fw-bolder my-2">+4500$</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> --}}

                                    <div class="card card-xxl-stretch">
										<div class="card-header">
											<h3 class="card-title align-items-start flex-column">
												<span class="card-label fw-bolder text-dark">My Data</span>
												<span class="text-muted mt-1 fw-bold fs-7">Preview monthly events</span>
											</h3>
											<div class="card-toolbar">
												<a href="#" class="btn btn-primary">Manage</a>
											</div>
										</div>
										<div class="card-body">
                                            <p>Konten</p>
                                            <p>Konten</p>
                                            <p>Konten</p>
                                        </div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
						<div class="container-xxl d-flex flex-column flex-md-row align-items-center justify-content-between">
							<div class="text-dark order-2 order-md-1">
								<span class="text-muted fw-bold me-1">2021©</span>
								<a href="https://keenthemes.com" target="_blank" class="text-gray-800 text-hover-primary">Keenthemes</a>
							</div>
							<ul class="menu menu-gray-600 menu-hover-primary fw-bold order-1">
								<li class="menu-item">
									<a href="https://keenthemes.com" target="_blank" class="menu-link px-2">About</a>
								</li>
								<li class="menu-item">
									<a href="https://keenthemes.com/support" target="_blank" class="menu-link px-2">Support</a>
								</li>
								<li class="menu-item">
									<a href="https://keenthemes.com/products/ceres-html-pro" target="_blank" class="menu-link px-2">Purchase</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="kt_modal_invite_friends" tabindex="-1" aria-hidden="true">
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
							<h1 class="mb-3">Invite a Friend</h1>
							<div class="text-muted fw-bold fs-5">If you need more info, please check out
							<a href="#" class="link-primary fw-bolder">FAQ Page</a>.</div>
						</div>
						<div class="btn btn-light-primary fw-bolder w-100 mb-8">
						<img alt="Logo" src="assets/media/svg/brand-logos/google-icon.svg" class="h-20px me-3" />Invite Gmail Contacts</div>
						<div class="separator d-flex flex-center mb-8">
							<span class="text-uppercase bg-body fs-7 fw-bold text-muted px-3">or</span>
						</div>
						<textarea class="form-control form-control-solid mb-8" rows="3" placeholder="Type or paste emails here"></textarea>
						<div class="mb-10">
							<div class="fs-6 fw-bold mb-2">Your Invitations</div>
							<div class="mh-300px scroll-y me-n7 pe-7">
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-1.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Emma Smith</a>
											<div class="fw-bold text-muted">e.smith@kpmg.com.au</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-danger text-danger fw-bold">M</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Melody Macy</a>
											<div class="fw-bold text-muted">melody@altbox.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1" selected="selected">Guest</option>
											<option value="2">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-26.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Max Smith</a>
											<div class="fw-bold text-muted">max@kt.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-4.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Sean Bean</a>
											<div class="fw-bold text-muted">sean@dellito.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-15.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Brian Cox</a>
											<div class="fw-bold text-muted">brian@exchange.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-warning text-warning fw-bold">M</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Mikaela Collins</a>
											<div class="fw-bold text-muted">mikaela@pexcom.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-8.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Francis Mitcham</a>
											<div class="fw-bold text-muted">f.mitcham@kpmg.com.au</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-danger text-danger fw-bold">O</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Olivia Wild</a>
											<div class="fw-bold text-muted">olivia@corpmail.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-primary text-primary fw-bold">N</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Neil Owen</a>
											<div class="fw-bold text-muted">owen.neil@gmail.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1" selected="selected">Guest</option>
											<option value="2">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-6.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Dan Wilson</a>
											<div class="fw-bold text-muted">dam@consilting.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-danger text-danger fw-bold">E</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Emma Bold</a>
											<div class="fw-bold text-muted">emma@intenso.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-7.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Ana Crown</a>
											<div class="fw-bold text-muted">ana.cf@limtel.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1" selected="selected">Guest</option>
											<option value="2">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-info text-info fw-bold">A</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Robert Doe</a>
											<div class="fw-bold text-muted">robert@benko.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-17.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">John Miller</a>
											<div class="fw-bold text-muted">miller@mapple.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-success text-success fw-bold">L</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Lucy Kunic</a>
											<div class="fw-bold text-muted">lucy.m@fentech.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2" selected="selected">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4 border-bottom border-gray-300 border-bottom-dashed">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<img alt="Pic" src="assets/media/avatars/150-10.jpg" />
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Ethan Wilder</a>
											<div class="fw-bold text-muted">ethan@loop.com.au</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1" selected="selected">Guest</option>
											<option value="2">Owner</option>
											<option value="3">Can Edit</option>
										</select>
									</div>
								</div>
								<div class="d-flex flex-stack py-4">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-35px symbol-circle">
											<span class="symbol-label bg-light-success text-success fw-bold">L</span>
										</div>
										<div class="ms-5">
											<a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Lucy Kunic</a>
											<div class="fw-bold text-muted">lucy.m@fentech.com</div>
										</div>
									</div>
									<div class="ms-2 w-100px">
										<select class="form-select form-select-solid form-select-sm" data-control="select2" data-hide-search="true">
											<option value="1">Guest</option>
											<option value="2">Owner</option>
											<option value="3" selected="selected">Can Edit</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex flex-stack">
							<div class="me-5 fw-bold">
								<label class="fs-6">Adding Users by Team Members</label>
								<div class="fs-7 text-muted">If you need more info, please check budget planning</div>
							</div>
							<label class="form-check form-switch form-check-custom form-check-solid">
								<input class="form-check-input" type="checkbox" value="1" checked="checked" />
								<span class="form-check-label fw-bold text-muted">Allowed</span>
							</label>
						</div>
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
		<script>var hostUrl = "assets/";</script>
		<script src="{{url('public/Twebsite/v1/plugins/global/plugins.bundle.js')}}"></script>
		<script src="{{url('public/Twebsite/v1/js/scripts.bundle.js')}}"></script>
		<script src="{{url('public/Twebsite/v1/plugins/custom/fullcalendar/fullcalendar.bundle.js')}}"></script>
		<script src="{{url('public/Twebsite/v1/js/custom/widgets.js')}}"></script>
	</body>
</html>