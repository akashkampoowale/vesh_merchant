

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesh_merchant/add_product/network/api_service/add_product_api_service.dart';

class AddProductRepository{

  AddProductApiService addProductApiService = AddProductApiService();

  addProduct({
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
    productStatus
  }
)async{
    var prefs = await SharedPreferences.getInstance();
    final uToken = prefs.getString('uToken');
    final uid = prefs.getString('uid');

    return await addProductApiService.addProduct(
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
        uToken: uToken,
        uid: uid
    );


  }

}