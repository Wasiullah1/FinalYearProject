import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Alabaster",
      price: 40,
      description:
          "Color: 1N00 Alabaster - for very fair skin tones with neutral undertones",
      image: "assets/images/1.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 2,
      title: "Cool Alabaster",
      price: 40,
      description:
          "Color: 1R02 Cool Alabaster - for fair skin tones with rosy undertones",
      image: "assets/images/3.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 3,
      title: "Warm Porcelain",
      price: 40,
      description:
          "Color: 1Y08 Warm Porcelain - for fair to light skin tones with yellow undertones",
      image: "assets/images/5.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 4,
      title: "Cool Ivory",
      price: 40,
      description:
          "Color: 1R12 Cool Ivory - for fair to light skin tones with rosy undertones",
      image: "assets/images/7.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 5,
      title: "Warm Beige",
      price: 40,
      description:
          "Color: 1Y16 Warm Beige - for light skin tones with yellow undertones",
      image: "assets/images/9.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 6,
      title: "Warm Nude",
      price: 40,
      description:
          "Color: 2Y20 Warm Nude - for light to Medium skin tones with yellow undertones",
      image: "assets/images/11.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 7,
      title: "Cool Nude",
      price: 40,
      description:
          "Color: 2R24 Cool Nude - for medium skin tones with rosy undertones",
      image: "assets/images/13.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 8,
      title: "Cool Sand",
      price: 40,
      description:
          "Color: 2R28 Cool Sand - for medium skin tones with rosy undertones",
      image: "assets/images/15.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 9,
      title: "Warm Caramel",
      price: 40,
      description:
          "Color: 2Y32 Warm Caramel - for medium skin tones with yellow undertones",
      image: "assets/images/17.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 10,
      title: "Warm Honey",
      price: 40,
      description:
          "Color: 2Y36 Warm Honey - for medium to Tan skin tones with yellow undertones",
      image: "assets/images/19.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 11,
      title: "Warm Amber",
      price: 40,
      description:
          "Color: 3Y40 Warm Amber - for medium to Tan skin tones with yellow undertones",
      image: "assets/images/21.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 12,
      title: "Cool Amber",
      price: 40,
      description:
          "Color: 3R44 Cool Amber - for medium to Tan skin tones with rosy undertones",
      image: "assets/images/23.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 13,
      title: "Cinnamon",
      price: 40,
      description:
          "Color: 3N48 Cinnamon - for tan skin tones with neutral undertones",
      image: "assets/images/25.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 14,
      title: "Warm Chestnut",
      price: 40,
      description:
          "Color: 3Y52 Warm Chestnut - for tan skin tones with yellow undertones",
      image: "assets/images/27.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 15,
      title: "Warm Hazelnut",
      price: 40,
      description:
          "Color: 3Y56 Warm Hazelnut - for tan to Deep skin tones with yellow undertones",
      image: "assets/images/29.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 16,
      title: "Warm Almond",
      price: 40,
      description:
          "Color: 4Y60 Warm Almond - for tan to Deep skin with yellow undertones",
      image: "assets/images/31.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 17,
      title: "Cool Walnut",
      price: 40,
      description:
          "Color: 4R64 Cool Walnut - for deep skin tones with red undertones",
      image: "assets/images/33.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 18,
      title: "Coffee",
      price: 40,
      description:
          "Color: 4N68 Coffee - for deeper skin tones with neutral undertones",
      image: "assets/images/35.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 19,
      title: "Cool Espresso",
      price: 40,
      description:
          "Color: 4R72 Cool Espresso - for deeper skin tones with red undertones",
      image: "assets/images/36.png",
      color: Color.fromARGB(255, 239, 165, 116)),
  Product(
      id: 20,
      title: "Cool Espresso",
      price: 40,
      description:
          "Color: 4R72 Cool Espresso - for deeper skin tones with red undertones",
      image: "assets/images/37.png",
      color: Color.fromARGB(255, 239, 165, 116)),
];
