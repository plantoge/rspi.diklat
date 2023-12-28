@extends('layout.dashboard.v2.masterv2Konten')

@section('css')

        <!-- SELECT2 -->
        <link href="{{asset('public/dashboard/libs/select2/dist/css/select2.min.css')}}" rel="stylesheet" />

@endsection

@section('title')
  Manage Account
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item text-dark">User - Role</li>
    <li class="breadcrumb-item text-dark">Assign Role</li>
    <li class="breadcrumb-item text-muted">
        <a href="{{url('assignrole/'.$id.'/create')}}" class="text-muted">Here</a>
    </li>
@endsection

{{-- @section('buttonHeader')
    <button type="button" data-bs-toggle="modal" data-bs-target="#tambah-user" class="float-right btn btn-info">Tambah Data</button>
@endsection --}}

@section('content')

{{-- <div class="jumbotron jumbotron-fluid">
    <div class="container"> --}}
        
    

    <div class="row">
        <div class="col-lg-12">
                    
            <form action="{{url('/assignrole/store')}}" method="post">
                @csrf
                
                <table class="table table-bordered">
                    <thead>
                        <tr>
                        <th scope="col" style="width: 10%;">#</th>
                        <th scope="col" style="width: 90%;">Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($Mrole as $i)
                            <tr>
                                <td>{{$loop->iteration}}</td>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" name="role[]" type="checkbox" value="{{$i->name}}" id="{{$i->name}}" <?php if($Muser->hasRole($i->name)){echo "checked";} ?> >
                                        <input type="hidden" name="id" value="{{$id}}">
                                        <label class="form-check-label" for="{{$i->name}}">
                                            {{$i->name}}
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <a type="submit" href="{{url('assignrole')}}" class="btn btn-warning">Back</a>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>

                
        </div>
    </div>

    {{-- </div>
</div> --}}

@endsection



@section('js')

        <!-- SELECT 2 -->
        <script src="{{asset('public/dashboard/libs/select2/dist/js/select2.min.js')}}"></script>
        <script>
            $(".js-example-responsive").select2({
                width: 'resolve'
            });
        </script>


@endsection


    

