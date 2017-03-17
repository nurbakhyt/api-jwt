@extends('layouts.app')

@section('content')
  <h3>Загрузка файла | <a href="/numbers">Список ({{ $count }})</a></h3>
  <form method="post" action="/" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="form-group">
      <label for="exampleInputFile">Выберите CSV файл</label>
      <input type="file" name="csv" id="exampleInputFile">
      <p class="help-block">со списком тел. номеров</p>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary">Отправить</button>
    </div>
    @if (session('warning'))
    <div class="alert alert-warning">
      {{ session('warning') }}
    </div>
    @endif
    @if (session('info'))
    <div class="alert alert-info">
      {{ session('info') }}
    </div>
    @endif
  </form>
@endsection
