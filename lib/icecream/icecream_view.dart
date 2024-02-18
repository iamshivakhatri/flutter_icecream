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
    Icecream? selectedIcecream;
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
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const Text(
            "Multiple flavours of Ice cream available",
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[ 
                FutureBuilder<List<Icecream>?>(
                future: loadIcecreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final icecreams = snapshot.data!;
                    selectedIcecream = icecreams[0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width, 
                          height: MediaQuery.of(context).size.height/3,
                          child: ListView.builder(
                            
              
                            itemBuilder: (context, index) {
                              final icecream = icecreams[index];
                              
                              return IcecreamCard(icecream, context);
                            },
                            itemCount: icecreams.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 20, 
                          ),

                        // second children of sized box
                        const Text(
                          "Toppings",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                            
              
                            itemBuilder: (context, index) {
                              final topping = selectedIcecream!.toppings![index];
                              return ListTile(
                                leading: CircleAvatar(backgroundImage: NetworkImage(selectedIcecream!.image!),),
                                title: Text(topping),
                                
                              );
                            },
                            itemCount: selectedIcecream!.toppings!.length,
                            scrollDirection: Axis.vertical,
                          ),

                      ],

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



  SizedBox IcecreamCard(Icecream icecream, BuildContext context) {
    return SizedBox(
                              width: 200,
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
  }
}
