class Restaurant {
  final String restaurantName;
  final String discription;
  final String coverPageImageUrl;
  String? discount;
  final String address;
  final int rating;
  final DateTime dateTime;
  final String type;

  Restaurant(
    this.restaurantName,
    this.discription,
    this.coverPageImageUrl,
    this.discount,
    this.address,
    this.rating,
    this.dateTime,
    this.type,
  );
}
