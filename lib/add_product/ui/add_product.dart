import 'dart:io';

import 'package:vesh_merchant/common/responses/success_fail_responses/success_fail_responses.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vesh_merchant/add_product/network/api_service/add_product_api_service.dart';
import 'package:vesh_merchant/add_product/network/repository/add_product_repository.dart';
import 'package:vesh_merchant/common/alert_dialog/no_action_alert_dilog/no_actionalert_dilog.dart';
import 'package:vesh_merchant/common/appbar/logged_in_app_bar/loggen_in_app_bar.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/decorations/add_product_textfield_input_decoration.dart';
import 'package:vesh_merchant/common/decorations/login_textfield_input_decoration.dart';
import 'package:vesh_merchant/common/decorations/signup_textfield_inout_decoration.dart';
import 'package:vesh_merchant/common/paths/paths.dart';

final _add_product_key = GlobalKey<FormState>();

enum productGenderList { male, female, both, undefined }
enum productStatusList {active, inactive }

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: LoggedInAppBar(),
        preferredSize: Size(double.infinity, 50),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: AddProductForm(),
      ),
    );
  }
}

class AddProductForm extends StatefulWidget {
  AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  productGenderList? _productGender = productGenderList.male;
  productStatusList? _productStatus = productStatusList.active;
  String? _productCategory = "top";
  String? _productType = "none";
  String? _productColor = 'white';
  String? _productSleeve = 'fullSleeve';
  String? _productLength = 'fullLength';
  String? _productNeck = 'collar';
  String? _productFabric = 'cotton';
  String _productImage1 = 'none';
  String _productImage2 = 'none';
  String _productImage3 = 'none';

  bool _productTypeWarning = false;
  bool _productImageWarning = true;
  String _productImageWarningText = "Please select atleast 3 images";

  final productNameController = TextEditingController();

  final productDescController = TextEditingController();

  final productGenderController = TextEditingController();

  final productBrandController = TextEditingController();

  final prductCategoryController = TextEditingController();

  final productTypeController = TextEditingController();

  final productColorController = TextEditingController();

  final productSleeveController = TextEditingController();

  final productCollarController = TextEditingController();

  final productFabricController = TextEditingController();

  final productMRPController = TextEditingController();

  final productPriceController = TextEditingController();

  final productStockXSController = TextEditingController();

  final productStockSController = TextEditingController();

  final productStockMController = TextEditingController();

  final productStockLController = TextEditingController();

  final productStockXLController = TextEditingController();

  final productStockXXLController = TextEditingController();


  void setProductImage1State(productImage1){
    setState(() {
      _productImage1 = productImage1;
    });
  }

  void setProductImage2State(productImage2){
    setState(() {
      _productImage2 = productImage2;
    });
  }

  void setProductImage3State(productImage3){
    setState(() {
      _productImage3 = productImage3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _add_product_key,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //product name
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: productNameController,
                maxLength: 50,
                style: loginTextStyle(),
                textAlign: TextAlign.center,
                decoration:
                    signupTextFieldInputDecoration(hintText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  } else if (value.length < 15) {
                    return 'Product name must be atleast 15 characters long';
                  }
                },
              ),
            ),

            //product description
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: productDescController,
                maxLength: 150,
                maxLines: null,
                style: loginTextStyle(),
                textAlign: TextAlign.center,
                decoration: signupTextFieldInputDecoration(
                    hintText: 'Product description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter product description';
                  } else if (value.length < 20) {
                    return 'Product description must be atleast 20 characters long';
                  }
                },
              ),
            ),

            //product mrp
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: productMRPController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: loginTextStyle(),
                textAlign: TextAlign.center,
                decoration:
                    signupTextFieldInputDecoration(hintText: 'Product MRP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter product MRP';
                  }
                },
              ),
            ),

            //product price
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: loginTextStyle(),
                textAlign: TextAlign.center,
                decoration:
                    signupTextFieldInputDecoration(hintText: 'Product Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter product Price';
                  }
                },
              ),
            ),

            //product brand
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: productBrandController,
                maxLength: 25,
                style: loginTextStyle(),
                textAlign: TextAlign.center,
                decoration:
                signupTextFieldInputDecoration(hintText: 'Product Brand'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter product Brand';
                  }
                },
              ),
            ),

            //product ideal for
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: loginTextfieldBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Product Ideal for',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio<productGenderList>(
                              groupValue: _productGender,
                              value: productGenderList.male,
                              onChanged: (value) {
                                setState(() {
                                  _productGender = value;
                                });
                              },
                            ),
                            Text('Male'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<productGenderList>(
                              groupValue: _productGender,
                              value: productGenderList.female,
                              onChanged: (value) {
                                setState(() {
                                  _productGender = value;
                                });
                              },
                            ),
                            Text('Female')
                          ],
                        ),
                        Row(
                          children: [
                            Radio<productGenderList>(
                              groupValue: _productGender,
                              value: productGenderList.both,
                              onChanged: (value) {
                                setState(() {
                                  _productGender = value;
                                });
                              },
                            ),
                            Text('Both')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //product category
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                color: loginTextfieldBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Product category',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    DropdownButton(
                        items: [
                          DropdownMenuItem<String>(
                            child: Text('Top'),
                            value: 'top',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('Bottom'),
                            value: 'bottom',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('Onepiece'),
                            value: 'onePiece',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('Top-Bottom both'),
                            value: 'topBottomBoth',
                          )
                        ],
                        value: _productCategory,
                        onChanged: (String? value) {
                          _productType = "none";
                          setState(() {
                            _productCategory = value;
                          });
                        }),
                  ],
                ),
              ),
            ),

            //product type
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                color: loginTextfieldBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Product Type',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    DropdownButton(
                        alignment: AlignmentDirectional.centerStart,
                        items: getProductTypeList(_productCategory),
                        value: _productType,
                        onChanged: (String? value) {
                          if(value != 'none'){
                            _productTypeWarning = true;
                          }else{
                            _productTypeWarning = false;
                          }
                          setState(() {
                            _productType = value;
                          });
                        }),
                    getProductTypeWarning(_productTypeWarning,(productTypeWarningState){
                      setState(() {
                        _productTypeWarning = productTypeWarningState;
                      });
                    }),
                  ],
                ),
              ),
            ),

            //product color
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                color: loginTextfieldBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Product Color',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    DropdownButton(
                        alignment: Alignment.center,
                        items: getProductColorList(),
                        value: _productColor,
                        onChanged: (String? value) {
                          setState(() {
                            _productColor = value;
                          });
                        }),
                  ],
                ),
              ),
            ),

            //Product selective list
            getProductSelectiveList(
                _productCategory, _productSleeve, _productLength, _productNeck,
                (productSelectiveValue, productSelectiveKey) {
              setState(() {
                if (productSelectiveKey == 'productSleeve') {
                  _productSleeve = productSelectiveValue;
                } else if (productSelectiveKey == 'productNeck') {
                  _productNeck = productSelectiveValue;
                } else if (productSelectiveKey == 'productLength') {
                  _productLength = productSelectiveValue;
                }
              });
            }),


            //product fabric

            getProductFabricList(_productFabric, (productFabric){
              setState(() {
                  _productFabric = productFabric;
              });
            }),


            //product status
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: loginTextfieldBackground,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Product Status',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio<productStatusList>(
                              fillColor: MaterialStateColor.resolveWith((states) => successGreen),
                              groupValue: _productStatus,
                              value: productStatusList.active,
                              onChanged: (value) {
                                setState(() {
                                  _productStatus = value;
                                });
                              },
                            ),
                            Text('Active', style: TextStyle(color: successGreen),),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<productStatusList>(
                              fillColor: MaterialStateColor.resolveWith((states) => warningRed),
                              groupValue: _productStatus,
                              value: productStatusList.inactive,
                              onChanged: (value) {
                                setState(() {
                                  _productStatus = value;
                                });
                              },
                            ),
                            Text('Inactive',style: TextStyle(color: warningRed),)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            //product stock
            getProductStockInputList(
                XSController: productStockXSController,
                 SController: productStockSController,
                MController: productStockMController,
                LController: productStockLController,
                XLController: productStockXLController,
                XXLController: productStockXXLController

            ),


            getProductImagesList(
                _productImage1,
                _productImage2,
                _productImage3,
                (productImage1){setProductImage1State(productImage1);},
                  (productImage2){setProductImage2State(productImage2);},
                (productImage3){setProductImage3State(productImage3);},
              _productImageWarning,
              _productImageWarningText

            ),





            //submit button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(loginButtonColor),
              ),
              onPressed: () async{
                if (_add_product_key.currentState!.validate()) {
                  if(_productImage1 == "none" || _productImage2 == "none" || _productImage3 == "none"){
                    setState(() {
                      _productImageWarning = true;
                      _productImageWarningText = "Please select atleast 3 images";
                    });
                    return;
                  }else{

                    //validate image 1 size
                    if(validateProductImage(_productImage1)){}else{
                      setState(() {
                        _productImageWarning = true;
                        _productImageWarningText = "Image 1 is larger than 100 kb";
                      });
                      return;
                    }

                    //validate image 2 size
                    if(validateProductImage(_productImage2)){}else{
                      setState(() {
                        _productImageWarning = true;
                        _productImageWarningText = "Image 2 is larger than 100 kb";
                      });
                      return;
                    }
                    //validate image 3 size
                    if(validateProductImage(_productImage3)){}else{
                      setState(() {
                        _productImageWarning = true;
                        _productImageWarningText = "Image 3 is larger than 100 kb";
                      });
                      return;
                    }


                    setState(() {
                      _productImageWarning = false;
                    });


                    var addProductRepository = AddProductRepository();

                   await addProductRepository.addProduct(
                     productName: productNameController.text,
                     productDesc: productDescController.text,
                     productMrp: productMRPController.text,
                     productPrice: productPriceController.text,
                     productBrand: productBrandController.text,
                     productIdealFor: _productGender.toString().split('.').last,
                     productCategory: _productCategory,
                     productType: _productType,
                     productColor: _productColor,
                     productSleeve: _productSleeve,
                     productNeck: _productNeck,
                     productFabric: _productFabric,
                     productLength: _productLength,
                     productStockXs: productStockXSController.text,
                     productStockS: productStockSController.text,
                     productStockM: productStockMController.text,
                     productStockL: productStockLController.text,
                     productStockXl: productStockXLController.text,
                     productStockXxl: productStockXXLController.text,
                     productImage1: _productImage1,
                     productImage2: _productImage2,
                     productImage3: _productImage3,
                     productStatus: _productStatus.toString().split('.').last
                   ).then((response){
                     var comment = response.comment;
                     var errorCode = response.errorCode;
                     if(response.status == 'success'){
                       getNoActionAlertDilog(
                         dilogHead: 'Product added',
                         dilogContent: '$comment \n \n Regards \n Team VÉSH',
                         dilogButtonText: 'OK',
                         context: context,
                       );
                     }else{

                       getNoActionAlertDilog(
                         dilogHead: 'Product Not Added',

                         dilogContent: '$comment \n \n error code: $errorCode \n \n Regards \n Team VÉSH',
                         dilogButtonText: 'OK',
                         context: context
                       );
                     }

                   });



                  }

                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add Product',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


validateProductImage(productImage){
  int imageSizeInBytes = File(productImage).lengthSync();
  double imageSizeInKb = imageSizeInBytes/1000;

  if(imageSizeInKb > 50){
    return false;
  }else{
    return true;
  }

}

getProductImagesList(productImage1,productImage2,productImage3,Function setProductImage1State,Function setProductImage2State,Function setProductImage3State,productImageWarning,productImageWarningText){

  return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        color: loginTextfieldBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Prooduct images',style: TextStyle(fontSize: 18),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: previewSelectedImage(productImage1),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 36,
                            left: 36,
                            child: InkWell(
                                child: Icon(Iconsax.add5),
                              onTap: () async{
                                 FilePickerResult? result = await FilePicker.platform.pickFiles(
                                   type: FileType.custom,
                                   allowedExtensions: ['jpeg','jpg','png'],
                                 );

                                 if(result != null){
                                   setProductImage1State(result.files.single.path.toString());
                                 }else{
                                      //user aborted select
                                 }

                              },
                            ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: previewSelectedImage(productImage2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 36,
                          left: 36,
                          child: InkWell(
                            child: Icon(Iconsax.add5),
                            onTap: () async{
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpeg','jpg','png'],
                              );

                              if(result != null){
                                setProductImage2State(result.files.single.path.toString());
                              }else{
                                //user aborted select
                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: previewSelectedImage(productImage3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 36,
                          left: 36,
                          child: InkWell(
                            child: Icon(Iconsax.add5),
                            onTap: () async{
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpeg','jpg','png'],
                              );

                              if(result != null){
                                setProductImage3State(result.files.single.path.toString());
                              }else{
                                //user aborted select
                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            getImageWarning(productImageWarning,productImageWarningText),

          ],
        ),
      ),
    );
}

getImageWarning(imageWarningState,imageWarningText){
  if(imageWarningState == true){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$imageWarningText',style: TextStyle(color: warningRed),),
    );
  }else{
    return SizedBox.shrink();
  }
}

previewSelectedImage(image){
  if(image == 'none'){
    return AssetImage('$imagepath/product1.png');
  }else{
    return FileImage(File(image));
  }
}

getProductTypeWarning(bool productTypeWarningState, Function setProductTypeWarningState){
  if(productTypeWarningState == false){
    setProductTypeWarningState(false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Please select product type',style: TextStyle(color: warningRed),),
    );
  }else{
    setProductTypeWarningState(true);
    return SizedBox.shrink();
  }
}

getProductStockInputList({XSController,SController,MController,LController,XLController,XXLController}){

  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      width: double.infinity,
      color: loginTextfieldBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Product Stock',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product XS Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                          controller: XSController,

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product S Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,

                          controller: SController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product M Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,

                          controller: MController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product L Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,

                          controller: LController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product XL Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,

                          controller: XLController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    getProductStockListTitleText('Product XXL Stock'),

                    Flexible(
                      child: SizedBox(
                        width: 50,
                        child: TextFormField(
                          maxLength: 2,

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: addProductStockTextStyles,
                          decoration: addProductStockInputDecration,

                          controller: XXLController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "required";
                            }
                          },

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    ),
  );
}


getProductStockListTitleText(text){
  return SizedBox(
    width: 150,
      child: Text(text, style: TextStyle(fontSize: 18),)
  );
}


getProductFabricList(productFabric, Function setProductFabricState){

  //product fabric
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      width: double.infinity,
      color: loginTextfieldBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Product Fabric',
              style: TextStyle(fontSize: 18),
            ),
          ),
          DropdownButton(
              alignment: Alignment.center,
              items: [
                DropdownMenuItem<String>(
                  child: Text('Cotton'),
                  value: 'cotton',
                ),
                DropdownMenuItem<String>(
                  child: Text('Wool'),
                  value: 'wool',
                ),
                DropdownMenuItem<String>(
                  child: Text('Terricot'),
                  value: 'terricot',
                ),
                DropdownMenuItem<String>(
                  child: Text('Nylon'),
                  value: 'nylon',
                ),
                DropdownMenuItem<String>(
                  child: Text('Parachute'),
                  value: 'parachute',
                ),
                DropdownMenuItem<String>(
                  child: Text('Shifon'),
                  value: 'shifon',
                ),
              ],
              value: productFabric,
              onChanged: (value) {
                setProductFabricState(value);
              }),
        ],
      ),
    ),
  );
}


getProductSelectiveList(category, productSleeve, productLength, productNeck,
    Function setSelectiveProductState) {
  if (category == 'top') {
    return Column(
      children: [
        //Product Sleeve
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            color: loginTextfieldBackground,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Product Sleeve',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                DropdownButton(
                    alignment: Alignment.center,
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('Full Sleeve'),
                        value: 'fullSleeve',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Half Sleeve'),
                        value: 'halfSleeve',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Sleeveless'),
                        value: 'sleeveless',
                      ),
                    ],
                    value: productSleeve,
                    onChanged: (value) {
                      setSelectiveProductState(value, 'productSleeve');
                    }),
              ],
            ),
          ),
        ),

        //product Neck
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            color: loginTextfieldBackground,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Product Neck',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                DropdownButton(
                    alignment: Alignment.center,
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('Turtle Neck'),
                        value: 'turtleNeck',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('High Neck'),
                        value: 'hignNeck',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Collar'),
                        value: 'collar',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Round Neck'),
                        value: 'roundNeck',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Standing Collar'),
                        value: 'standingCollar',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Suite Collar'),
                        value: 'suiteCollar',
                      ),
                    ],
                    value: productNeck,
                    onChanged: (value) {
                      setSelectiveProductState(value, 'productNeck');
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }else if(category == 'bottom'){

    //product length
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: double.infinity,
        color: loginTextfieldBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Product Length',
                style: TextStyle(fontSize: 18),
              ),
            ),
            DropdownButton(
                alignment: Alignment.center,
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Full Length'),
                    value: 'fullLength',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Half Length'),
                    value: 'halfLength',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Shorts'),
                    value: 'shorts',
                  ),
                ],
                value: productLength,
                onChanged: (value) {
                  setSelectiveProductState(value, 'productLength');
                }),
          ],
        ),
      ),
    );

  } else {
    return SizedBox.shrink();
  }
}



getProductTypeList(category) {
  if (category == 'top') {
    return [
      DropdownMenuItem<String>(
        child: Text('Shirt'),
        value: 'shirt',
      ),
      DropdownMenuItem<String>(
        child: Text('T-Shirt'),
        value: 'tShirt',
      ),
      DropdownMenuItem<String>(
        child: Text('Jacket'),
        value: 'jacket',
      ),
      DropdownMenuItem<String>(
        child: Text('Blazer'),
        value: 'blazer',
      ),
      DropdownMenuItem<String>(
        child: Text(
          'please select a value',
          style: TextStyle(color: loginTextColor),
        ),
        value: 'none',
      )
    ];
  } else if (category == 'bottom') {
    return [
      DropdownMenuItem<String>(
        child: Text('Formal Pants'),
        value: 'formalPants',
      ),
      DropdownMenuItem<String>(
        child: Text('Jeans'),
        value: 'jeans',
      ),
      DropdownMenuItem<String>(
        child: Text('Cargo'),
        value: 'cargo',
      ),
      DropdownMenuItem<String>(
        child: Text('Shorts'),
        value: 'shorts',
      ),
      DropdownMenuItem<String>(
        child: Text('Lower'),
        value: 'lower',
      ),
      DropdownMenuItem<String>(
        child: Text('Skirt'),
        value: 'skirt',
      ),
      DropdownMenuItem<String>(
        child: Text(
          'please select a value',
          style: TextStyle(color: loginTextColor),
        ),
        value: 'none',
      )
    ];
  } else if (category == 'onePiece') {
    return [
      DropdownMenuItem<String>(
        child: Text('Gown'),
        value: 'gown',
      ),
      DropdownMenuItem<String>(
        child: Text('Frok'),
        value: 'frok',
      ),
      DropdownMenuItem<String>(
        child: Text(
          'please select a value',
          style: TextStyle(color: loginTextColor),
        ),
        value: 'none',
      )
    ];
  } else if (category == 'topBottomBoth') {
    return [
      DropdownMenuItem<String>(
        child: Text('Track Suit'),
        value: 'trackSuite',
      ),
      DropdownMenuItem<String>(
        child: Text('Sherwani'),
        value: 'sherwani',
      ),
      DropdownMenuItem<String>(
        child: Text(
          'please select a value',
          style: TextStyle(color: loginTextColor),
        ),
        value: 'none',
      )
    ];
  }
}

getProductColorList() {
  return [
    DropdownMenuItem<String>(
      child: Text('White'),
      value: 'white',
    ),
    DropdownMenuItem<String>(
      child: Text('Black'),
      value: 'black',
    ),
    DropdownMenuItem<String>(
      child: Text('Yellow'),
      value: 'yellow',
    ),
    DropdownMenuItem<String>(
      child: Text('Red'),
      value: 'red',
    ),
    DropdownMenuItem<String>(
      child: Text('Blue'),
      value: 'blue',
    ),
    DropdownMenuItem<String>(
      child: Text('Pink'),
      value: 'pink',
    ),
    DropdownMenuItem<String>(
      child: Text('Beige'),
      value: 'beige',
    ),
    DropdownMenuItem<String>(
      child: Text('Brown'),
      value: 'brown',
    ),
    DropdownMenuItem<String>(
      child: Text('Cream'),
      value: 'cream',
    ),
    DropdownMenuItem<String>(
      child: Text('Dark-blue'),
      value: 'darkBlue',
    ),
    DropdownMenuItem<String>(
      child: Text('Dark-green'),
      value: 'darkGreen',
    ),
    DropdownMenuItem<String>(
      child: Text('Gold'),
      value: 'gold',
    ),
    DropdownMenuItem<String>(
      child: Text('Green'),
      value: 'green',
    ),
    DropdownMenuItem<String>(
      child: Text('Khakee'),
      value: 'khakee',
    ),
    DropdownMenuItem<String>(
      child: Text('Light-blue'),
      value: 'lightBlue',
    ),
    DropdownMenuItem<String>(
      child: Text('Light-green'),
      value: 'lightGreen',
    ),
    DropdownMenuItem<String>(
      child: Text('Maroon'),
      value: 'maroon',
    ),
    DropdownMenuItem<String>(
      child: Text('Multicolor'),
      value: 'multicolor',
    ),
    DropdownMenuItem<String>(
      child: Text('Navy-blue'),
      value: 'navyBlue',
    ),
    DropdownMenuItem<String>(
      child: Text('Orange'),
      value: 'orange',
    ),
    DropdownMenuItem<String>(
      child: Text('Purple'),
      value: 'purple',
    ),
    DropdownMenuItem<String>(
      child: Text('Silver'),
      value: 'silver',
    ),
  ];
}
