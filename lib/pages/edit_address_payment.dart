import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/buttons.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/txt_input.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController postalCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPayment = prefs.getString('payment') ?? "Cash on Delivery";
      province.text = prefs.getString('province') ?? "";
      city.text = prefs.getString('city') ?? "";
      street.text = prefs.getString('street') ?? "";
      block.text = prefs.getString('block') ?? "";
      unit.text = prefs.getString('unit') ?? "";
      postalCode.text = prefs.getString('postalCode') ?? "";
    });
    debugPrint("📂 Loaded data: $_selectedPayment | ${province.text}");
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('payment', _selectedPayment);
    await prefs.setString('province', province.text);
    await prefs.setString('city', city.text);
    await prefs.setString('street', street.text);
    await prefs.setString('block', block.text);
    await prefs.setString('unit', unit.text);
    await prefs.setString('postalCode', postalCode.text);

    debugPrint("✅ Saved data: $_selectedPayment | ${province.text}");
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('payment');
    await prefs.remove('province');
    await prefs.remove('city');
    await prefs.remove('street');
    await prefs.remove('block');
    await prefs.remove('unit');
    await prefs.remove('postalCode');
    debugPrint("🗑️ Cleared saved data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        showLeading: true,
        onLeadingTap: () {
          Navigator.pop(context);
        },
        titleText: "My Profile",
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(page: const MyCart()),
          );
        },
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
                        title: Text(
                          "Cash on Delivery",
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
                        title: Text(
                          "G-Cash",
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
                          Buttons(
                            title: "Cancel",
                            onClick: () async {
                              setState(() {
                                _selectedPayment = "Cash on Delivery";
                              });
                              await _clearData();
                            },
                            type: BtnType.txtPrimary,
                            fontSize: 12,
                            width: 90,
                            height: 30,
                          ),
                          const SizedBox(width: 5),
                          Buttons(
                            title: "Save",
                            onClick: () async {
                              await _saveData();
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Payment method saved!"),
                                    backgroundColor: ElementColors.primary,
                                  ),
                                );
                              }
                            },
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
                        titlePadding: const EdgeInsets.only(right: 250),
                        hintText: "Enter name of province",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "City/Municipality*",
                        ctrl: city,
                        titleFontSize: 16,
                        titlePadding: const EdgeInsets.only(right: 190),
                        hintText: "Enter name of city/municipality",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Street No./Name*",
                        ctrl: street,
                        titleFontSize: 16,
                        titlePadding: const EdgeInsets.only(right: 190),
                        hintText: "Enter street no./name",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Block/House/Building No.*",
                        ctrl: block,
                        titleFontSize: 16,
                        titlePadding: const EdgeInsets.only(right: 115),
                        hintText: "Enter block/building no.",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Level/Unit/Room No.*",
                        ctrl: unit,
                        titleFontSize: 16,
                        titlePadding: const EdgeInsets.only(right: 150),
                        hintText: "E.g. #827 or Level 3",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 7),
                      TxtInputWithBox(
                        title: "Postal Code*",
                        ctrl: postalCode,
                        titleFontSize: 16,
                        titlePadding: const EdgeInsets.only(right: 210),
                        hintText: "E.g. 2000",
                        boxPadding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Buttons(
                            title: "Cancel",
                            onClick: () async {
                              province.clear();
                              city.clear();
                              street.clear();
                              block.clear();
                              unit.clear();
                              postalCode.clear();
                              await _clearData();
                            },
                            type: BtnType.txtPrimary,
                            fontSize: 12,
                            width: 90,
                            height: 30,
                          ),
                          const SizedBox(width: 5),
                          Buttons(
                            title: "Save",
                            onClick: () async {
                              await _saveData();
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Address saved!"),
                                    backgroundColor: ElementColors.primary,
                                  ),
                                );
                              }
                            },
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
