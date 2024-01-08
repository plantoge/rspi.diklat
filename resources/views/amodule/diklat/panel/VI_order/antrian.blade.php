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
            <span class="card-label fw-bolder text-dark">Antrian Transaksi</span>
            <span class="text-muted mt-1 fw-bold fs-7">Data Transaksi Event</span>
        </h3>
    </div>
    <div class="card-body">
        
        <div class="table-responsive">
            <table id="kt_datatable_zero_configuration" class="table table-row-bordered gy-5">
                <thead>
                    <tr class="fw-semibold fs-6 text-muted">
                        <th>#</th>
                        <th>Event</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($order as $data)
                        
                    <tr class="align-middle">
                        <td>
                            {{$data->ORDER_CODE}}
                        </td>
                        <td>
                            <a class="link text-dark fw-bold" target="_blank" href="{{url('info-kelas/'.$data->EVENT_SLUG.'/'.$data->EVENT_ID)}}">
                                {{$data->ITEMORDER_JUDUL_DIPILIH}}
                            </a>
                            <br>
                            <span class="badge badge-info">{{$data->name}}</span> 
                            <span class="badge badge-secondary">{{$data->phone}}</span> 
                        </td>    
                        <td>@matauang($data->ORDER_TOTAL)</td>    
                        <td>
                            @if($data->ORDER_STATUS == 'Menunggu Konfirmasi')
                            <span class="badge badge-info">{{$data->ORDER_STATUS}}</span>
                            @elseif($data->ORDER_STATUS == 'Selesai')
                            <span class="badge badge-success">{{$data->ORDER_STATUS}}</span>
                            @endif
                        </td>    
                        <td class="text-center">
                            @if($data->ORDER_STATUS == 'Menunggu Konfirmasi')
                                <a href="{{url('order-proses/' . $data->ORDER_ID)}}" onclick="return confirm('Status menjadi selesai dan invoice akan terbit. Yakin sudah cek Transaksi #{{$data->ORDER_CODE}} ?' )" class="btn btn-secondary btn-sm w-100">Konfirmasi</a>
                            @elseif ($data->ORDER_STATUS == 'Selesai')
                                <a href="{{url('/order-invoice/' . $data->ORDER_ID)}}" class="btn btn-warning btn-sm w-100">Invoice</a>
                            @endif
                            <a href="{{url('storage/app/bukti_order/' . $data->ORDER_BUKTI)}}" class="btn btn-danger btn-sm w-100" target="_blank">Bukti</a>
                            
                            {{-- <a href="{{url('events/' .$data->EVENT_ID. '/edit')}}" class="btn btn-primary btn-sm w-100">Edit</a>
                            <br>
                            <form action="{{url('events/' .$data->EVENT_ID. '/delete')}}" method="post">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm w-100" onclick="return confirm('Yakin dihapus ?')">Delete</button>
                            </form> --}}
                        </td>

                    </tr>

                    @endforeach
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>Event</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
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
    $("#kt_datatable_zero_configuration").DataTable({
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