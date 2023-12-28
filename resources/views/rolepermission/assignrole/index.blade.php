@extends('layout.dashboard.v2.masterv2Konten')

@section('css')
      <!-- DataTables -->
      <link href="{{asset('public/dashboard/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css')}}" rel="stylesheet">
      
@endsection

@section('title')
  Manage Account
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item text-dark">User - Role</li>
    <li class="breadcrumb-item text-muted">
        <a href="{{url('/assignrole')}}" class="text-muted">Home</a>
    </li>
@endsection

{{-- @section('buttonHeader')
    <button type="button" data-bs-toggle="modal" data-bs-target="#tambah-user" class="float-right btn btn-info">Tambah Data</button>
@endsection --}}

@section('content')

    <div class="row">
        <div class="col-lg-12">
              
              <div class="table-responsive">
                <table id="datatable" class="table table-striped table-sm table-bordered dt-responsive nowrap">
                  <thead>
                      <tr>
                          <th>Name</th>
                          <th>Username</th>
                          <th>Email</th>
                          <th>Aksi</th>
                          <!-- <th>Aksi</th> -->
                      </tr>
                  </thead>
                  <tbody>
                    @foreach($Musers as $i)
                      <tr>
                          <td>{{$i->name}}</td>
                          <td>{{$i->username}}</td>
                          <td>{{$i->email}}</td>
                          <td class="d-flex justify-content-center">
                            <a href='{{url("/assignrole/{$i->id}/create")}}' class="btn btn-info btn-sm me-1">Assign Role</a>
                            <a href='{{url("/assignrole/{$i->id}/edit")}}' class="btn btn-danger btn-sm me-1">Remove Role</a>
                          </td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
                @if(session('Sukses'))
                  <div class="alert alert-success" role="alert">
                      {{session('Sukses')}}
                  </div>
                @endif
        </div>
    </div>
    <!-- </div> -->
    
@endsection

@section('js')
      <!-- DATATABLES -->
      <script src="{{asset('public/dashboard/extra-libs/datatables.net/js/jquery.dataTables.min.js')}}"></script>
      <script src="{{asset('public/dashboard/dist/js/pages/datatable/datatable-basic.init.js')}}"></script>
      <script>
        $('#datatable').DataTable({
            scrollX: true,
        });
      </script>
      
@endsection