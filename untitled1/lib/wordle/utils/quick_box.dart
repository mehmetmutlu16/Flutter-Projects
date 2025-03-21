import 'package:flutter/material.dart';

runQuickbox({required BuildContext context, required String message}){
  WidgetsBinding.instance.addPostFrameCallback((timestamp){
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 1000), (){
          Navigator.maybePop(context);
        });
        return AlertDialog(
          title: Text(message, textAlign: TextAlign.center,),
        );
      },
    );
  });
}