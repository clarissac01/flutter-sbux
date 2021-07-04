import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starbucks/models/drink.dart';
import 'package:starbucks/models/review.dart';
import 'package:starbucks/pages/drinkdetail.dart';

class DrinksPage extends StatelessWidget {
  var coffee = [
    Drink(
        'assets/menu1.jpg',
        'Iced Cinnamon Dolce Latte',
        'Rp. 50000',
        'We add freshly steamed milk and cinnamon dolce-flavored syrup to our classic espresso and ice, topped with sweetened whipped cream and a cinnamon dolce topping to bring you specialness in a treat.',
        [
          new Review('such a good drink', 'brandon'),
          new Review('i like it', 'gaby')
        ]),
    Drink(
        'assets/menu2.jpg',
        'Iced Cafe Mocha',
        'Rp. 55000',
        'Our rich, full-bodied espresso combined with bittersweet mocha sauce, milk and ice, then topped with sweetened whipped cream. The classic iced coffee drink that always sweetly satisfies.',
        [
          new Review('too sweet for me', 'ritchie'),
          new Review('delicious', 'vincent')
        ]),
    Drink(
        'assets/menu3.jpg',
        'Iced White Chocolate Mocha',
        'Rp. 55000',
        'Our signature espresso meets white chocholate sauce, milk and ice, and then is finished off with sweetened whipped cream to create this supreme white chocolate delight.',
        [new Review('perfect drink', 'peter')]),
    Drink(
        'assets/menu4.jpg',
        'Caramel Frappucinno Blended',
        'Rp. 60000',
        'Caramel syrup meets coffee, milk and ice for a rendezvous in the blender, while whipped cream and buttery cream sauce layer the love on top. To change things up, try it affogato-style with a hot espresso shot poured right over the top.',
        [new Review('love this drink', 'cleo')]),
    Drink(
        'assets/menu5.jpg',
        'Java Chip Frappucinno Blended',
        'Rp. 60000',
        'We blend mocha sauce and Frappucinno chips with coffee, milk and ice, then top it off with whipped cream and a mocha drizzle to bring you endless java joy.',
        [new Review('favorite sbux drinks all the time', 'stanley')]),
    Drink(
        'assets/menu6.jpg',
        'Chai Creme Frappucinno Blended',
        'Rp. 60000',
        'A creamy blend of spicy chai, milk and ice, finished with sweetened whipped cream and a sprinkle of cinnamon. Specially made to spice up your afternoon treat.',
        [
          new Review('great way to begin the day!', 'clarissa'),
          new Review('my favorite beverage', 'gaby')
        ])
  ];
  var noncoffee = [
    Drink(
        'assets/noncoffee1.jpg',
        'Hot Chocolate',
        'Rp. 50000',
        'Steamed milk and mocha sauce topped with sweetened whipped cream and a chocolate-flavored drizzle. A timeless classic made to sweeten your spirits.',
        [
          new Review('reminds me of christmas', 'gaby'),
          new Review('nice!', 'peter')
        ]),
    Drink(
        'assets/noncoffee2.jpg',
        'White Hot Chocolate',
        'Rp. 50000',
        'A traditional hot chocolate beverage made with white chocolate sauce and steamed milk, topped with whipped cream.',
        [new Review('sweet!', 'ritchie')]),
    Drink(
        'assets/noncoffee3.jpg',
        'Iced Passion Tango Tea Lemonade',
        'Rp. 30000',
        'Our blend of hibiscus, lemongrass and apple, handshaken with ice, lemonade and, of course, passion.',
        [new Review('such a fresh drink!', 'vincent')]),
    Drink(
        'assets/noncoffee4.jpg',
        'Pink Drink',
        'Rp. 35000',
        'Our crisp, Strawberry Acai Refreshers Beverage, with its accents of passion fruit, is combined with creamy coconut milk. A fruity and refreshing sip of sprin, no matter what time of year.',
        [
          new Review('i could taste the strawberry very nicely', 'cleo'),
          new Review('creamy but still incredibly refreshing!', 'peter')
        ]),
    Drink(
        'assets/noncoffee5.jpg',
        'Iced Matcha Tea Latte',
        'Rp. 50000',
        'Smooth and creamy matcha sweetened just right and serves with milk over ice. Green has never tasted so good.',
        [
          new Review('as a matcha lover, this is highly recommended', 'stanley')
        ]),
    Drink(
        'assets/noncoffee6.jpg',
        'Iced Royal English Breakfast Tea Latte',
        'Rp. 25000',
        'A select blend of rich, full-leaf black teas from India and Sri Lanka sweetened with liquid cane sugar and combined with milk and ice.',
        [new Review('this tastes okay, but not for me', 'brandon')])
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check out our Drinks!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'COFFEE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              for (var c in coffee)
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DrinkDetailPage(drink: c);
                      }));
                    },
                    leading: Image.asset(c.imgPath),
                    title: Text(c.name),
                    subtitle: Text(c.price),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                'NON-COFFEE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              for (var nc in noncoffee)
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DrinkDetailPage(drink: nc);
                      }));
                    },
                    leading: Image.asset(nc.imgPath),
                    title: Text(nc.name),
                    subtitle: Text(nc.price),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
