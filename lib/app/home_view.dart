import 'package:flutter/material.dart';
import 'package:ice_cream/icecream/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 237),
      body: SafeArea(
        child: IcecreamView()
        )
    );
  }
}