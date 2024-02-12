import 'package:flutter/material.dart';
import 'package:ice_cream/app/home_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Icecream App",
      home: HomeView(),
    );
  
  }
}
