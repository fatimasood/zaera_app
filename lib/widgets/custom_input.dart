import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    required this.controller,
    this.onChanged,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  IconData _getPrefixIcon() {
    if (widget.label.toLowerCase().contains('name')) return Icons.person;
    if (widget.label.toLowerCase().contains('email')) return Icons.email;
    if (widget.label.toLowerCase().contains('password')) return Icons.lock;
    return Icons.text_fields;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 3)),
        ],
      ),
      child: TextFormField(
        style: GoogleFonts.inter(
          color: AppColors.brown,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        cursorColor: AppColors.brown,
        obscureText: _obscure,
        onChanged: widget.onChanged,
        controller: widget.controller,

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: Icon(_getPrefixIcon(), size: 20),
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  )
                  : null,
          labelStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: AppColors.brown,
          ),
          floatingLabelStyle: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.musteredGreen,
          ),
          hintStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.brown.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.brown, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.musteredGreen,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
