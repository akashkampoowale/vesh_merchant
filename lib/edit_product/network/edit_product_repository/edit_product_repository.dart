

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesh_merchant/edit_product/network/edit_product_api_service/edit_product_api_service.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';

class EditProductRepository{


  final editProductApiService = EditProductApiService();


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
    final _prefs = await SharedPreferences.getInstance();
    final uid = _prefs.getString('uid');
    final uToken = _prefs.getString('uToken');

    return editProductApiService.editProduct(
        productName: productName,
      productDesc: productDesc,
      productMrp: productMrp,
      productPrice: productPrice,
      productBrand: productBrand,
      productIdealFor: productIdealFor,
      productCategory: productCategory,
      productType: productType,
      productColor: productColor,
      productSleeve: productSleeve,
      productNeck: productNeck,
      productFabric: productFabric,
      productLength: productLength,
      productStockXs: productStockXs,
      productStockS: productStockS,
      productStockM: productStockM,
      productStockL: productStockL,
      productStockXl: productStockXl,
      productStockXxl: productStockXxl,
      productImage1: productImage1,
      productImage2: productImage2,
      productImage3: productImage3,
      productStatus: productStatus,
      oldProduct: oldProduct,
      uid: uid,
      uToken: uToken,
      productId: productId,
    );



  }


}