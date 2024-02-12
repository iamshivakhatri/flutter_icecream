
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatefulWidget {
  const IcecreamView({
    super.key,
  });

  @override
  State<IcecreamView> createState() => _IcecreamViewState();
}

class _IcecreamViewState extends State<IcecreamView> {
  @override
  void initState() {
    super.initState();
    loadIcecreams();

  }

   Future <void> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString('assets/icecream.json');
    final decodedIcecreams = jsonDecode(rawIcecreams);
    print(decodedIcecreams);
   }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(20.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tasty Ice Creams",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
          ),
          Text("Multiple flavours of Ice cream available",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      
      ),
    );
  }
  
 
  
  
}
