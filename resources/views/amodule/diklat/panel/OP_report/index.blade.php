@extends('layout.panel.masterPanel')

@section('css')
<link href="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    {{-- style button export datatables --}}
    <style>
        .dt-buttons {
            float: left !important;
        }
        .dt-buttons button {
            font-size: 11px !important;
        }
        
        .buttons-html5, .buttons-print {
            padding: 0.5em !important;
        }
        
        .dataTables_info {
            float: left !important;
        }
    </style>
@endsection

@section('konten')

<div class="card card-xxl-stretch">
    <div class="card-header">
        <h3 class="card-title align-items-start flex-column">
            <span class="card-label fw-bolder text-dark">Report</span>
            <span class="text-muted mt-1 fw-bold fs-7">Rincian Data</span>
        </h3>
        <div class="card-toolbar">
            <form action="{{url('/report-filter')}}" method="get">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-lg-9">
                            <input class="form-control mb-2 form-control-sm" placeholder="Pick date rage" id="daterange" name="daterange"/>

                        </div>
                        <div class="col-sm-12 col-lg-3">
                            <button type="submit" class="btn btn-danger btn-sm">Submit</button>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="card-body">
        
        <div class="table-responsive">
            <table id="kt_datatable_zero_configuration" class="table table-row-bordered gy-5">
                <thead>
                    <tr class="fw-semibold fs-6 text-muted">
                        <th>CODE</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>EVENT</th>
                        <th>HARGA</th>
                        <th>DISKON</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    @if ($getReport)
                        @foreach ($getReport as $data)
                            
                        <tr class="align-middle">
                            <td>#{{$data->ORDER_CODE}}</td>    
                            <td>{{$data->name}}</td>    
                            <td>{{$data->phone}}</td>    
                            <td>{{$data->ITEMORDER_JUDUL_DIPILIH}}</td>    
                            <td>
                                @matauang($data->ITEMORDER_HARGA_DIPILIH)    
                            </td>    
                            <td>
                                @if($data->ITEMORDER_DISKON_DIPILIH)
                                    @matauang($data->ITEMORDER_DISKON_DIPILIH)
                                @else
                                    0
                                @endif
                            </td>    
                            <td>{{$data->ORDER_STATUS}}</td>    
                        </tr>

                        @endforeach
                    @endif
                    
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>CODE</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>EVENT</th>
                        <th>HARGA</th>
                        <th>DISKON</th>
                        <th>STATUS</th>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
</div>

@endsection

@section('js')
<script src="{{url('public/Twebsite/v1/plugins/custom/datatables/datatables.bundle.js')}}"></script>
<script>
    $('#daterange').daterangepicker({
        "drops": "auto",
        "opens": "center",
        "singleDatePicker": false,
        "locale": {
            "format": 'YYYY-MM-DD', // Ubah format tanggal sesuai keinginan Anda
            "separator": ' / '
        },
        // "startDate": '',
        // "endDate": ''
    });

    $("#kt_datatable_zero_configuration").DataTable({
        "scrollX": true,
        dom: 'Bfrtip',
        buttons: [
          {
            extend: 'copy',
            text: 'Salin'
          },
          {
            extend: 'csv',
            text: 'CSV'
          },
          {
            extend: 'excel',
            text: 'Excel'
          },
        //   {
        //     extend: 'pdf',
        //     text: 'PDF'
        //   },
        //   {
        //     extend: 'print',
        //     text: 'Cetak'
        //   }
        ],
        searching: true,
        paging: true
    });
</script>
@endsection