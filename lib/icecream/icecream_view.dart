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
            child: FutureBuilder<List<Icecream>?>(
              future: loadIcecreams(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final icecreams = snapshot.data!;
                  return ListView.builder(
                    itemCount: icecreams.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final icecream = icecreams[index];
                      return Card(
                        child: Text(icecream.flavor),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
