import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vesh_merchant/common/paths/paths.dart';
import 'package:vesh_merchant/common/url/url.dart';
import 'package:vesh_merchant/get_products/network/get_products_repository/get_products_repository.dart';
import 'package:vesh_merchant/get_products/responses/get_product_response.dart';
import 'package:vesh_merchant/navigation/navigation.dart';



class GetProductList{



 List<GetProduct>  generateProdctList(List<GetProductResponse> productListData){
  List<GetProduct> productWidgetList = [];

  productListData.forEach((productData) {
    productWidgetList.add(GetProduct(productData: productData,));
  });

  return productWidgetList;

 }

}


class GetProduct extends StatelessWidget {
  final GetProductResponse productData ;
  GetProduct({Key? key, required this.productData}) : super(key: key);
  double parentPaddingHorizontal = 16.0;
  double parentPaddingVertical = 10;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [Padding(
          padding: EdgeInsets.symmetric(horizontal: parentPaddingHorizontal,vertical: parentPaddingVertical),
          child: Container(                        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 128,
                          child: ProductImage(imageAddress: productData.productImage1,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text( productData.productName.length > 15 ? '${productData.productName.substring(0, 15)}...' : productData.productName,
                          style: TextStyle(
                            fontSize: 18
                        ),
                        ),
                        Text('Size : ${productData.productSupply}',style: TextStyle(
                          fontSize: 16,
                          //decoration: TextDecoration.underline
                        ),),
                        Text(productData.productUploadDate,style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5),

                        ),
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: productData.productMRP,
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black.withOpacity(0.3),
                                      )
                                  ),
                                  TextSpan(
                                      text: '  ${productData.productPrice}',
                                      style: TextStyle(
                                        color: Colors.black,
                                      )
                                  ),
                                ]
                            )),


                        RichText(text: TextSpan(
                            style: TextStyle(
                                fontSize: 16
                            ),
                            children: [
                              TextSpan(
                                text: 'Status:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                  text: productData.productStatus ,
                                  style: TextStyle(
                                      color: productData.productStatus == 'inactive'? Colors.red : Colors.green,
                                  )
                              ),
                            ]
                        ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

          Positioned(child: InkWell(onTap: (){
              navigation(route: 'edit_product', context: context,productData: productData);
          },
              child: Icon(Iconsax.card_edit)),
            bottom:parentPaddingVertical+5,right: parentPaddingHorizontal+5
            ,),

        ]
    );
  }
}



class ProductImage extends StatelessWidget {
  final String imageAddress;
  const ProductImage({Key? key, required this.imageAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network('$assetsUrl/$imageAddress');
  }
}