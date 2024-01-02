@extends('layout.panel.masterPanel')

@section('css')

@endsection
@section('konten')
<h1>Welcome, {{auth()->user()->name}}</h1>
@endsection
@section('js')

@endsection