import 'package:flutterappexample/demo_mvvm/di/base/base_user_case.dart';
import 'package:flutterappexample/demo_mvvm/di/repository/pokemon_repository.dart';
import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';

class GetPokemonList extends BaseUserCase<List<Pokemon>>{
  PokemonRepository pokemonRepository;
  GetPokemonList(PokemonRepository repository){
    this.pokemonRepository = repository;
  }
  @override
  Future<List<Pokemon>> perform() {
    return pokemonRepository.getPokemonRepository();
  }
}