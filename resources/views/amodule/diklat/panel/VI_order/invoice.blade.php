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
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Issue Date:</div>
                            <div class="fw-bolder fs-6 text-gray-800">12 Apr 2021</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Due Date:</div>
                            <div class="fw-bolder fs-6 text-gray-800 d-flex align-items-center flex-wrap">
                                <span class="pe-2">02 May 2021</span>
                                <span class="fs-7 text-danger d-flex align-items-center">
                                <span class="bullet bullet-dot bg-danger me-2"></span>Due in 7 days</span>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5 mb-12">
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Issue For:</div>
                            <div class="fw-bolder fs-6 text-gray-800">KeenThemes Inc.</div>
                            <div class="fw-bold fs-7 text-gray-600">8692 Wild Rose Drive
                            <br />Livonia, MI 48150</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="fw-bold fs-7 text-gray-600 mb-1">Issued By:</div>
                            <div class="fw-bolder fs-6 text-gray-800">CodeLab Inc.</div>
                            <div class="fw-bold fs-7 text-gray-600">9858 South 53rd Ave.
                            <br />Matthews, NC 28104</div>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="table-responsive border-bottom mb-9">
                            <table class="table mb-3">
                                <thead>
                                    <tr class="border-bottom fs-6 fw-bolder text-gray-400">
                                        <th class="min-w-175px pb-2">Description</th>
                                        <th class="min-w-70px text-end pb-2">Hours</th>
                                        <th class="min-w-80px text-end pb-2">Rate</th>
                                        <th class="min-w-100px text-end pb-2">Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="fw-bolder text-gray-700 fs-5 text-end">
                                        <td class="d-flex align-items-center pt-6">
                                        <i class="fa fa-genderless text-danger fs-2 me-2"></i>Creative Design</td>
                                        <td class="pt-6">80</td>
                                        <td class="pt-6">$40.00</td>
                                        <td class="pt-6 text-dark fw-boldest">$3200.00</td>
                                    </tr>
                                    <tr class="fw-bolder text-gray-700 fs-5 text-end">
                                        <td class="d-flex align-items-center">
                                        <i class="fa fa-genderless text-success fs-2 me-2"></i>Logo Design</td>
                                        <td>120</td>
                                        <td>$40.00</td>
                                        <td class="fs-5 text-dark fw-boldest">$4800.00</td>
                                    </tr>
                                    <tr class="fw-bolder text-gray-700 fs-5 text-end">
                                        <td class="d-flex align-items-center">
                                        <i class="fa fa-genderless text-primary fs-2 me-2"></i>Web Development</td>
                                        <td>210</td>
                                        <td>$60.00</td>
                                        <td class="fs-5 text-dark fw-boldest">$12600.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="d-flex justify-content-end">
                            <div class="mw-300px">
                                <div class="d-flex flex-stack mb-3">
                                    <div class="fw-bold pe-10 text-gray-600 fs-7">Subtotal:</div>
                                    <div class="text-end fw-bolder fs-6 text-gray-800">$ 20,600.00</div>
                                </div>
                                <div class="d-flex flex-stack">
                                    <div class="fw-bold pe-10 text-gray-600 fs-7">Total</div>
                                    <div class="text-end fw-bolder fs-6 text-gray-800">$ 20,600.00</div>
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