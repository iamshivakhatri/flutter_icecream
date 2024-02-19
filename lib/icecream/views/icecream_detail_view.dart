import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream/model/icecream.dart';

class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView( {super.key, required this.icecream});
  final   Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(icecream.flavor!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CachedNetworkImage(
            imageUrl: icecream.image!,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.cover,
          ),
          
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  icecream.flavor
                  ),
                  Text(
                  "\$${icecream.price.toString()}",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                
              ],
            ),
            ),
          )

        ],
      ),
    );
  }
}