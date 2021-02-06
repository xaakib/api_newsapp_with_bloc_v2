import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget buildLoaderWidget() {
  return Center(
    child: Column(
      children: [
        CupertinoActivityIndicator(),
      ],
    ),
  );
}
