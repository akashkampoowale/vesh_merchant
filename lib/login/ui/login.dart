import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/appbar/logged_out_app_bar/ui/logged_out_app_bar.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/decorations/login_textfield_input_decoration.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/login/bloc/login_bloc.dart';
import 'package:vesh_merchant/login/builder/login_button_builder.dart';
import 'package:vesh_merchant/navigation/navigation.dart';

final _loginKey = GlobalKey<FormState>();


class LoginScreenProvider extends StatelessWidget {
  const LoginScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(Default(), context);
      },
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController(text: 'akash@gmail.com');
  final passwordController = TextEditingController(text: 'akash');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        child: const LoggedOutAppBar(),
        preferredSize: const Size.fromHeight(50),
      ),
      body: Container(
        child:

            Form(
              key: _loginKey,
              child:         Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 75, bottom: 45),
                    child: const Text(
                      'Hi there, please enter your',
                      style: TextStyle(
                        fontSize: 24,
                        color: loginTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                    child: Column(children: [
                      TextFormField(
                        style: loginTextStyle(),
                        controller: usernameController,
                        textAlign: TextAlign.center,
                        decoration: loginTextField(hintText: 'username'),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'please enter email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: loginTextStyle(),
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        decoration: loginTextField(hintText: 'password'),
                        obscureText: true,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'please enter password';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LoginButtonBuilder(
                        onLoginButtonPressed: () {

                          if(_loginKey.currentState!.validate()){

                            final loginBloc = context.read<LoginBloc>();
                            loginBloc.login(
                                username: usernameController.text,
                                password: passwordController.text);
                          }


                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                text: 'New on VÉSH?? '),
                            TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  navigation(route: 'signup',context: context);
                                },
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
                                text: 'Register.'),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              ),


      ),
    );
  }
}
