class Order {
    final int approximateFulfillmentDelay;

    Order({
      required this.approximateFulfillmentDelay
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(approximateFulfillmentDelay: json['approximateFulfillmentDelay']);
}