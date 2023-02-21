

import 'package:json_annotation/json_annotation.dart';
part 'get_product_response.g.dart';

@JsonSerializable()

class GetProductResponse{
  @JsonKey(name: 'productId')
  final String productId;
  @JsonKey(name:'productSupply')
  final String productSupply;
  @JsonKey(name: 'productStatus')
  final String productStatus;
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'product_desc')
  final String productDesc;
  @JsonKey(name: 'product_upload_date')
  final String productUploadDate;
  @JsonKey(name: 'product_gender')
  final String productGender;
  @JsonKey(name: 'product_brand')
  final String productBrand;
  @JsonKey(name: 'product_category')
  final String productCategory;
  @JsonKey(name: 'product_type')
  final String productType;
  @JsonKey(name: 'product_color')
  final String productColor;
  @JsonKey(name: 'product_sleeve')
  final String productSleeve;
  @JsonKey(name: 'product_collar')
  final String productCollar;
  @JsonKey(name: 'product_length')
  final String productLength;
  @JsonKey(name: 'product_fabric')
  final String productFabric;
  @JsonKey(name: 'product_mrp')
  final String productMRP;
  @JsonKey(name: 'product_price')
  final String productPrice;
  @JsonKey(name: 'productImage1')
  final String productImage1;
  @JsonKey(name: 'productImage2')
  final String productImage2;
  @JsonKey(name: 'productImage3')
  final String productImage3;
  @JsonKey(name: 'product_stock_xs')
  final String productStockSizeXs;
  @JsonKey(name: 'product_stock_s')
  final String productStockSizeS;
  @JsonKey(name: 'product_stock_m')
  final String productStockSizeM;
  @JsonKey(name: 'product_stock_l')
  final String productStockSizeL;
  @JsonKey(name: 'product_stock_xl')
  final String productStockSizeXl;
  @JsonKey(name: 'product_stock_xxl')
  final String productStockSizeXxl;

  GetProductResponse({required this.productStockSizeS, required this.productStockSizeM, required this.productStockSizeL, required this.productStockSizeXl, required this.productStockSizeXxl, required this.productStockSizeXs, required this.productCollar, required this.productId, required this.productSupply, required this.productStatus, required this.productName, required this.productDesc, required this.productUploadDate, required this.productGender, required this.productBrand, required this.productCategory, required this.productType, required this.productColor, required this.productSleeve, required this.productLength, required this.productFabric, required this.productMRP, required this.productPrice, required this.productImage1, required this.productImage2, required this.productImage3});

    factory GetProductResponse.fromJson(Map<String,dynamic> json) => _$GetProductResponseFromJson(json);

    Map<String,dynamic>toJson() => _$GetProductResponseToJson(this);


}
