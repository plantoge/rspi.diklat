@extends('layout.website.masterWebsite')

@section('konten')
{{-- {{$slug}} <br> {{$id}} --}}

<div class="mb-18 pt-0">
    <div class="text-center mb-12">
        <h3 class="fs-2hx text-dark mb-5">Judul Pelatihan</h3>
        <div class="fs-5 text-muted fw-bold">Deskripsi dari pelatihan</div>
    </div>
    <div class="container">
        <div class="row d-flex flex-row justify-content-center">
            <div class="col col-lg-5 px-10 d-flex flex-row align-items-center gap-2 justify-content-end">
                <h6 class="fw-normal">Rilis September 2023</h6>
            </div>
            <div class="col col-lg-5 px-10 d-flex flex-row align-items-center gap-2 justify-content-start">
                <h6 class="fw-normal">Update September 2023</h6>
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
                <img class="img-fluid" src="https://placehold.co/400x500/png" alt="" sizes="" srcset="">
            </div>
            <div class="col-sm-12 col-lg-7 px-10 my-10 d-fle flex-ro align-items-cente gap-2 justify-content-start">

                <div class="fw-bold w-100 fs-3 text-gray-600 text-dark mt-3 mb-5">
                    <span class="fw-bold blinking-text text-danger"> Rp. 1.000.000</span>
                    <span class="dw-bold"> Rp. 1.000.000</span>
                </div>

                <blockquote>
                    <p style="text-align: justify; line-height: 2;">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero aspernatur aliquam quisquam cum molestiae ipsa ratione optio, vel adipisci dolor magni, explicabo repellendus? Iusto quaerat asperiores nihil ab? Ad, et?
                        Ratione perferendis dicta voluptates tempora asperiores nihil quo iusto a aspernatur. Aut provident architecto error commodi modi possimus nihil eveniet, iure, quos odit ad quaerat atque voluptatum, esse dolorem amet.
                        Laudantium repellendus assumenda eveniet. Praesentium dolorum facilis sint obcaecati officia enim laborum beatae perferendis, natus accusantium consequuntur provident dignissimos tempore ducimus odit dolor aspernatur? Commodi explicabo incidunt perferendis exercitationem laudantium.
                        Perspiciatis, et consequuntur fugiat, veniam quaerat.
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