import 'dart:convert';

IcecreamData icecreamDataFromJson(String str){
  final jsonData = json.decode(str);
  return IcecreamData.fromJson(jsonData);

}

String icecreamDataToJson(IcecreamData data){
  final dyn = data.toJson();
  return json.encode(dyn);

}

class IcecreamData{
  List<Icecream>? icecreams;

}

class Icecream{
  String flavor;
  String? description;
  List<String>? toppings;
  double? price;
  String? image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    this.description,
    this.toppings,
    required this.price,
    this.image,
    required this.ingredients,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) => Icecream(
    flavor: json["flavor"],
    description:json["description"],
    toppings: json["toppings"] != null ? List<String>.from(json["toppings"]: []),
    price: json["price"].toDouble(),
    image: json["image"],
    ingredients: List<dynamic>.from(json["ingredients"].map((x) => Ingredient.fromJson(x)))
    
   )

  )


  Json["icecreams"].map((x)=> Icecream.fromJson(x))
}
