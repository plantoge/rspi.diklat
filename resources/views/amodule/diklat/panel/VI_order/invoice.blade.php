@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    <style>
        @media print {
            body * {
                visibility: hidden;
            }

            #btnprint {
                display: none;
            }

            #printInvoice, #printInvoice * {
                visibility: visible;
            }

            #printInvoice {
                /* position: absolute; */
                /* left: 0; */
                top: -100px;
                border: 0.5px solid grey;
            }
        }
    </style>
@endsection

@section('konten')

<div id="printInvoice" class="card">
    <div class="card-body p-lg-20">
        <div class="d-flex flex-column flex-xl-row">
            <div class="flex-lg-row-fluid me-xl-18 mb-10 mb-xl-0">
                <div class="d-flex flex-stack mb-10 mb-lg-15">
                    <a href="#">
                        <img alt="Logo" class="h-50px" src="{{url('public/Twebsite/v1/media/logos/logo-desc.png')}}" />
                    </a>
                    <div class="my-1">
                        {{-- <a href="#" class="btn btn-sm btn-light me-2">Download</a> --}}
                        <a id="btnprint" class="btn btn-sm btn-success me-2" onclick="window.print()">Print</a>
                    </div>
                </div>
                <div class="mb-0">
                    <div class="fw-bolder fs-3 text-gray-800 mb-8">Invoice #{{$order->ORDER_CODE}}</div>
                    <div class="row g-5 mb-11">
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Dari:</div>
                            <div class="fw-bolder fs-6 text-gray-800">{{\Carbon\Carbon::parse($order->EVENT_JADWAL_AWAL)->format('d F Y')}}</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Sampai Tanggal:</div>
                            <div class="fw-bolder fs-6 text-gray-800 d-flex align-items-center flex-wrap">
                                <span class="pe-2">{{\Carbon\Carbon::parse($order->EVENT_JADWAL_AKHIR)->format('d F Y')}}</span>
                                {{-- <span class="fs-7 text-danger d-flex align-items-center">
                                <span class="bullet bullet-dot bg-danger me-2"></span>Due in 7 days</span> --}}
                            </div>
                        </div>
                    </div>
                    <div class="row g-5 mb-12">
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Dari:</div>
                            <div class="fw-bolder fs-6 text-gray-800">RSPI Sulianti Saroso</div>
                            <div class="fw-bold fs-7 text-gray-600">Jl. Sunter Permai Raya No.2
                            <br />Papanggo, Kec. Tj. Priok, Jkt Utara</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Untuk:</div>
                            <div class="fw-bolder fs-6 text-gray-800"><b>{{$order->name}}</b></div>
                            <div class="fw-bold fs-7 text-gray-600">
                                {{$order->email}} <br>
                                status: <span class="badge badge-success">{{$order->ORDER_STATUS}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="table-responsive border-bottom mb-9">
                            <table class="table mb-3">
                                <thead>
                                    <tr class="border-bottom fs-6 fw-bolder text-gray-400">
                                        <th class="min-w-175px pb-2">Event</th>
                                        <th class="min-w-70px text-end pb-2">Harga</th>
                                        <th class="min-w-80px text-end pb-2">Qty</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr class="fw-bolder text-gray-700 fs-5">
                                        <td class="d-fle align-items-cente pt-6">
                                            {{$order->EVENT_JUDUL}} 
                                            <span class="badge badge-info">{{$order->EVENT_KATEGORI}}</span>
                                        </td>
                                        <td class="pt-6 text-end">@matauang($order->ITEMORDER_HARGA_DIPILIH)</td>
                                        <td class="pt-6 text-end">1</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="d-flex justify-content-end">
                            <div class="mw-300px">
                                {{-- <div class="d-flex flex-stack mb-3">
                                    <div class="fw-bold pe-10 text-gray-600 fs-7">Subtotal:</div>
                                    <div class="text-end fw-bolder fs-6 text-gray-800">$ 20,600.00</div>
                                </div> --}}
                                <div class="d-flex flex-stack">
                                    <div class="fw-bold pe-10 text-gray-600 fs-7">Total</div>
                                    <div class="text-end fw-bolder fs-6 text-gray-800">@matauang($order->ITEMORDER_HARGA_DIPILIH)</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- <div class="m-0">
                <div class="d-print-none border border-dashed border-gray-300 card-rounded h-lg-100 min-w-md-350px p-9 bg-lighten">
                    <div class="mb-8">
                        <span class="badge badge-light-success me-2">Approved</span>
                        <span class="badge badge-light-warning">Pending Payment</span>
                    </div>
                    <h6 class="mb-8 fw-boldest text-gray-600 text-hover-primary">PAYMENT DETAILS</h6>
                    <div class="mb-6">
                        <div class="fw-bold text-gray-600 fs-7">Paypal:</div>
                        <div class="fw-bolder text-gray-800 fs-6">codelabpay@codelab.co</div>
                    </div>
                    <div class="mb-6">
                        <div class="fw-bold text-gray-600 fs-7">Account:</div>
                        <div class="fw-bolder text-gray-800 fs-6">Nl24IBAN34553477847370033
                        <br />AMB NLANBZTC</div>
                    </div>
                    <div class="mb-15">
                        <div class="fw-bold text-gray-600 fs-7">Payment Term:</div>
                        <div class="fw-bolder fs-6 text-gray-800 d-flex align-items-center">14 days
                        <span class="fs-7 text-danger d-flex align-items-center">
                        <span class="bullet bullet-dot bg-danger mx-2"></span>Due in 7 days</span></div>
                    </div>
                    <h6 class="mb-8 fw-boldest text-gray-600 text-hover-primary">PROJECT OVERVIEW</h6>
                    <div class="mb-6">
                        <div class="fw-bold text-gray-600 fs-7">Project Name</div>
                        <div class="fw-bolder fs-6 text-gray-800">SaaS App Quickstarter
                        <a href="#" class="link-primary ps-1">View Project</a></div>
                    </div>
                    <div class="mb-6">
                        <div class="fw-bold text-gray-600 fs-7">Completed By:</div>
                        <div class="fw-bolder text-gray-800 fs-6">Mr. Dewonte Paul</div>
                    </div>
                    <div class="m-0">
                        <div class="fw-bold text-gray-600 fs-7">Time Spent:</div>
                        <div class="fw-bolder fs-6 text-gray-800 d-flex align-items-center">230 Hours
                        <span class="fs-7 text-success d-flex align-items-center">
                        <span class="bullet bullet-dot bg-success mx-2"></span>35$/h Rate</span></div>
                    </div>
                </div>
            </div> --}}
        </div>
    </div>
</div>

@endsection

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.js')}}"></script>
@endsection