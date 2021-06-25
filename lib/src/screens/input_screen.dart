import 'package:flutter/material.dart';

import '../../theme.dart';

class InputScreen extends StatefulWidget {
  InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late String _name = '';

  late String _email = '';

  late String _password = '';

  late String _date = '';

  late String _selectOption = 'Fly';

  late List<String> _listPowers = <String>['Fly', 'X Ray', 'Stronger'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Inputs'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordlInput(),
          Divider(),
          _createDateInput(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppTheme.greenColor4),
        ),
        counter: Text(
          'Characters ${_name.length}',
          style: TextStyle(color: AppTheme.greenColor4),
        ),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Name of person',
        suffixIcon: Icon(
          Icons.accessibility,
          color: AppTheme.greenColor4,
        ),
        icon: Icon(
          Icons.account_circle,
          color: AppTheme.greenColor4,
        ),
        labelStyle: TextStyle(color: AppTheme.greenColor4),
      ),
      onChanged: (value) {
        setState(() {
          this._name = value;
        });
      },
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppTheme.greenColor4),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(
          Icons.alternate_email,
          color: AppTheme.greenColor4,
        ),
        icon: Icon(
          Icons.email,
          color: AppTheme.greenColor4,
        ),
        labelStyle: TextStyle(color: AppTheme.greenColor4),
      ),
      onChanged: (value) {
        setState(() {
          this._email = value;
        });
      },
    );
  }

  Widget _createPasswordlInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppTheme.greenColor4),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.lock_open,
          color: AppTheme.greenColor4,
        ),
        icon: Icon(
          Icons.lock,
          color: AppTheme.greenColor4,
        ),
        labelStyle: TextStyle(color: AppTheme.greenColor4),
      ),
      onChanged: (value) {
        setState(() {
          this._password = value;
        });
      },
    );
  }

  Widget _createDateInput(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppTheme.greenColor4),
        ),
        hintText: 'Date of born',
        labelText: 'Date of born',
        suffixIcon: Icon(
          Icons.perm_contact_calendar,
          color: AppTheme.greenColor4,
        ),
        icon: Icon(
          Icons.calendar_today,
          color: AppTheme.greenColor4,
        ),
        labelStyle: TextStyle(color: AppTheme.greenColor4),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('en', 'US'),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: AppTheme.greenColor,
            accentColor: AppTheme.greenColor,
            colorScheme: ColorScheme.dark(primary: AppTheme.greenColor4),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    // ignore: unnecessary_null_comparison
    if (picked != null) {
      setState(() {
        this._date = picked.toString();
        _inputFieldDateController.text = this._date;
      });
    }
  }

  List<DropdownMenuItem<String>> _getItemsDropdown() {
    List<DropdownMenuItem<String>> _listItems = <DropdownMenuItem<String>>[];
    this._listPowers.forEach((power) {
      _listItems.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return _listItems;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(
          Icons.select_all,
          color: AppTheme.greenColor4,
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: this._selectOption,
            items: _getItemsDropdown(),
            onChanged: (value) {
              setState(() {
                this._selectOption = value.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(this._selectOption),
    );
  }
}
