import 'package:flutter/material.dart';
import 'package:flutter_app/unitConvertor/Unit.dart';

const _padding = EdgeInsets.all(10.0);

class UnitConverter extends StatefulWidget {
  final List<Unit> units;

  const UnitConverter({Key key, this.units}) : super(key: key);

  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  Unit _fromVal, _toVal;
  List<DropdownMenuItem> _unitMenuItems;

  String _convertedValue;

  double _inputValue;

  @override
  void initState() {
    super.initState();
    _setDefaults();
    _createDropDownMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    var mainContent = Column(
      children: <Widget>[inputVal(), arrow(), outputVal()],
    );

    return Padding(
        padding: _padding,
        child: Center(
          child: mainContent,
        ));
  }

  void _setDefaults() {
    _fromVal = widget.units[0];
    _toVal = widget.units[1];
  }

  void _createDropDownMenuItems() {
    var unitMenuItems = widget.units
        .map((unit) => DropdownMenuItem(
            value: unit.name,
            child: Text(
              unit.name,
              softWrap: true,
            )))
        .toList();
    setState(() {
      _unitMenuItems = unitMenuItems;
    });
  }

  inputVal() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              labelText: "Input",
              labelStyle: Theme.of(context).textTheme.display1,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          ),
          _createDropdown(_fromVal.name, _updateFromConversion)
        ],
      );

  arrow() => RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ),
      );

  outputVal() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            child: Text(
              _convertedValue.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
                labelText: 'Output',
                labelStyle: Theme.of(context).textTheme.display1,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0))),
          ),
          _createDropdown(_toVal.name, _updateToConversion)
        ],
      );

  _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(color: Colors.grey[400], width: 1.0)),
      padding: EdgeInsets.all(8.0),
      child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[50],
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value: currentValue,
                items: _unitMenuItems,
                onChanged: onChanged,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          )),
    );
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _convertedValue = '';
      } else {
        try {
          var inputDouble = double.parse(input);
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print("Error : $e");
        }
      }
    });
  }

  Unit _getUnit(String unitName) {
    return widget.units.firstWhere(
      (Unit unit) {
        return unit.name == unitName;
      },
      orElse: null,
    );
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toVal = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromVal = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateConversion() {
    setState(() {
      _convertedValue =
          (_inputValue * (_toVal.conversion / _fromVal.conversion)).toString();
    });
  }
}
