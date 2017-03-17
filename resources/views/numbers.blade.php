@extends('layouts.app')

@section('content')
  <div class="row">
    <div class="col-md-6">
      <h3>Таблица номеров из БД | <a href="/">Назад</a></h3>
      <ul>
      @foreach($numbers as $number)
        <li>{{ $number->number}}</li>
      @endforeach
      </ul>
      @if (count($numbers))
      {{ $numbers->links() }}
      @endif
    </div>

    <div class="col-md-6">
      <h3>Поиск номера из Redis | <a href="/">Назад</a></h3>

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
    </div>
  </div>


@endsection
