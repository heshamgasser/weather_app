import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hint;

  SearchTextFormField({required this.controller,required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty){
          return 'Field Required';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
          gapPadding: 10,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        hintText: hint,
        suffixIcon: Icon(Icons.search, size: 30,)
      ),
    );
  }
}
