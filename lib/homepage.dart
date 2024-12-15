import 'package:flutter/material.dart';
import 'package:webapp/widget/icon_searchbar.dart';
import 'package:webapp/widget/main_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:IconSearchbar(),
      drawer:MainDrawer(),
      body:SingleChildScrollView(
        child:Column(
          children: [
            Text(
              'Top rated movies',
              style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
