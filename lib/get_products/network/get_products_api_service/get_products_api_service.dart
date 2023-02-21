import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesh_merchant/common/url/url.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';

class GetProductsApiService {
  var httpResponse;
  var url = Uri.parse('$serviceApiUrl/get_products/get_products.php');

  Future<List<GetProductResponse>> getProducts(
      {sortState, filterState, mode, uToken, uid}) async {
    var body = {
      'sortState': sortState,
      'filterState': filterState,
      'mode': mode,
      'uToken': uToken,
      'uid': uid
    };
    httpResponse = await http.post(
      url,
      body: body,
    );

    // final isResponseString = httpResponse.body is String;
    // final isResponseMap = jsonDecode(httpResponse.body) is Map;
    //
    // print('isString $isResponseString');
    // print('isMap $isResponseMap');

    //  print(jsonDecode(httpResponse.body)['status']);

    // try {
    //   String responseStatus = jsonDecode(httpResponse.body)['status'];
    //   if (responseStatus == 'fail') {
    //     if (jsonDecode(httpResponse.body)['comment'] == 'no_products_yet') {
    //       return httpResponse.body;
    //     }
    //   }
    // } catch (e) {
    //   final List productList = jsonDecode(httpResponse.body);
    //   final List<GetProductResponse> getProductList = [];
    //
    //   productList.forEach((product) {
    //     if (product is Map<String, dynamic>) {
    //       getProductList.add(GetProductResponse.fromJson(product));
    //     }
    //   });
    //
    //   return getProductList;
    // }


    final List productList = jsonDecode(httpResponse.body);
    final List<GetProductResponse> getProductList = [];

    for (var product in productList) {
      if (product is Map<String, dynamic>) {
        getProductList.add(GetProductResponse.fromJson(product));
      }
    }

    return getProductList;

    //   var jsontest = jsonEncode(jsonDecode(httpResponse.body)[0]);
    //
    //   var simpleJson = GetProductResponse.fromJson(
    //       jsonDecode(jsontest)
    //   );
    //
    //       print(jsonDecode(jsontest)['productId']);
    //
    //
    //
  }
}
