import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/sreach-screen';
  final String sreachQuery;
  const SearchScreen({Key? key, required this.sreachQuery}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
