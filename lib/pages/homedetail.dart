import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';



class HomeDetail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
        children: [
          CarouselSlider(
            items: [
              for(var i = 1; i < 5; i++)
                Image(
                  image: AssetImage('assets/promo$i.jpg'),
                ),
            ], 
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
              height: 250,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About Us',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),
                Text('It happens millions of times each week - a customer receives a drink from a Starbucks barista - but each interaction is unique..'),
                SizedBox(height: 20,),
                Text('Our Mission and Value',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),                
                Text('OUR MISSION',
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),
                Text('To inspire and nurture the human spirit - one person, one cup and one neigborhood at a time.'),
                SizedBox(height: 20,),
                Text('OUR VALUES',
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),
                Text('> Creating a culture of warmth and belonging, where everyone is welcome.'),
                Text('> Acting with courage, challenging the status quo and finding new ways to grow our company and each other.'),
                Text('> Being present, connecting with transparency, dignity and respect.'),
                Text('> Delivery our very best in all we do, holding ourselves accountable for results.'),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
    )
      ],
    );
  }

}