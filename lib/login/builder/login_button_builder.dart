import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
import 'package:vesh_merchant/login/bloc/login_bloc.dart';
import 'package:vesh_merchant/navigation/navigation.dart';

class LoginButtonBuilder extends StatelessWidget {
  final Function onLoginButtonPressed;

  const LoginButtonBuilder({Key? key, required this.onLoginButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<LoginBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Success) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Success'),
                style: ElevatedButton.styleFrom(
                  primary: successGreen,
                  textStyle: TextStyle(fontSize: 20),
                  minimumSize: Size(120, 45),
                  maximumSize: Size(120, 45),
                ),
              ),
            ],
          );
        }

        if (state is Progress) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Center(
                    child: SizedBox(
                        height: 25, width: 25, child: CircularProgressIndicator())),
                style: ElevatedButton.styleFrom(
                  primary: loginButtonColor,
                  textStyle: TextStyle(fontSize: 20),
                  minimumSize: Size(120, 45),
                  maximumSize: Size(120, 45),
                ),
              ),

            ],
          );
        }

        if (state is Fail) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  onLoginButtonPressed();
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: loginButtonColor,
                  textStyle: TextStyle(fontSize: 20),
                  minimumSize: Size(120, 45),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  state.failCause,
                  style: TextStyle(fontSize: 18, color: warningRed),
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                onLoginButtonPressed();
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: loginButtonColor,
                textStyle: TextStyle(fontSize: 20),
                minimumSize: Size(120, 45),
              ),
            ),
          ],
        );
      },
    );
  }
}
