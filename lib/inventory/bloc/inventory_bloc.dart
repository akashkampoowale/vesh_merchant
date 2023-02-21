import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/get_products/network/get_products_repository/get_products_repository.dart';

class InventoryBloc extends Cubit {
  InventoryBloc(super.initialState);

  var getProductsRepository = GetProductsRepository();

  inventoryBloc({sortState, filterState, mode}) async {
    emit(Progress());

    getProductsRepository
        .getProducts(sortState, filterState, mode)
        .then((response) {
      if (response.isNotEmpty == true) {
        debugPrint('products availavble');
        emit(Success(data: response));
      } else {
        debugPrint('products not available');
        emit(Fail(failCause: 'No Products Yet'));
      }
    }).catchError((error) {
      emit(Fail(failCause: 'failCause'));
    });
  }
}
