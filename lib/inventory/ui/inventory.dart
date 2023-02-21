import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/paths/paths.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/get_products/network/get_products_repository/get_products_repository.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';
import 'package:vesh_merchant/get_products/ui/get_products.dart';
import 'package:vesh_merchant/inventory/bloc/inventory_bloc.dart';
import 'package:vesh_merchant/navigation/navigation.dart';




class Inventory extends StatefulWidget {
  final List<GetProductResponse> productListData;
  final inventoryStatus;
  const Inventory({Key? key, required this.productListData, this.inventoryStatus}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  var sortState = 'default';
  var filterState = 'default';
  var mode = 'inventory';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: PreferredSize(
            child: getsortFilterBar(),
            preferredSize: Size(double.infinity,50),
          ),
          floatingActionButton:AddProductButton(),
          body:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //this sizedbox is just added to increase the width of the column
                  SizedBox(width: double.infinity,),

                  Wrap(
                    //children: GetProductList().generateProdctList(widget.productListData),
                    children: widget.productListData.map((productData){ return GetProduct(productData: productData);}).toList(),
                  ),

                ],
              ),
            )
        )
    );
  }
}

class getsortFilterBar extends StatelessWidget {
  const getsortFilterBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: (){

                },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sort',style: TextStyle(fontSize: 20),),
                    Icon(Icons.sort,size: 20,)
                  ],
                ),
              ),
            )
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  //debugPrint('filter');
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Filter',style: TextStyle(fontSize: 20),),
                      Icon(Iconsax.filter4,size: 20,)
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}









class AddProductButton extends StatelessWidget {
  const AddProductButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () async{
      navigation(route: 'add_product',context: context);
    },
      backgroundColor: loginButtonColor,
      child: const Icon(Iconsax.add,size: 30,),
    );
  }
}




