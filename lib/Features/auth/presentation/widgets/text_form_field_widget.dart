// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldAuthWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String fieldHint;
  final TextEditingController myController;
  final GlobalKey<FormState> formState = GlobalKey();
  TextFormFieldAuthWidget({
    super.key,
    required this.keyboardType,
    this.validator,
    required this.fieldHint,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(8),
        fillColor: Colors.transparent,
        filled: true,
        hintText: fieldHint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.2),
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
