import 'package:flutter/material.dart';
import 'package:ice_cream/icecream/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: IcecreamView()
        )
    );
  }
}