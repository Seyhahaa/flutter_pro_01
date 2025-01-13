class FoodModel {
  int id = 0;
  String title = "no title";
  String img = "no image";
  double price = 0.0;
  double rate = 0.0;
  String shop = "no shop";

  FoodModel({
    this.id = 0,
    this.title = "title",
    this.img = "img",
    this.price = 0.0,
    this.rate = 0.0,
    this.shop = "shop",
  });
}
List<FoodModel> foodModelList = [
  FoodModel(
    id : 0,
    title : "Item 1",
    img : "https://images.pexels.com/photos/18069291/pexels-photo-18069291/free-photo-of-beautiful-woman-in-black-dress-posing-on-lakeshore.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    price : 10.0,
    rate : 4.5,
    shop : "Shop A"
  ),
  FoodModel(
    id : 1,
    title : "Item 2",
    img : "https://media.cnn.com/api/v1/images/stellar/prod/191122151358-4-bai-sach-chrouk-lina-goldberg.jpg?q=w_1110,c_fill",
    price : 15.0,
    rate : 4
  ),
  FoodModel(
    id : 2,
    title : "Item 3",
    img : "https://cambodiatravel.com/images/2020/10/Beef-Lok-Lak-cambodia.jpg",
    price : 8.0,
  ),
  FoodModel(
    id : 3,
    title : "Item 4",
    img : "https://t4.ftcdn.net/jpg/09/19/33/35/360_F_919333503_LmwsNq8v4IisCBpaGIuBMDvGyhqcoNMw.jpg",
    price : 12.0,
  ),
  FoodModel(
    id : 4,
    title : "Item 5",
    img : "https://images.deliveryhero.io/image/fd-kh/LH/mn76-listing.jpg",
    price : 18.0,
  ),
];