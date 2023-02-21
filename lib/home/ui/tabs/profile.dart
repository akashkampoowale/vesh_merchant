
import 'package:flutter/material.dart';
import 'package:vesh_merchant/common/paths/paths.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Merchant Profile',style: TextStyle(
                fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: Container(
                clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('$imagepath/product1.png')
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Merchant Name', style: TextStyle(fontSize: 20),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Text('This is the merchants description which will be visible when user visits merchant profile',
                style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.5),),
                textAlign: TextAlign.center,

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('+917799854215', style: TextStyle(fontSize: 20),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Text('shop no 194 , City Center Vidisha M.P 464001',
                style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.5),),
                textAlign: TextAlign.center,

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('GBX214568', style: TextStyle(fontSize: 20),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Edit Profile', style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Logout', style: TextStyle(fontSize: 20),),
            ),

          ],
        ),
      ),
    );
  }
}
