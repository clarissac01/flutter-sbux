import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starbucks/models/drink.dart';
import 'package:starbucks/models/review.dart';
import 'package:starbucks/utils/globals.dart' as global;

class DrinkDetailPage extends StatefulWidget {
  Drink drink;

  DrinkDetailPage({required this.drink});

  @override
  State<StatefulWidget> createState() {
    return DrinkDetailState(drink: drink);
  }
}

class DrinkDetailState extends State<DrinkDetailPage> {
  Drink drink;
  DrinkDetailState({required this.drink});
  var review = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(drink.name),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.coffee_rounded),
                text: 'Detail',
              ),
              Tab(
                icon: Icon(Icons.reviews_rounded),
                text: 'Reviews',
              )
            ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          height: 120,
                          width: 120,
                          child: Image.asset(drink.imgPath),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                drink.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                drink.price,
                              )
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'About this drink:',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        drink.description,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Add a Review!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: review,
                        decoration: InputDecoration(
                          hintText: 'Add Your Review Here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (review.text.isNotEmpty) {
                                setState(() {
                                  drink.reviews.add(
                                      new Review(review.text, global.username));
                                  review.text = '';
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Review must not be empty!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.send_rounded),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  for (var r in drink.reviews)
                    Card(
                      child: ListTile(
                        title: Text(r.review),
                        subtitle: Text(r.reviewer),
                      ),
                    )
                ],
              ),
            )
          ]),
        ));
  }
}
