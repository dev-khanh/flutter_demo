import 'package:flutter/material.dart';

class Images {
  static const appleImage =
      const AssetImage('assets/images/flut_store/apple.png');
  static const avocadoImage =
      const AssetImage('assets/images/flut_store/avocado.png');
  static const grapeImage =
      const AssetImage('assets/images/flut_store/grape.png');
  static const lemonImage =
      const AssetImage('assets/images/flut_store/lemon.png');
  static const orangeImage =
      const AssetImage('assets/images/flut_store/orange.png');
}

class ImageAssetPath {
  static const appleImage = 'assets/images/flut_store/apple.png';
  static const avocadoImage ='assets/images/flut_store/avocado.png';
  static const grapeImage = 'assets/images/flut_store/grape.png';
  static const lemonImage = 'assets/images/flut_store/lemon.png';
  static const orangeImage = 'assets/images/flut_store/orange.png';
}

class Fonts {
  static const primaryFont = "Quicksand";
}

class Texts {
  static const header = const Text(
    "All Fruits",
    style: TextStyle(
        fontFamily: Fonts.primaryFont,
        fontSize: 25.0,
        fontWeight: FontWeight.bold),
  );

  static const subHeader = const Text(
    "Sales",
    style: TextStyle(
      fontSize: 20.0,
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
    ),
  );
}

class TabText {
  static const tabText1 = const Text(
    "Avocado",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),
  );

  static const tabText2 = const Text(
    "Grapes",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),
  );

  static const tabText3 = const Text(
    "Apple",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),
  );

  static const tabText4 = const Text(
    "Grapefruit",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),
  );
}