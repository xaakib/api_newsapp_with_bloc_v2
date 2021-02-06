import 'package:api_newsapp_with_bloc_v2/bloc/bottom_navBar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:api_newsapp_with_bloc_v2/style/theme.dart' as theme;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: theme.Colors.mainColor,
          title: Text("NewsApp"),
        ),
      ),
    );
  }
}
