import 'package:flutter/material.dart';
import 'package:flutter_card/food_model.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class DetailScreen extends StatefulWidget {
  //const DetailScreen({super.key});

  FoodModel item;
  DetailScreen(this.item);

  @override
  State<DetailScreen> createState() => _detailScreen();
}

class _detailScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('Detail Screen'),
      ),
      body: ListView(
        children: [
          Image.network(widget.item.img),
          ListTile(
            leading: Icon(Icons.title),
          title: Text(widget.item.title, style: TextStyle(fontSize: 30),),
          ),
          ListTile(
            leading: const Icon(Icons.price_change),
            title: Text('${widget.item.price}', style: TextStyle(fontSize: 30),),
          ),
          Container(
            child: RatingStars(
              value: widget.item.rate,
              starColor: Colors.orange,
              starOffColor: Colors.grey,
              starSize: 30,
              valueLabelTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Order', style: TextStyle(color: Colors.white, fontSize: 20),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          )
        ],
      )
    );
  }
}