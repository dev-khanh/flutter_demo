import 'package:flutterappexample/demo_mvvm/di/remote/pokemon_api.dart';
import 'package:flutterappexample/demo_mvvm/di/repository/pokemon_repository.dart';
import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository{
  PokemonApi pokemonApi;
  PokemonRepositoryImpl(PokemonApi pokemonApis){
    this.pokemonApi = pokemonApis;
  }
  @override
  Future<List<Pokemon>> getPokemonRepository() {
    return pokemonApi.getPokemonList();
  }
}