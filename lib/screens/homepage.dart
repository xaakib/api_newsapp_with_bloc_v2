import 'package:api_newsapp_with_bloc_v2/model/source.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  SourceModel _sourceModel;
  @override
  Widget build(BuildContext context) {
    print(_sourceModel.descriptions ?? "No Data");
    return Scaffold();
  }
}
