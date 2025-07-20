import 'package:flutter/material.dart';
import 'package:zaera_app/core/themes/colors.dart';

Widget customInput({
  required String label,
  required String hint,
  bool obscureText = false,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, hintText: hint),
    ),
  );
}
