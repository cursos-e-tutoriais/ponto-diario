import 'package:flutter/material.dart';

Widget textFormField(String label, String hint, bool obscure) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      obscureText: obscure,
      validator: (value) {
        if (value.isEmpty) {
          return 'Campo não pode ser vazio';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(15)),
      ),
      style: TextStyle(color: Colors.white),
    ),
  );
}
