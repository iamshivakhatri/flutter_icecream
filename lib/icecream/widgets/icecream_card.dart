
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream/model/icecream.dart';


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
                                    Hero(
                                      tag: icecream.image!,
                                      child: CachedNetworkImage(
                                        imageUrl: icecream.image!,
                                        fit: BoxFit.cover,
                                        height: 400,
                                        ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            ),
                                            
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                                                
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
                                          ],),
                                      )
                                    )
                                  ],
                                ),
                              ),
                            );
  }

