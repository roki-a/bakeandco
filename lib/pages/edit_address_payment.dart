import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/regis_btn.dart';
import 'package:bakeandco/common_widget/txt_input.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class EditAddressPayment extends StatefulWidget {
  const EditAddressPayment({super.key});

  @override
  State<EditAddressPayment> createState() => _EditAddressPaymentState();
}

class _EditAddressPaymentState extends State<EditAddressPayment> {
  String _selectedPayment = "Cash on Delivery";

  TextEditingController province = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController postalCode= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Profile()));
        },
        titleText: "My Profile",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ==== Payment Method ====
                CustomBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.payment, color: ElementColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            "Payment Method",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ElementColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      RadioListTile<String>(
                        title: Text("Cash on Delivery", 
                          style: TextStyle(
                            color: ElementColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: "Cash on Delivery",
                        groupValue: _selectedPayment,
                        activeColor: ElementColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text("G-Cash",
                          style: TextStyle(
                            color: ElementColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: "G-Cash",
                        groupValue: _selectedPayment,
                        activeColor: ElementColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value!;
                          });
                        },
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RegisBtn(
                          title: "Cancel",
                          onClick: () {},
                          type: BtnType.txtPrimary,
                          fontSize: 12,
                          width: 90,  
                          height: 30,  
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        RegisBtn(
                          title: "Save",
                          onClick: () {},
                          type: BtnType.bgPrimary,
                          fontSize: 12,
                          width: 90,  
                          height: 30, 
                        ),
                      ],
                    )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ==== Change Address ====
                CustomBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: ElementColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            "Change Address",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ElementColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TxtInputWithBox(
                        title: "Province*",
                        ctrl: province,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 250),
                        hintText: "Enter name of province",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "City/Municipality*",
                        ctrl: city,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 190),
                        hintText: "Enter name of city/municipality",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Street No./Name*",
                        ctrl: street,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 190),
                        hintText: "Enter street no./name",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Block/House/Building No.*",
                        ctrl: block,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 115),
                        hintText: "Enter block/building no.",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Level/Uni/Room No.*",
                        ctrl: unit,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 150),
                        hintText: "E.g. #827 or Level 3",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Postal Code*",
                        ctrl: postalCode,
                        titleFontSize: 16,
                        titlePadding: EdgeInsetsGeometry.only(right: 210),
                        hintText: "E.g. 2000",
                        boxPadding: EdgeInsetsGeometry.symmetric(horizontal: 17, vertical: 10),  
                      ),

                      const SizedBox(height: 12),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RegisBtn(
                          title: "Cancel",
                          onClick: () {},
                          type: BtnType.txtPrimary,
                          fontSize: 12,
                          width: 90,  
                          height: 30,  
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        RegisBtn(
                          title: "Save",
                          onClick: () {},
                          type: BtnType.bgPrimary,
                          fontSize: 12,
                          width: 90,  
                          height: 30, 
                        ),
                      ],
                    )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: -1),
    );
  }
}