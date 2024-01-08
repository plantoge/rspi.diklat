@extends('layout.website.masterWebsite')

@section('konten')
<div class="mb-18">
    <div class="mb-10">
        <div class="text-center mb-15">
            <h3 class="fs-2hx text-dark mb-5">Tentang Kami</h3>
            <div class="fs-5 text-muted fw-bold">Within the last 10 years, we have sold over 100,000 admin theme copies that have been
            <br />successfully deployed by small businesses to global enterprises</div>
        </div>

        <div class="tns" style="direction: ltr">
            <div data-tns="true"  data-tns-nav-position="bottom" data-tns-mouse-drag="true" data-tns-controls="false">
                <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                    <img src="https://placehold.co/2000x800/png" class="card-rounded shadow mw-100" alt="" />
                    {{-- <img src="{{asset('public/Twebsite/v1/media/stock/2000x800/1.jpg')}}" class="card-rounded shadow mw-100" alt="" /> --}}
                </div>
                <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                    <img src="https://placehold.co/2000x800/png" class="card-rounded shadow mw-100" alt="" />
                    {{-- <img src="{{asset('public/Twebsite/v1/media/stock/2000x800/1.jpg')}}" class="card-rounded shadow mw-100" alt="" /> --}}
                </div>
                <div class="text-center px-5 pt-5 pt-lg-6 px-lg-6">
                    <img src="https://placehold.co/2000x800/png" class="card-rounded shadow mw-100" alt="" />
                    {{-- <img src="{{asset('public/Twebsite/v1/media/stock/2000x800/1.jpg')}}" class="card-rounded shadow mw-100" alt="" /> --}}
                </div>
                ...
            </div>
        </div>

    </div>
    <div class="fs-5 fw-bold text-gray-600">
        <p class="mb-8">First, a disclaimer – the entire process of writing a blog post often takes more than a couple of hours, even if you can type eighty words per minute and your writing skills are sharp. From the seed of the idea to finally hitting “Publish,” you might spend several days or maybe even a week “writing” a blog post, but it’s important to spend those vital hours planning your post and even thinking about
        <a href="../dist/pages/blog/post.html" class="link-primary pe-1">Your Post</a>(yes, thinking counts as working if you’re a blogger) before you actually write it.</p>
        <p class="mb-8">There’s an old maxim that states,
        <span class="text-gray-800 pe-1">“No fun for the writer, no fun for the reader.”</span>No matter what industry you’re working in, as a blogger, you should live and die by this statement.</p>
        <p class="mb-8">Before you do any of the following steps, be sure to pick a topic that actually interests you. Nothing – and
        <a href="../dist/pages/blog/home.html" class="link-primary pe-1">I mean NOTHING</a>– will kill a blog post more effectively than a lack of enthusiasm from the writer. You can tell when a writer is bored by their subject, and it’s so cringe-worthy it’s a little embarrassing.</p>
    </div>
</div>
@endsection