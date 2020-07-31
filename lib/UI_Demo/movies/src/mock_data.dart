import 'models/actor_model.dart';
import 'models/movie_model.dart';
class MockData{
  List<MovieModel> movies = [];
  MovieModel bladeRunner;
  MovieModel missionImpossible;
  MovieModel amazingSpiderMan;

  MockData(){
    bladeRunner = MovieModel(
      title: 'Blade Runner 2049',
      genres: 'Sci-Fi, Drama, Mistery',
      imagePath: 'assets/images/movie/blade_runner_2049.jpg',
      language: 'EN',
      movieLength: 2.44,
      rating: 8.0,
      overView: "A young blade runner's discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who\'\s been missing for thirty years.",
      casting: [
        ActorModel(
          imagePath: 'assets/images/movie/ryan_gosling.jpg',
          actorName: 'Ryan Gosling',
          characterName: "'K'",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/dave_bautista.jpg',
          actorName: 'Dave Bautista',
          characterName: "Sapper Morton",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/robin_wright.jpg',
          actorName: 'Robin Wright',
          characterName: "Lieutenant Joshi",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/jared_leto.jpg',
          actorName: 'Jared Leto',
          characterName: "Niander Wallace",
        ),
      ],
    );
    missionImpossible = MovieModel(
      title: 'Mission Impossible',
      genres: 'Action, Adventure, Thriller',
      imagePath: 'assets/images/movie/mission_impossible.jpg',
      language: 'EN',
      movieLength: 2.27,
      rating: 7.8,
      overView: "Ethan Hunt and his IMF team, along with some familiar allies, race against time after a mission gone wrong.",
      casting: [
        ActorModel(
          imagePath: 'assets/images/movie/tom_cruise.jpg',
          actorName: 'Tom Cruise',
          characterName: "Ethan Hunt",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/henry_cavill.jpg',
          actorName: 'Henry Cavill',
          characterName: "August Walker",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/ving_rhames.jpg',
          actorName: 'Robin Wright',
          characterName: "Lieutenant Joshi",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/simon_pegg.jpg',
          actorName: 'Simon Pegg',
          characterName: "Behji Dunn",
        ),
      ],
    );
    amazingSpiderMan = MovieModel(
      title: 'The Amazing Spiderman',
      genres: 'Action, Adventure, Sci-Fi',
      imagePath: 'assets/images/movie/amazing_spider_man.png',
      language: 'EN',
      movieLength: 2.22,
      rating: 6.6,
      overView: "When New York is put under siege by Oscorp, it is up to Spider-Man to save the city he swore to protect as well as his loved ones.",
      casting: [
        ActorModel(
          imagePath: 'assets/images/movie/andrew_garfield.jpg',
          actorName: 'Andrew Garfield',
          characterName: "Peter Parker",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/emma_stone.jpg',
          actorName: 'Emma Stone',
          characterName: "Gwen Stacy",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/jamie_foxx.jpg',
          actorName: 'Jamie Foxx',
          characterName: "Max Dillon",
        ),
        ActorModel(
          imagePath: 'assets/images/movie/dane_dehaan.jpg',
          actorName: 'Dane DeHaan',
          characterName: "Harry Osborn",
        ),
      ],

    );
  }



  List<MovieModel> getMovies(){
    movies.add(bladeRunner);
    movies.add(missionImpossible);
    movies.add(amazingSpiderMan);
    return movies;
  }
}