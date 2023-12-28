@extends('layout.dashboard.v2.masterv2Konten')

@section('css')
      <!-- DataTables -->
      <link href="{{asset('public/dashboard/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css')}}" rel="stylesheet">
      
@endsection

@section('title')
  Manage Account
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item text-dark">Role - Permission</li>
    <li class="breadcrumb-item text-muted">
        <a href="{{url('/givepermission')}}" class="text-muted">Home</a>
    </li>
@endsection

{{-- @section('buttonHeader')
    <button type="button" data-bs-toggle="modal" data-bs-target="#tambah-user" class="float-right btn btn-info">Tambah Data</button>
@endsection --}}

@section('content')

    <div class="row">
        <div class="col-lg-12">
              
          <div class="table-responsive">
            <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap">
            {{-- <table id="datatable" class="table table-row-bordered gy-5"> --}}
              <thead>
                  <tr>
                      <th>#</th>
                      <th>Role</th>
                      <th>Guard</th>
                      <th class="text-center">Aksi</th>
                  </tr>
              </thead>
              <tbody>
                @foreach($Mrole as $i)
                  <tr>
                      <td>{{$loop->iteration}}</td>
                      <td>{{$i->name}}</td>
                      <td>{{$i->guard_name}}</td>
                      <td class="d-flex justify-content-center">
                        <a href='{{url("/givepermission/{$i->id}/create")}}' class="btn btn-info btn-sm me-1">Give Permission</a>
                        <a href='{{url("/givepermission/{$i->id}/edit")}}' class="btn btn-danger btn-sm me-1">Revoke Permission</a>
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
      <script>
        $('#datatable').DataTable({
            scrollX: true,
        });

        $(document).ready(function(){
          $(document).on('click', '#edit', function(){
            var id = $(this).data('id');
            var name = $(this).data('name');
            var username = $(this).data('username');
            var password = $(this).data('password');
            var email = $(this).data('email');
            var role = $(this).data('role');

            $('#name').val(name);
            $('#username').val(username);
            $('#password').val(password);
            $('#email').val(email);
            $('#role').val(role);

            $('.form-edit').attr('action',`{{url('/users/${id}/update')}}`);
          })
          
        });
      </script>
      
@endsection