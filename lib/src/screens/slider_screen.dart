import 'package:flutter/material.dart';

import '../../theme.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Slider'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: AppTheme.greenColor4,
      inactiveColor: AppTheme.yellowColor4,
      label: 'Image size',
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
        title: Text('Block Slider'),
        activeColor: AppTheme.greenColor4,
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            this._blockCheck = value!;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      activeColor: AppTheme.greenColor4,
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          this._blockCheck = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
