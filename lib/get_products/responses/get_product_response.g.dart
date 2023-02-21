// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductResponse _$GetProductResponseFromJson(Map<String, dynamic> json) =>
    GetProductResponse(
      productStockSizeS: json['product_stock_s'] as String,
      productStockSizeM: json['product_stock_m'] as String,
      productStockSizeL: json['product_stock_l'] as String,
      productStockSizeXl: json['product_stock_xl'] as String,
      productStockSizeXxl: json['product_stock_xxl'] as String,
      productStockSizeXs: json['product_stock_xs'] as String,
      productCollar: json['product_collar'] as String,
      productId: json['productId'] as String,
      productSupply: json['productSupply'] as String,
      productStatus: json['productStatus'] as String,
      productName: json['productName'] as String,
      productDesc: json['product_desc'] as String,
      productUploadDate: json['product_upload_date'] as String,
      productGender: json['product_gender'] as String,
      productBrand: json['product_brand'] as String,
      productCategory: json['product_category'] as String,
      productType: json['product_type'] as String,
      productColor: json['product_color'] as String,
      productSleeve: json['product_sleeve'] as String,
      productLength: json['product_length'] as String,
      productFabric: json['product_fabric'] as String,
      productMRP: json['product_mrp'] as String,
      productPrice: json['product_price'] as String,
      productImage1: json['productImage1'] as String,
      productImage2: json['productImage2'] as String,
      productImage3: json['productImage3'] as String,
    );

Map<String, dynamic> _$GetProductResponseToJson(GetProductResponse instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productSupply': instance.productSupply,
      'productStatus': instance.productStatus,
      'productName': instance.productName,
      'product_desc': instance.productDesc,
      'product_upload_date': instance.productUploadDate,
      'product_gender': instance.productGender,
      'product_brand': instance.productBrand,
      'product_category': instance.productCategory,
      'product_type': instance.productType,
      'product_color': instance.productColor,
      'product_sleeve': instance.productSleeve,
      'product_collar': instance.productCollar,
      'product_length': instance.productLength,
      'product_fabric': instance.productFabric,
      'product_mrp': instance.productMRP,
      'product_price': instance.productPrice,
      'productImage1': instance.productImage1,
      'productImage2': instance.productImage2,
      'productImage3': instance.productImage3,
      'product_stock_xs': instance.productStockSizeXs,
      'product_stock_s': instance.productStockSizeS,
      'product_stock_m': instance.productStockSizeM,
      'product_stock_l': instance.productStockSizeL,
      'product_stock_xl': instance.productStockSizeXl,
      'product_stock_xxl': instance.productStockSizeXxl,
    };
