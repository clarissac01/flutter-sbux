import 'package:starbucks/models/review.dart';

class Drink {
  String imgPath;
  String name;
  String price;
  String description;
  List<Review> reviews;

  Drink(this.imgPath, this.name, this.price, this.description, this.reviews);
}
