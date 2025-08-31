import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeDashboard()));
        },
        titleText: "My Order",
      ),
    
    bottomNavigationBar: const Footer(currentIndex: -1), 

      body: MainBg(   
        child: Padding(
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
                                  const Icon(Icons.star,
                                      size: 16, color: Colors.amber),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Place number details",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      const Divider(),

                      // Bottom row: phone + chat icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/phone_call.png",
                              height: 28),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
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

              // Products & Price Box
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cinnamon Roll",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ElementColors.primary)),
                          Text("₱000.00",
                              style: TextStyle(color: ElementColors.primary)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Fee",
                              style: TextStyle(color: ElementColors.primary)),
                          Text("₱000.00",
                              style: TextStyle(color: ElementColors.primary)),
                        ],
                      ),
                      const Divider(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Total: ₱000.00",
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
      ),
    );
  }
}
