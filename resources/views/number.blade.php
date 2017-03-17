@extends('layouts.app')

@section('content')
  <h3>Поиск номера из Redis | <a href="/numbers">Список</a> | <a href="/">Главная</a></h3>

  @include('search')

  @if (count($errors))
  <div class="alert alert-danger">
    <ul>
      @foreach($errors->all() as $error)
      <li>{{ $error }}</li>
      @endforeach
    </ul>
  </div>
  @endif

  <h4>{{ $status or '' }}</h4>
@endsection
