


import 'package:vesh_merchant/add_product/ui/add_product.dart';

extension StringExtensions on String{

  productGenderList toProductGender() {
    return this._toEnumValue(
        'productGenderList',
        productGenderList.values,
        productGenderList.undefined,
    );
  }

  productStatusList toProductStatus(){
    return this._toEnumValue(
        'productStatusList',
        productStatusList.values,
        productStatusList.active
    );
  }

  T _toEnumValue<T>(
      String enumClassName, List<T> enumValues, T undefinedEnumValue) {
    return enumValues.firstWhere(
          (enumValue) {
        return enumValue.toString().toLowerCase() ==
            '$enumClassName.$this'.toLowerCase();
      },
      orElse: () => undefinedEnumValue,
    );
  }



}