import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vesh_merchant/common/appbar/logged_in_app_bar/loggen_in_app_bar.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/home/ui/tabs/profile.dart';
import 'package:vesh_merchant/home/ui/tabs/notifications.dart';
import 'package:vesh_merchant/home/ui/tabs/order_history.dart';
import 'package:vesh_merchant/home/ui/tabs/orders.dart';
import 'package:vesh_merchant/inventory/builder/inventory_builder.dart';
import 'package:vesh_merchant/inventory/ui/inventory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List tabs = [
Orders(),
    Profile(),
    InventoryProvider(),
    OrderHistory(),
    Notifications(),
  ];

 int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          child: const LoggedInAppBar(),
          preferredSize: const Size.fromHeight(50),
        ),
        body: tabs[selectedTab],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 8),
        color: appbarBackgroundColor,
        child: GNav(tabs: [
            GButton(icon: Iconsax.paperclip, text: 'Orders',),
            GButton(icon: Iconsax.user, text: 'Profile',),
            GButton(icon: Icons.inventory, text: 'Inventory',),
            GButton(icon: Icons.history, text: 'Order History',),
            GButton(icon: Icons.notifications, text: 'Notifications',),
          ],
          gap: 0,
          padding: EdgeInsets.all(8),
          activeColor: loginButtonColor,
          color: Colors.white,
          tabBackgroundColor: Colors.white,
          onTabChange: (index){
          setState(() {
            selectedTab = index;
          });
          },
        ),
      ),
      ),
    );
  }
}
