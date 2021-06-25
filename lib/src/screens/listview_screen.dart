import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../theme.dart';

class LisViewScreen extends StatefulWidget {
  LisViewScreen({Key? key}) : super(key: key);

  @override
  _LisViewScreenState createState() => _LisViewScreenState();
}

class _LisViewScreenState extends State<LisViewScreen> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = <int>[];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addItems();
    this._scrollController.addListener(() {
      if (this._scrollController.position.pixels ==
          this._scrollController.position.maxScrollExtent) {
        _addItems();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('ListView'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: Stack(children: <Widget>[
        _createList(),
        _createLoading(),
      ]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getScreen,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];
          return FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          );
        },
        itemCount: _numberList.length,
      ),
    );
  }

  Future<Null> getScreen() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _addItems();
    });
    return Future.delayed(duration);
  }

  void _addItems() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    this._isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    this._isLoading = false;
    this._scrollController.animateTo(
          this._scrollController.position.pixels + 100,
          duration: Duration(microseconds: 250),
          curve: Curves.fastOutSlowIn,
        );
    _addItems();
  }

  Widget _createLoading() {
    if (this._isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                color: AppTheme.greenColor4,
              ),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
