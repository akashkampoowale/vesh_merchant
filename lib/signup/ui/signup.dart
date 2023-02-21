import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/appbar/logged_out_app_bar/ui/logged_out_app_bar.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/decorations/login_textfield_input_decoration.dart';
import 'package:vesh_merchant/common/decorations/signup_textfield_inout_decoration.dart';
import 'package:vesh_merchant/common/paths/paths.dart';
import 'package:vesh_merchant/signup/network/repository/signup_repository.dart';

final _signupKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  File profileImage = File("");
  var viewImageWarning = false;
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: LoggedOutAppBar(),
      ),
      body: Form(
        key: _signupKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 25.0),
                  child: Text(
                    'Please fill in the details to create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: loginTextColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        style: loginTextStyle(),
                        textAlign: TextAlign.center,
                        decoration:
                            signupTextFieldInputDecoration(hintText: 'email'),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return 'please enter a valid email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLength: 10,
                        style: loginTextStyle(),
                        textAlign: TextAlign.center,
                        decoration: signupTextFieldInputDecoration(
                            hintText: '10 digit mobile'),
                        controller: mobileController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mobile number';
                          }else if(value.length < 10){
                            return 'Please enter a valid mobile number';
                          }else if(!value.contains(RegExp(r'^[0-9]+$'))){
                            return 'mobile number can only contain numbers';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: loginTextStyle(),
                        textAlign: TextAlign.center,
                        decoration: signupTextFieldInputDecoration(
                            hintText: 'create password'),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: loginTextStyle(),
                        textAlign: TextAlign.center,
                        decoration: signupTextFieldInputDecoration(
                            hintText: 'display name'),
                        controller: displayNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter display name';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: previewProfileImage(profileImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['jpg','jpeg','png'],
                                      );

                                  if (result != null) {
                                    profileImage =
                                        File(result.files.single.path.toString());
                                    setState(() {
                                      viewImageWarning = true;
                                    });
                                  } else {
                                    setState(() {
                                      viewImageWarning = true;
                                    });
                                    // User canceled the picker
                                  }
                                },
                                child: const Icon(
                                  Icons.change_circle_rounded,
                                  size: 30,
                                  color: Colors.cyan,
                                )),
                          ),
                        ],
                      ),
                      getImageWarning(profileImage,viewImageWarning),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(loginButtonColor),
                        ),
                          onPressed: () async{
                            if (_signupKey.currentState!.validate()) {

                            if(!validateProfileImage(profileImage, viewImageWarning)){
                              setState(() {
                                viewImageWarning = true;
                              });
                              return;
                            }

                              var signupRepository = SignupRepository();
                              await signupRepository.signup(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  mobile: mobileController.text,
                                  filepath: profileImage.path,
                                  display_name: displayNameController.text
                              ).then((response){
                                Map<String, dynamic> signupResponseMap = jsonDecode(response);

                                //verification alert dialogue
                                getVerificationStatusDialogue(signupResponseMap,context);
                              });
                            } else {
                              debugPrint('error');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Submit',style: TextStyle(
                              fontSize: 20,
                            ),),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


getVerificationStatusDialogue(signupResponseMap,context){

  if(signupResponseMap['status'] == 'fail'){
    if(signupResponseMap['comment'] == 'verification_awaited'){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Verification in progress'),
          content: const Text("You have already applied for a membership and your account's verification is in progress . You will be notified about your verification status over your provided email when it's done."),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('OK'))
          ],
        );
      });
    }else if(signupResponseMap['comment'] == 'verification_declined'){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Verification Declined'),
          content: const Text("It seems that we were not fully able to verify your provided details due to which your verification is on hold. Please contact our support for more information"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('OK'))
          ],
        );
      });
    }else if(signupResponseMap['comment'] == 'existing_user'){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Existing user'),
          content: const Text("It seems that you already have a verified account with us please log-in with your respective credentials."),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('OK'))
          ],
        );
      });
    }
  }else{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Account Created'),
        content: const Text("Your account is created with VÉSH . Please give us some time while we verify your provided details. You will be notified about your verification status over your provided email when it's done."),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('OK'))
        ],
      );
    });
  }
}

getImageWarning(profileImage,viewImageWarning){
  if(profileImage.path == "" && viewImageWarning == false){
    return const SizedBox.shrink();

  }else if(profileImage.path == "" && viewImageWarning != false){
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'please select an image',
        style: TextStyle(color: warningRed),
      ),
    );
  }else{
    int imageSizeInBytes = profileImage.lengthSync();
    double imageSizeInKb = imageSizeInBytes/(1000);
    if(imageSizeInKb > 50){
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'image must be smaller than 50 kb',
          style: TextStyle(color: warningRed),
        ),
      );
    }else{
      return const SizedBox.shrink();
    }
  }
}

validateProfileImage(profileImage,viewImageWarning){

  if(profileImage.path == "" && viewImageWarning == false){
    return false;

  }else if(profileImage.path == "" && viewImageWarning != false){
    return false;
  }else{
    int imageSizeInBytes = profileImage.lengthSync();
    double imageSizeInKb = imageSizeInBytes/(1000);
    if(imageSizeInKb > 50){
      return false;
    }else{
      return true;
    }
  }

}


previewProfileImage(profileImage){
  if (profileImage.path == "") {
    return const AssetImage('$imagepath/vesh_temp_logo.png');
  } else {
    return FileImage(File(profileImage.path));
  }
}