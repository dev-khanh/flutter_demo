import 'dart:async';
import 'package:flutterappexample/demo_mvvm/di/base/get_pokemon_list.dart';
import 'package:flutterappexample/demo_mvvm/di/remote/pokemon_api_get.dart';
import 'package:flutterappexample/demo_mvvm/di/repository/pokemon_repository_impl.dart';
import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';
import 'package:rxdart/rxdart.dart';

class ViewModelPokeList{
  var pokemonListSubject = PublishSubject<List<Pokemon>>();
  Stream<List<Pokemon>> get pokemonList => pokemonListSubject.stream;
  GetPokemonList getPokemonListUseCase = GetPokemonList(PokemonRepositoryImpl(PokemonApiGet()));
  void getPokemonList() async {
    try {
      pokemonListSubject = PublishSubject<List<Pokemon>>();
      pokemonListSubject.sink.add(await getPokemonListUseCase.perform());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      pokemonListSubject.sink.addError(e);
    }
  }
  void closeObservable() {
    pokemonListSubject.close();
  }
}