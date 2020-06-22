import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';
abstract class PokemonApi{
  Future<List<Pokemon>> getPokemonList();
}