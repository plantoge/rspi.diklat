@extends('layout.website.masterWebsite')

@section('konten')
{{-- {{$slug}} <br> {{$id}} --}}

<div class="mb-18 pt-0">
    <div class="text-center mb-12">
        <h5 class="fs-1 text-dark mb-5 text-capitalize">{{$kelas->EVENT_JUDUL}}</h5>
        <div class="fs-5 text-muted fw-bold text-capitalize">{{$kelas->EVENT_DESKRIPSI_SINGKAT}}</div>
    </div>
    <div class="container">
        <div class="row d-flex flex-row justify-content-center">
            <div class="col col-lg-5 px-10 d-flex flex-row align-items-center gap-2 justify-content-end">
                <h6 class="fw-normal">Rilis {{\Carbon\Carbon::parse($kelas->created_at)->format('F Y')}}</h6>
            </div>
            <div class="col col-lg-5 px-10 d-flex flex-row align-items-center gap-2 justify-content-start">
                <h6 class="fw-normal">Update {{\Carbon\Carbon::parse($kelas->updated_at)->format('F Y')}}</h6>
            </div>
        </div>

        {{-- <div class="row my-10">
            <div class="col-lg-3 col-6">
                <div class="item text-center">
                    <h5>
                        Kategori
                    </h5>
                    <p>
                        <strong>8</strong> enrolled
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <div class="item text-center">
                    <h5>
                        Member
                    </h5>
                    <p>
                        <strong>8</strong> enrolled
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <div class="item text-center">
                    <h5>
                        Member
                    </h5>
                    <p>
                        <strong>8</strong> enrolled
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <div class="item text-center">
                    <h5>
                        Sertifikat
                    </h5>
                    <p>
                        <strong>8</strong> enrolled
                    </p>
                </div>
            </div>
        </div> --}}
        
        <div class="row d-flex flex-row justify-content-center">
            <div class="col-sm-12 col-lg-5 px-10 my-10 d-flex flex-row align-items-center gap-2 justify-content-end">
                @if ($kelas->EVENT_GAMBAR)
                <img class="img-fluid" src="https://placehold.co/400x500/png" alt="" sizes="" srcset="">
                @else
                <img class="img-fluid" src="{{asset('storage/app/gambar_event/'.$kelas->EVENT_GAMBAR)}}" alt="" sizes="" srcset="">
                @endif
            </div>
            <div class="col-sm-12 col-lg-7 px-10 my-10 d-fle flex-ro align-items-cente gap-2 justify-content-start">

                <div class="fw-bold w-100 fs-3 text-gray-600 text-dark mt-3 mb-5">
                    @if($kelas->EVENT_DISKON == 0)
                        <span class="dw-bold"> Rp. @matauang($kelas->EVENT_HARGA)</span>
                    @else
                        @php 
                            $harga_diskon = $kelas->EVENT_HARGA - $kelas->EVENT_DISKON;
                        @endphp
                        <span class="fw-bold blinking-text text-danger"> Rp. @matauang($kelas->EVENT_HARGA)</span>
                        <span class="dw-bold"> Rp. @matauang($harga_diskon)</span>
                    @endif
                </div>

                <blockquote>
                    <p style="text-align: justfy; line-height: 2;">
                        {!! $kelas->EVENT_DESKRIPSI_PANJANG !!}
                    </p>
                </blockquote>
                <span class="badge badge-primary">Kategori</span>
                <br>
                <br>
                <a class="btn btn-primary w-100" onclick="checkSignin('{{$slug}}', '{{$id}}')">Beli sekarang</a>
                {{-- href="{{url('checkout-kelas/'.$slug.'/'.$id)}}" --}}
            </div>
        </div>
    
    </div>
</div>
@endsection

@section('js')

<script>
    async function checkSignin(slug, id) {
        try {
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            const response = await fetch("<?= url('auth-check-signin'); ?>", {
                method: 'POST',
                headers: {
                'X-CSRF-TOKEN': csrfToken,
                'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                'id': 'fauzi'
                })
            });
            let data = await response.json();
            console.log(data);

            if(data == false){
                $('#modal_login').modal('show');
            }else{
                window.location.href=`{{url('/checkout-kelas/${slug}/${id}')}}`;
            }
            // let deposit = data.sisa_uang_muka;
            
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }
</script>

@endsection