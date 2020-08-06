import 'dart:async';
import 'dart:ui';

import 'package:translator/translator.dart';

bool isDark(Color color) {
  final luminence =
      (0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue);
  return luminence < 150;
}

class DemoLang {
  String data = "";

  isStringDark(String text) {
    GoogleTranslator().translate(text, from: 'en', to: 'vi').then((result) => _handleNewPage(result));
    var timer = Timer(Duration(milliseconds: 1000), () => print('data: '+ data));

//    timer.cancel();

    return data;
  }

  _handleNewPage(Translation page) {
    print("DEVK page: " + page.text);
    data = page.text;
  }
}
DemoLang lang = DemoLang();
