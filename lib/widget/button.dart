import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  String? buttonName;
  Function()? onPressed;
  PurpleButton(this.buttonName, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 17,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(buttonName.toString()),
      ),
    );
  }
}
