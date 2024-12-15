import 'package:flutter/material.dart';
import 'package:webapp/widget/icon_searchbar.dart';
import 'package:webapp/widget/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:IconSearchbar(),
      drawer:const MainDrawer(),
      body:const Center(
        child:Text('Movie site')
      ),
    );
  }
}
