import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream/icecream/views/icecream_detail_view.dart';
import 'package:ice_cream/icecream/widgets/icecream_card.dart';
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
                              
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return IcecreamDetailView(icecream: icecream,);
                                      }
                                  )
                                  );
                                },
                                child: IcecreamCard(icecream, context)
                                );
                            },
                            itemCount: icecreams.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 20, 
                          ),

                        // second children of sized box
                        

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



  
}
