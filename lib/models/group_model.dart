class Member {
  final String name;
  bool hasPaid;
  int price;

  Member({required this.price, required this.name, this.hasPaid = false});
}
