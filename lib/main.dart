import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'homepage.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router=GoRouter(routes:[
    GoRoute(
      path:'/',
      builder:(context,state)=>HomePage(),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner:false,
      theme:ThemeData.dark(),
      routerConfig:_router, 
    );
  }
}
