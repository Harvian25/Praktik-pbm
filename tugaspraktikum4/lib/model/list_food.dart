class ListFood {
  String nama;
  String desc;
  String image;
  String flav;
  double price;

  ListFood(
      {required this.nama,
      required this.desc,
      required this.image,
      required this.price,
      required this.flav});
}

var foodList = [
  ListFood(
    nama: 'Garcia Cream',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Cherry...',
    price: 2.50,
    image: 'assets/images/food1.png',
    flav: 'Cherry Flovour Sweet Ice Cream',
  ),
  ListFood(
    nama: 'Cinamon Roll',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Strawberry...',
    price: 3.50,
    image: 'assets/images/food2.png',
    flav: 'Cinamon Flovour Sweet Ice Cream',
  ),
  ListFood(
    nama: 'Caramel Flavor Dessert',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Strawberry...',
    price: 4.50,
    image: 'assets/images/food3.png',
    flav: 'Strawberry Flovour Sweet Ice Cream',
  ),
  ListFood(
    nama: 'Framboise Flavor Dessert',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Strawberry...',
    price: 3.50,
    image: 'assets/images/food4.png',
    flav: 'Strawberry Flovour Sweet Ice Cream',
  ),
];
