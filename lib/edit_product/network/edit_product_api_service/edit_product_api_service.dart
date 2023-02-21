


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesh_merchant/common/responses/success_fail_responses/success_fail_responses.dart';
import 'package:vesh_merchant/common/url/url.dart';

import 'package:path/path.dart';
import 'package:async/src/delegate/stream.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';

class EditProductApiService{
  
  var httpResponse;
  var url = Uri.parse('$serviceApiUrl/update_product/update_product.php');

  editProduct({
    productName,
    productDesc,
    productMrp,
    productPrice,
    productBrand,
    productIdealFor,
    productCategory,
    productType,
    productColor,
    productSleeve,
    productNeck,
    productFabric,
    productLength,
    productStockXs,
    productStockS,
    productStockM,
    productStockL,
    productStockXl,
    productStockXxl,
    productImage1,
    productImage2,
    productImage3,
    productStatus,
    uToken,
    uid,
    productId,
    required GetProductResponse oldProduct
  }) async{


    var request = http.MultipartRequest('POST',url);
    request.fields['uToken'] = uToken.toString();
    request.fields['uid'] = uid.toString();
    request.fields['productName'] = productName;
    request.fields['productDesc'] = productDesc;
    request.fields['productMrp'] = productMrp;
    request.fields['productPrice'] = productPrice;
    request.fields['productBrand'] = productBrand;
    request.fields['productGender'] = productIdealFor;
    request.fields['productCategory'] = productCategory;
    request.fields['productType'] = productType;
    request.fields['productColor'] = productColor;
    request.fields['productSleeve'] = productSleeve;
    request.fields['productNeck'] = productNeck;
    request.fields['productFabric'] = productFabric;
    request.fields['productLength'] = productLength;
    request.fields['productSizeXsStock'] = productStockXs;
    request.fields['productSizeSStock'] = productStockS;
    request.fields['productSizeMStock'] = productStockM;
    request.fields['productSizeLStock'] = productStockL;
    request.fields['productSizeXLStock'] = productStockXl;
    request.fields['productSizeXXLStock'] = productStockXxl;
    request.fields['productStatus'] = productStatus;
    request.fields['productId'] = productId;


    //check if images are changed if yes then which

    if(productImage1 != oldProduct.productImage1){
      print(productImage1);
      request.files.add(http.MultipartFile(
        'productImage1',
        http.ByteStream(DelegatingStream.typed(File(productImage1).openRead())),
        await File(productImage1).length(),
        filename: basename(File(productImage1).path),
      ));
    }else{
      request.fields['productImage1'] = productImage1;
    }


    if(productImage2 != oldProduct.productImage2){
      request.files.add(http.MultipartFile(
        'productImage2',
        http.ByteStream(DelegatingStream.typed(File(productImage2).openRead())),
        await File(productImage2).length(),
        filename: basename(File(productImage2).path),

      ));

    }else{
      request.fields['productImage2'] = productImage2;
    }


    if(productImage3 != oldProduct.productImage3){

      request.files.add(http.MultipartFile(
        'productImage3',
        http.ByteStream(DelegatingStream.typed(File(productImage3).openRead())),
        await File(productImage3).length(),
        filename: basename(File(productImage3).path),
      ));

    }else{
      request.fields['productImage3'] = productImage3;
    }



    await request.send().then((response)async{
      httpResponse = await http.Response.fromStream(response);
      //debugPrint(httpResponse.body);
    });

    // debugPrint(httpResponse.body);
    // return;

    return SuccessFailResponse.fromJson(
        jsonDecode(httpResponse.body)
    );
  
  
}

}