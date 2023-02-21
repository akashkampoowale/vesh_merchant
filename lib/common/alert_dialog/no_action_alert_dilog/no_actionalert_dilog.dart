


import 'package:flutter/material.dart';

getNoActionAlertDilog({dilogHead,dilogContent,dilogButtonText,context}){

  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('$dilogHead'),
          content: Text('$dilogContent'),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('$dilogButtonText'))
          ],
        );
      });



}