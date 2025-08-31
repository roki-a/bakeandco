import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/data/manage_order.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {

    ManageOrder.orderItems.isEmpty
      ? Text("No orders yet.")
      : ListView.builder(
          itemCount: ManageOrder.orderItems.length,
          itemBuilder: (context, index) {
            final item = ManageOrder.orderItems[index];
            return ListTile(
              leading: Image.asset(item["image"]),
              title: Text(item["title"]),
              subtitle: Text("₱${item["price"]} x ${item["quantity"]}"),
            );
          },
        );

    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context, CustomPageRoute(page: Profile()));
        },
        titleText: "My Order",
      ),
    
    bottomNavigationBar: const Footer(currentIndex: -1), 

      body: Stack(   
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Order Placed
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ElementColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Card(
                  color: ElementColors.tertiary,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: ElementColors.primary, width: 2),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Kitchen
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/bake.png",
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Kitchen is\npreparing",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ElementColors.primary),
                            ),
                          ],
                        ),
                        // Driver
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/delivery.png",
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Driver is\non the way",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ElementColors.primary),
                            ),
                          ],
                        ),
                        // Arrived
                        Column(
                          children: [
                            Image.asset(
                              "assets/icons/check.png",
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Order\nArrived",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ElementColors.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ETA Box
                Card(
                  color: ElementColors.tertiary,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: ElementColors.primary, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Estimated Time of Arrival:",
                            style: TextStyle(
                              fontSize: 16,
                              color: ElementColors.primary,
                            )),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "16:30 - 16:50",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: ElementColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Driver Profile Box
                Card(
                  color: ElementColors.tertiary,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: ElementColors.primary, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: avatar + name + rating
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: ElementColors.primary,
                              child: Icon(Icons.person,
                                  color: ElementColors.tertiary),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Driver Profile",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: ElementColors.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ElementColors.primary,
                                      ),
                                    ),
                                    Icon(Icons.star,
                                        size: 16, color: ElementColors.starColor),
                                  ],
                                ),
                                Text(
                                  "09xx-xxx-xxxx",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ElementColors.placeholder,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        Divider(color: ElementColors.primary),

                        // Bottom row: phone + chat icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/icons/phone_call.png",
                                height: 28),
                            Container(
                              width: 1,
                              height: 30,
                              color: ElementColors.primary,
                            ),
                            Image.asset("assets/icons/message.png",
                                height: 28),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Card(
                  color: ElementColors.tertiary,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: ElementColors.primary, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Loop through items in cart
                        for (var item in ManageOrder.orderItems) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ElementColors.primary)),
                            Text("₱${item['price'].toStringAsFixed(2)} x ${item['quantity']}",
                                style: TextStyle(color: ElementColors.primary)),
                            ]
                          ),
                          const SizedBox(height: 6),
                        ],

                        // Delivery fee row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee",
                                style: TextStyle(color: ElementColors.primary)),
                            Text("₱${ManageOrder.deliveryFee.toStringAsFixed(2)}",
                                style: TextStyle(color: ElementColors.primary)),
                          ],
                        ),

                        Divider(color: ElementColors.primary),

                        // Total
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total: ₱${ManageOrder.total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ElementColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ]
      ),
    );
  }
}
