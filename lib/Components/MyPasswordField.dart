import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

class MyPasswordField extends StatefulWidget {
  final IconData prefixIcon;
  final String labelText;
  final IconData? suffixIcon;
  final TextEditingController controller;

  MyPasswordField({
    required this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    required this.controller,
  });

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _isFocused = false;
  bool _obscureText = true;

  late FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        fontSize: 12.sp,
        color: whiteColor,
      ),
      focusNode: _focusNode,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _isFocused ? purpleColor : whiteColor,
        ),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(
                  _obscureText ? widget.suffixIcon : Icons.visibility_rounded,
                  color: _isFocused ? purpleColor : whiteColor,
                ),
                onPressed: () {
                  if (widget.suffixIcon != null) {
                    _toggleObscureText();
                  }
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.w, color: purpleColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: whiteColor,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _isFocused ? purpleColor : whiteColor,
        ),
      ),

      // Update the focus state when the user submits the text field
      onFieldSubmitted: (_) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
