@extends('layout.dashboard.v2.masterv2Konten')

@section('css')
      <!-- DataTables -->
      <link href="{{asset('public/dashboard/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css')}}" rel="stylesheet">
      
@endsection

@section('title')
  Manage Account
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item text-dark">Permission</li>
    <li class="breadcrumb-item text-muted">
        <a href="{{url('/permission')}}" class="text-muted">Home</a>
    </li>
@endsection

@section('buttonHeader')
    <button type="button" data-bs-toggle="modal" data-bs-target="#tambah-permission" class="float-right btn btn-info">Tambah Data</button>
@endsection

@section('content')

        <div class="row">

            <div class="col col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                    <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap">
                      <thead>
                          <tr>
                              <th>No</th>
                              <th>Permission</th>
                              <th>Guard</th>
                              <th>Aksi</th>
                              <!-- <th>Aksi</th> -->
                          </tr>
                      </thead>
                      <tbody>
                        @foreach($Mpermission as $i)
                          <tr>
                              <td>{{$loop->iteration}}</td>
                              <td>{{$i->name}}</td>
                              <td>{{$i->guard_name}}</td>
                              <td class="d-flex justify-content-center">
                                @if($i->id != 4)
                                <button 
                                  id="edit"
                                  class="btn btn-info btn-sm me-1" 
                                  data-bs-toggle="modal" 
                                  data-bs-target="#edit-permission"
                                  data-id="{{$i->id}}"
                                  data-name="{{$i->name}}"
                                  data-guard_name="{{$i->guard_name}}">Edit</button>
                                {{-- <a href='{{url("/users/{$i->id}/edit")}}' class="btn btn-info btn-sm mr-1">Edit</a> --}}
                                <form method="POST" action="{{url('/permission/'.$i->id.'/delete')}}">
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

        <div class="row">
          <div class="col">
            
            <div class="modal fade" id="tambah-permission" tabindex="-1">
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
                    
                    <form action="{{url('/permission/store')}}" method="post">
                      <div class="container mb-4">
                          <div class="row">
                            
                              <div class="col col-lg-12">
                                  @csrf
                                  <div class="form-group">
                                    <label>Nama Permission</label>
                                    <input type="text" name="name" class="form-control">
                                  </div>
                                  <div class="form-group">
                                      <label>Guard Name</label>
                                      <input type="guard_name" name="guard_name" placeholder="web | api" class="form-control">
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
            
            <div class="modal fade" id="edit-permission" tabindex="-1">
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
                            
                            <form id="formedit" method="post">
                              <div class="container mb-4">
                                  <div class="row">
                                    
                                      <div class="col col-lg-12">
                                          @csrf
                                          @method('patch')
                                          <div class="form-group">
                                            <label>Nama Permission</label>
                                            <input type="text" id="name" name="name" class="form-control">
                                          </div>
                                          <div class="form-group">
                                              <label>Guard Name</label>
                                              <input type="guard_name" id="guard_name" name="guard_name" placeholder="web | api" class="form-control">
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
      <script src="{{asset('public/dashboard/extra-libs/datatables.net/js/jquery.dataTables.min.js')}}"></script>

      <script>
        $('#datatable').DataTable({
            scrollX: true,
        });

        $(document).ready(function(){
          $(document).on('click', '#edit', function(){
            var id = $(this).data('id');
            var name = $(this).data('name');
            var guard_name = $(this).data('guard_name');

            $('#name').val(name);
            $('#guard_name').val(guard_name);

            $('#formedit').attr('action',`{{url('/permission/${id}/update')}}`);
          })
          
        });
      </script>
      
@endsection