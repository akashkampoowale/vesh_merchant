import 'dart:convert';
import 'dart:io';

import 'package:async/src/delegate/stream.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:vesh_merchant/common/responses/success_fail_responses/success_fail_responses.dart';
import 'package:vesh_merchant/common/url/url.dart';

class AddProductApiService {
  Uri url = Uri.parse('$serviceApiUrl/add_product/add_product.php');
  var httpResponse;

  addProduct(
      {productName,
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
      uid}) async {
    var request = http.MultipartRequest('POST', url);
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

    request.files.add(http.MultipartFile(
      'productImage1',
      http.ByteStream(DelegatingStream.typed(File(productImage1).openRead())),
      await File(productImage1).length(),
      filename: basename(File(productImage1).path),
    ));

    request.files.add(http.MultipartFile(
      'productImage2',
      http.ByteStream(DelegatingStream.typed(File(productImage2).openRead())),
      await File(productImage2).length(),
      filename: basename(File(productImage2).path),
    ));

    request.files.add(http.MultipartFile(
      'productImage3',
      http.ByteStream(DelegatingStream.typed(File(productImage3).openRead())),
      await File(productImage3).length(),
      filename: basename(File(productImage3).path),
    ));

    await request.send().then((response) async {
      httpResponse = await http.Response.fromStream(response);
      debugPrint(httpResponse.body);
    });

    return SuccessFailResponse.fromJson(jsonDecode(httpResponse.body));
  }
}
