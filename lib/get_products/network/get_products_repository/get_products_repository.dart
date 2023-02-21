

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesh_merchant/get_products/network/get_products_api_service/get_products_api_service.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';

class GetProductsRepository{

  GetProductsApiService getProductsApiService = GetProductsApiService();


  Future<List<GetProductResponse>> getProducts(sortState,filterState,mode)async{
    var _prefs = await SharedPreferences.getInstance();


    return getProductsApiService.getProducts(
        sortState: sortState,
      filterState: filterState,
        mode: mode,
      uToken: _prefs.getString('uToken'),
      uid: _prefs.getString('uid'),
    );


  }




}