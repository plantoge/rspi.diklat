@extends('layout.dashboard.v2.masterv2Konten')

@section('css')
      <!-- DataTables -->
      {{-- <link href="{{asset('public/assets/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/> --}}
      <link href="{{asset('public/dashboard/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css')}}" rel="stylesheet">
      
@endsection

@section('title')
  Manage Account
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item text-dark">User</li>
    <li class="breadcrumb-item text-muted">
        <a href="{{url('/users')}}" class="text-muted">Home</a>
    </li>
@endsection

@section('buttonHeader')
    <button type="button" data-bs-toggle="modal" data-bs-target="#tambah-user" class="float-right btn btn-info">Tambah Data</button>
@endsection

@section('content')

    <div class="row">
        <div class="col-lg-12">
          <div class="table-responsive">
            <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap">
              <thead>
                  <tr>
                      <th>Nip</th>
                      <th>Name</th>
                      <th>Username</th>
                      <th>Email</th>
                      {{-- <th>Role</th> --}}
                      <th>Aksi</th>
                      <!-- <th>Aksi</th> -->
                  </tr>
              </thead>
              <tbody>
                @foreach($Musers as $i)
                  <tr>
                      <td>{{$i->nip}}</td>
                      <td>{{$i->name}}</td>
                      <td>{{$i->username}}</td>
                      <td>{{$i->email}}</td>
                      <td class="d-flex justify-content-center">
                        @if($i->id != 1)
                        <button 
                          id="edit"
                          class="btn btn-info btn-sm me-1" 
                          data-bs-toggle="modal" 
                          data-bs-target="#edit-user"
                          data-id="{{$i->id}}"
                          data-nip="{{$i->nip}}"
                          data-name="{{$i->name}}"
                          data-email="{{$i->email}}"
                          data-username="{{$i->username}}"
                          data-role="{{$i->role}}">Edit</button>
                        {{-- <a href='{{url("/users/{$i->id}/edit")}}' class="btn btn-info btn-sm mr-1">Edit</a> --}}
                        <form method="POST" action="{{url('/users/'.$i->id.'/delete')}}">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Yakin di hapus ?')">Hapus</button>
                        </form>
                        @endif
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

    <div class="row">
        <div class="col">

          <div class="modal fade" id="tambah-user" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Tambah Data</h3>
    
                    <!--begin::Close-->
                    <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                        <span class="svg-icon svg-icon-1"></span>
                    </div>
                    <!--end::Close-->
                </div>
    
                <div class="modal-body">
                  
                  <form action="{{url('/users/store')}}" method="post">
                    <div class="container mb-4">
                        <div class="row">
                          
                            <div class="col col-lg-12">
                                @csrf
                                <div class="form-group">
                                    <label>Nip </label>
                                    <input type="text" name="nip" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Nama </label>
                                    <input type="text" name="name" class="form-control">
                                </div>
                                <div class="form-group">
                                  <label>Email</label>
                                  <input type="email" name="email" class="form-control">
                              </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <input type="text" name="role" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="username" class="form-control">
                                </div>
                                <div class="form-group">
                                  <label>Password</label>
                                  <input type="password" name="password" class="form-control">
                                </div>
                                
                            </div>

                        </div>
                    </div>

                </div>
    
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                  </form>
                </div>
              </div>
            </div>
          </div>

        </div>
    </div>

    <div class="row">
      <div class="col">

        <div class="modal fade" id="edit-user" tabindex="-1">
            <div class="modal-dialog">
                  <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Edit Data</h3>
            
                            <!--begin::Close-->
                            <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                                <span class="svg-icon svg-icon-1"></span>
                            </div>
                            <!--end::Close-->
                        </div>
            
                        <div class="modal-body">
                          
                          <form class="form-edit" method="post">
                            <div class="container mb-4">
                                <div class="row">
                                  
                                    <div class="col col-lg-12">
                                        @csrf
                                        @method('patch')
                                        <div class="form-group">
                                            <label>Nip </label>
                                            <input type="text" id="nip" name="nip" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Nama </label>
                                            <input type="text" id="name" name="name" class="form-control">
                                        </div>
                                        <div class="form-group">
                                          <label>Email</label>
                                          <input type="email" id="email" name="email" class="form-control">
                                      </div>
                                        <div class="form-group">
                                            <label>Role</label>
                                            <input type="text" id="role" name="role" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" id="username" name="username" class="form-control">
                                        </div>
                                        <div class="form-group">
                                          <label>Password</label>
                                          <input type="password" id="password" name="password" class="form-control">
                                        </div>
                                        
                                    </div>
      
                                </div>
                            </div>

                        </div>
            
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                          </form>
                        </div>
                  </div>
            </div>
        </div>

      </div>
    </div>
    
@endsection

@section('js')
      <!-- DATATABLES -->
      {{-- <script src="{{asset('public/assets/plugins/custom/datatables/datatables.bundle.js')}}"></script> --}}
      

      <script src="{{asset('public/dashboard/extra-libs/datatables.net/js/jquery.dataTables.min.js')}}"></script>
      <script src="{{asset('public/dashboard/dist/js/pages/datatable/datatable-basic.init.js')}}"></script>

      <script>
        // $("#datatable").DataTable();
        $('#datatable').DataTable({
            scrollX: true,
        });

        $(document).ready(function(){
          $(document).on('click', '#edit', function(){
            var id = $(this).data('id');
            var nip = $(this).data('nip');
            var name = $(this).data('name');
            var role = $(this).data('role');
            var username = $(this).data('username');
            var email = $(this).data('email');
            var role = $(this).data('role');

            $('#nip').val(nip);
            $('#name').val(name);
            $('#role').val(role);
            $('#username').val(username);
            $('#email').val(email);
            $('#role').val(role);

            $('.form-edit').attr('action',`{{url('/users/${id}/update')}}`);
          })
          
        });
      </script>
      
@endsection