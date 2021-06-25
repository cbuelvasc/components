import 'dart:convert';
import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> _options = <dynamic>[];

  _MenuProvider();

  List<dynamic> get options {
    return this._options;
  }

  set options(List<dynamic> options) {
    this._options = options;
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(response);
    _options = dataMap['routes'];
    return _options;
  }
}

final menuProvider = new _MenuProvider();
