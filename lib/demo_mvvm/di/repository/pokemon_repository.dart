import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';
abstract class PokemonRepository{
  Future<List<Pokemon>> getPokemonRepository();
}