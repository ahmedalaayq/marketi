import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    required this.validator,
  });
  final String hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String?> validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.medium16,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: widget.validator,
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintStyle: AppTextStyle.regular16,
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
          icon: Icon(
            widget.suffixIcon != null
                ? _isObscured
                    ? Icons.visibility
                    : Icons.visibility_off
                : null,
          ),
        ),
      ),
    );
  }
}
