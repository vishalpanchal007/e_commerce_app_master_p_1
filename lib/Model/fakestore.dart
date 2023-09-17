
class FakeStore {
  final String title;
  final String image;
  final String category;
  final String description;
  final num price;
  final num rate;
  final num stock;
  num count;
  num total;
  bool addorNot;

  FakeStore({
    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.rate,
    required this.stock,
    required this.count,
    required this.total,
    required this.addorNot,
  });

  factory FakeStore.fromMap(Map<String, dynamic> data) {
    return FakeStore(
      title: data["title"],
      image: data["image"],
      category: data["category"],
      description: data["description"],
      price: data["price"],
      rate: data["rating"]["rate"],
      stock: data["rating"]["count"],
      count: 1,
      total: data["price".padLeft(1)],
      addorNot: true,
    );
  }
}
