import 'package:flutter/material.dart';

import 'package:components/src/screens/home_screen.dart';
import 'package:components/src/screens/alert_screen.dart';
import 'package:components/src/screens/avatar_screen.dart';
import 'package:components/src/screens/card_screen.dart';
import 'package:components/src/screens/animated_container_screen.dart';
import 'package:components/src/screens/input_screen.dart';
import 'package:components/src/screens/slider_screen.dart';
import 'package:components/src/screens/listview_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    'alert': (BuildContext context) => AlertScreen(),
    'avatar': (BuildContext context) => AvatarScreen(),
    'card': (BuildContext context) => CardScreen(),
    'animatedContainer': (BuildContext context) => AnimatedContainerScreen(),
    'inputs': (BuildContext context) => InputScreen(),
    'slider': (BuildContext context) => SliderScreen(),
    'list': (BuildContext context) => LisViewScreen(),
  };
}
