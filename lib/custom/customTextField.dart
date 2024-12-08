import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key ,required this.hintText ,
    this.cotroller,
    this.prefixIcon,
    this.isPassword=false,
    this.suffixIcon,
    this.keyboardType,

  });
final TextEditingController? cotroller;
final String hintText;
final TextInputType? keyboardType;
final IconData? prefixIcon;
final bool isPassword;
final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cotroller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration : InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null? Icon(prefixIcon) : null,
        suffixIcon:  suffixIcon!= null? Icon(suffixIcon):null,
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(11),
        ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(
    color: Colors.blueGrey,
    width: 1,
    )
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(
    color: Colors.blueGrey,
    width: 1,
    )
    ),
    disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(
    color: Colors.blueGrey.shade500,
    width: 1,
    )


      ),

    ));
  }
}

