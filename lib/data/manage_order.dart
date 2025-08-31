class ManageOrder {
  static List<Map<String, dynamic>> orderItems = [];
  static double deliveryFee = 0.0;
  static double subtotal = 0.0;

  static void saveOrder(List<Map<String, dynamic>> items, double subtotalValue, double fee) {
    orderItems = List.from(items); // copy items
    subtotal = subtotalValue;
    deliveryFee = fee;
  }

  static void updateDeliveryFee(double fee) {
    deliveryFee = fee;
  }

  static double get total => subtotal + deliveryFee;
}