import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/data/manage_order.dart';
import 'package:bakeandco/pages/edit_address_payment.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';

import 'confirmation.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String _selectedDelivery = "Standard";

  double get _deliveryFee {
  switch (_selectedDelivery) {
    case "Saver":
      return 30.0;
    case "Priority":
      return 70.0;
    case "Standard":
    default:
      return 50.0;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCart()),
          );
        },
        titleText: "Check out",
      ),
      bottomNavigationBar: const Footer(currentIndex: -1),
      body: MainBg(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Summary title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ElementColors.primary,
                      ),
                    ),
                  ],
                ),

                // // Dynamic Cart Items
                // ...ManageOrder.orderItems.map((item) {
                //   return CustomBox(
                //     color: ElementColors.tertiary,
                //     child: Row(
                //       children: [
                //         ClipRRect(
                //           borderRadius: BorderRadius.circular(8),
                
                //           child: Image.asset(
                //             item["image"],
                //             height: 80,
                //             width: 80,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //         const SizedBox(width: 12),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 item["title"],
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                   color: ElementColors.primary,
                //                 ),
                //               ),
                //               const SizedBox(height: 4),
                //               Text(
                //                 item["category"] ?? "",
                //                 style: TextStyle(
                //                   fontSize: 13,
                //                   color: ElementColors.primary,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Container(
                //           width: 32, 
                //           height: 32,
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: ElementColors.tertiary,
                //             border: Border.all(color: ElementColors.primary, width: 1),
                //           ),
                //           child: Text(
                //             (item["quantity"] ?? 1).toString(),
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: ElementColors.primary,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   );
                // }).toList(),
                CustomBox(
                  color: ElementColors.tertiary,
                  child: Column(
                    children: ManageOrder.orderItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item["image"],
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ElementColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item["category"] ?? "",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ElementColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ElementColors.tertiary,
                                border: Border.all(color: ElementColors.primary, width: 1),
                              ),
                              child: Text(
                                (item["quantity"] ?? 1).toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ElementColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 8),

                // Delivery
                CustomBox(
                  child: Center(
                    child: Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ElementColors.primary,
                      ),
                    ),
                  ),
                ),

                // Address
                CustomBox(
                  color: ElementColors.tertiary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: ElementColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            "Address",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ElementColors.primary,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CustomPageRoute(page: EditAddressPayment()));
                        },
                        child: Icon(Icons.chevron_right, color: ElementColors.primary),
                      ),
                    ],
                  ),
                ),


                // Delivery Options
                CustomBox(
                  color: ElementColors.tertiary,
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: Text("Saver",
                            style: TextStyle(
                                color: ElementColors.primary,
                                fontWeight: FontWeight.bold)),
                        value: "Saver",
                        groupValue: _selectedDelivery,
                        activeColor: ElementColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _selectedDelivery = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text("Standard",
                            style: TextStyle(
                                color: ElementColors.primary,
                                fontWeight: FontWeight.bold)),
                        value: "Standard",
                        groupValue: _selectedDelivery,
                        activeColor: ElementColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _selectedDelivery = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text("Priority",
                            style: TextStyle(
                                color: ElementColors.primary,
                                fontWeight: FontWeight.bold)),
                        value: "Priority",
                        groupValue: _selectedDelivery,
                        activeColor: ElementColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _selectedDelivery = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // Payment Details
                CustomBox(
                  color: ElementColors.tertiary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.payment, color: ElementColors.primary),
                              const SizedBox(width: 8),
                              Text(
                                "Payment Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ElementColors.primary,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CustomPageRoute(page: EditAddressPayment()));
                            },
                            child: Icon(Icons.chevron_right, color: ElementColors.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Subtotal + Place Order
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100, // ✅ Force same height
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                        decoration: BoxDecoration(
                          color: ElementColors.tertiary,
                          border: Border.all(color: ElementColors.primary),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // ✅ distribute evenly
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal: ₱${ManageOrder.subtotal.toStringAsFixed(2)}", style: TextStyle(color: ElementColors.primary)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee: ₱${_deliveryFee.toStringAsFixed(2)}", style: TextStyle(color: ElementColors.primary)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total: ₱${(ManageOrder.subtotal + _deliveryFee).toStringAsFixed(2)}",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: ElementColors.primary)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 100, // ✅ Same height as Subtotal box
                        child: ElevatedButton(
                          onPressed: () {
                            ManageOrder.saveOrder(ManageOrder.orderItems, ManageOrder.subtotal, _deliveryFee);
                            Confirmation.show(context);
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: ElementColors.secondary,
                            foregroundColor: ElementColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: ElementColors.primary, width: 1),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black.withOpacity(0.1),
                          ),
                          child: const Text(
                            "Place Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
