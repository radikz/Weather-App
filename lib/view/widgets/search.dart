import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String? initialValue;
  final Function(String) onFieldSubmitted;

  Search({this.initialValue, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        alignment: Alignment.center,
        width: width > 600 ? 600 : width,
        child: TextFormField(
          initialValue: initialValue,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, size: 30.0),
              contentPadding: EdgeInsets.only(left: 10.0, top: 15.0),
              hintText: 'Search by city name',
              hintStyle: TextStyle(color: Colors.grey)),
          onFieldSubmitted: (value) {
            onFieldSubmitted(value);
          },
        ),
      ),
    );
  }
}
