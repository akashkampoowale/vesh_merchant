import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/colors/colors.dart';
import 'package:vesh_merchant/common/paths/paths.dart';
import 'package:vesh_merchant/navigation/navigation.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("$imagepath/get_started_background.jpg"),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 45.0, horizontal: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'VÉSH',
                        style: TextStyle(
                          fontSize: 48,
                          color: appbarBackgroundColor,
                        ),
                      ),
                      Text(
                        'Merchant',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                          color: appbarBackgroundColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45.0),
              child: ElevatedButton(
                onPressed: () {
                  navigation(route: 'login', context: context);
                },
                child: Text('GET STARTED',style: TextStyle(fontSize: 20


                ),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appbarBackgroundColor),
                  minimumSize: MaterialStateProperty.all(Size(256, 63)),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
