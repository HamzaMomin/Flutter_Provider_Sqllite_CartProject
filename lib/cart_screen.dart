import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'cart_modal.dart';
import 'class_provider.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Products'),
          centerTitle: true,
          actions: [
            Center(
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: ((context, value, child) {
                    return Text(value.getCounter().toString(),
                        style: TextStyle(color: Colors.white));
                  }),
                ),
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                ),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: cart.getData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image(
                                              height: 100,
                                              width: 100,
                                              image: NetworkImage(snapshot
                                                  .data![index].image
                                                  .toString()),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          snapshot.data![index]
                                                              .productName
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                                  .unitTag
                                                                  .toString() +
                                                              " " +
                                                              r"$" +
                                                              snapshot
                                                                  .data![index]
                                                                  .productPrice
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ])
                                                ]))
                                          ])
                                    ],
                                  ),
                                ),
                              );
                            }));
                  }
                  //error on the backet
                  return Text('');
                })
          ],
        ));
  }
}
