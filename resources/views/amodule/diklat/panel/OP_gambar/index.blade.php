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
            <span class="card-label fw-bolder text-dark">Gambar</span>
            <span class="text-muted mt-1 fw-bold fs-7">List data Gambar yang ada di halaman website</span>
        </h3>
        <div class="card-toolbar">
            <a href="{{url('panel-gambar/create')}}" class="btn btn-primary">Buat</a>
        </div>
    </div>
    <div class="card-body">
        
        <div class="table-responsive">
            <table id="kt_datatable_zero_configuration" class="table table-row-bordered gy-5">
                <thead>
                    <tr class="fw-semibold fs-6 text-muted">
                        <th>Kategori</th>
                        <th>Gambar</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($gambar as $data)
                        
                    <tr class="align-middle">
                        <td>{{$data->GAMBAR_KATEGORI}}</td>    
                        <td><a target="_blank" href="{{url('storage/app/gambar_website/'. $data->GAMBAR )}}" class="btn btn-link btn-sm">{{$data->GAMBAR}}</a></td>    
                        <td>
                            <a href="{{url('panel-gambar/' .$data->GAMBAR_ID. '/edit')}}" class="btn btn-primary btn-sm w-100">Edit</a>
                            <br>
                            <form action="{{url('panel-gambar/' .$data->GAMBAR_ID. '/delete')}}" method="post">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm w-100" onclick="return confirm('Yakin dihapus ?')">Delete</button>
                            </form>
                        </td>

                    </tr>

                    @endforeach
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>Kategori</th>
                        <th>Gambar</th>
                        <th>Aksi</th>
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