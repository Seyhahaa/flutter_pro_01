import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/Widget_util.dart';
import 'package:flutter_card/detail_screen.dart';
import 'package:flutter_card/food_model.dart';


class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // const FbScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Facebook Screen"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildMainListView();
  }

  Widget _buildMainListView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildFoodSlideShow(),
        _buildFoodGridView(),
        
      ],
    );
  }

  Widget _buildFoodSlideShow() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: foodModelList.length,
        pageSnapping: true,
        itemBuilder: (context, index) {
          return _buildSlideShowItem(foodModelList[index]);
        },
      ),
    );
  }

  Widget _navigateToDetailScreen(FoodModel item, {Widget? child}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => DetailScreen(item)
          ),
        );
      },
      child: child,
    );
  }

 

  Widget _buildSlideShowItem(FoodModel item) {
    return navigate(
      context,
      destination: DetailScreen(item),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: buildRoudedImage(item.img),
      ),
    );
  }

  Widget _buildFoodGridView() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4/6,
      ),
      itemCount: foodModelList.length,
      itemBuilder: (context, index) {
        return _buildGridFoodItem(foodModelList[index]);
      },
    );
  }

  Widget _buildGridFoodItem(FoodModel item) {
    return _navigateToDetailScreen(
      item,
      child: Column(
        children: [
          Expanded(child: 
          Image.network(
            item.img,
            fit: BoxFit.cover,
          ),),
          Positioned( top: 80, left: 120,
            child: Text(item.title, maxLines: 1, style: const TextStyle(
              fontSize: 18, color: Colors.yellow,
              backgroundColor: Colors.green)
            ),
          )
        ],
      ),
    );
  }

  

  Widget _buildFoodListView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4/6,
      ),
      itemCount: foodModelList.length,
      itemBuilder: (context, index) {
        return _buildFoodItem(foodModelList[index]);
      },
    );
  }

  Widget _buildFoodItem(FoodModel food) {
    return Container(
      width: 400,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(10),
      margin:const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              food.img,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          Text(
            food.title,
            style:const TextStyle(fontSize: 22),
          ),
          Text(
            "USD ${food.price}",
            style:const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodStoryListView(
      List<FoodModel> items, double height, double width) {
    return Container(
      height: height,
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildFoodStoryItem(items[index], width);
        },
      ),
    );
  }

  Widget _buildFoodStoryItem(FoodModel item, width) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          item.img,
          fit: BoxFit.cover,
          height: double.maxFinite,
        ),
      ),
    );
  }
}