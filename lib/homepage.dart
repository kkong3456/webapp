import 'package:flutter/material.dart';
import 'package:webapp/skeleton_loading/now_skeleton.dart';
import 'package:webapp/widget/icon_searchbar.dart';
import 'package:webapp/widget/main_drawer.dart';
import 'package:webapp/skeleton_loading/carousel_skeleton.dart';

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
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16,vertical:8),
              child: Text(
                'Top rated movies',
                style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Flexible(child: CarouselSkeleton(),flex:2),
                SizedBox(width:20),
                Flexible(child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal:16,vertical:8),
                      child:const Text(
                        'Now playing',
                        style:const TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    NowSkeleton(),
                  ],
                ),flex:1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
