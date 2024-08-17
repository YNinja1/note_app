import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

void customShowSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 900),
      backgroundColor: kPrimaryColor,
      content: Text(message,
        style: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
