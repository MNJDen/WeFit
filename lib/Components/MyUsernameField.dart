import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

class MyUsernameField extends StatefulWidget {
  final IconData? prefixIcon;
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  MyUsernameField({
    this.prefixIcon,
    required this.labelText,
    required this.controller,
    this.validator,
  });

  @override
  _MyUsernameFieldState createState() => _MyUsernameFieldState();
}

class _MyUsernameFieldState extends State<MyUsernameField> {
  bool _isFocused = false;

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        fontSize: 12.sp,
        color: whiteColor,
      ),
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _isFocused ? purpleColor : whiteColor,
        ),
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
      validator: widget.validator,
      onFieldSubmitted: (_) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
