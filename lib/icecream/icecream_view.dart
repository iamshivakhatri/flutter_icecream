import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream/model/icecream.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({Key? key});

  Future<List<Icecream>?> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString('assets/icecream.json');
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tasty Ice Creams",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Multiple flavours of Ice cream available",
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          Expanded(
            child: Column(
              children:[ 
                FutureBuilder<List<Icecream>?>(
                future: loadIcecreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final icecreams = snapshot.data!;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width, 
                      height: MediaQuery.of(context).size.height/2.5,
                      child: ListView.builder(
                        itemCount: icecreams.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final icecream = icecreams[index];
                          return SizedBox(
                            width: 200,
                            height: 100,
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              color: Colors.yellow[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    icecream.image!,
                                    fit: BoxFit.cover,
                                    height: 400,
                                    ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                      
                                        children: [
                                          Text(
                                        icecream.flavor,
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\$${icecream.price.toString()}",
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                        ],)
                                    )
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
        ]),
          ),
        ],
      ),
    );
  }
}
