class NewArrival {
  final String naame;
  final String type;
  final String image;
  final String price;
  final String isWishList;

  NewArrival({
    required this.naame,
    required this.type,
    required this.image,
    required this.price,
    required this.isWishList,
  });

  factory NewArrival.fromJson(Map<String, dynamic> json) {
    return NewArrival(
      naame: json['naame'],
      type: json['type'],
      image: json['image'],
      price: json['price'],
      isWishList: json['isWishList'],
    );
  }
}

// list of product
List<NewArrival> newArrivalList = [
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
  NewArrival(
    naame: 'Nike Air Max 270',
    type: 'Fleece',
    image: 'assets/images/man.png',
    price: '\$ 150',
    isWishList: 'false',
  ),
];
