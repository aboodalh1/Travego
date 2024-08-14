import 'package:flutter/material.dart';

Future<dynamic> deleteConfirmDialog(context,
    {required String text,required VoidCallback function}) {
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(text),
      actions: [
        TextButton(onPressed: function, child: const Text("Confirm")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Cancel")),
      ],
    );
  });
}