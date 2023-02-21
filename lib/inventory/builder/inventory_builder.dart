

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';
import 'package:vesh_merchant/get_products/ui/get_products.dart';
import 'package:vesh_merchant/inventory/bloc/inventory_bloc.dart';
import 'package:vesh_merchant/inventory/ui/inventory.dart';
import 'package:vesh_merchant/inventory/ui_states/ui_states.dart';



class InventoryProvider extends StatelessWidget {
  const InventoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return InventoryBloc(Default());
      },
      child: InventoryBuilder(providerFunction: (builderContext){
        builderContext.read<InventoryBloc>().inventoryBloc(sortState: 'default',filterState: 'default', mode: 'inventory');
      },),
    );
  }
}



class InventoryBuilder extends StatefulWidget {

  Function(BuildContext) providerFunction;


  InventoryBuilder({Key? key, required this.providerFunction}) : super(key: key);

  @override
  State<InventoryBuilder> createState() => _InventoryBuilderState();
}

class _InventoryBuilderState extends State<InventoryBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.providerFunction(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<InventoryBloc>(),
      listener: (context, state){},
      builder: (context,state){
          if(state is Success){
            debugPrint('success');
            return Inventory(productListData: state.data,);
          }else if(state is Progress){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is Fail){
            return EmptyInventory(failcause: state.failCause,);
          } else{
            debugPrint('fail');
            return Text('Fail');
          }
      },

    );
  }
}


class EmptyInventory extends StatelessWidget {
  final failcause;
  const EmptyInventory({Key? key, this.failcause}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: AddProductButton(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(failcause),
            ],
          ),
        )
      ),
    );
  }
}
