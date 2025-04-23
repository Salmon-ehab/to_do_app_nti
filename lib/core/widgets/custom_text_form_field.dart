import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final bool isPassword;
  final String? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      width: 331.w,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscured,
        decoration: InputDecoration(
          filled: true,
            fillColor: AppColor.whiteColor,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        _isObscured ? SvgAssets.lockIcon : SvgAssets.unLockIcon,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : widget.suffixIcon ?? const SizedBox.shrink(),
            prefixIcon: widget.prefixIcon != null
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : null,
            labelText: widget.label,
            labelStyle: Styles.textStyle14,
            border: borderFunction(AppColor.coolGray),
            focusedBorder: borderFunction(Colors.green),
            enabledBorder: borderFunction(AppColor.coolGray),
            focusedErrorBorder: borderFunction(Colors.red),
            errorBorder: borderFunction(Colors.red)),
        validator: widget.validator,
      ),
    );
  }
}

borderFunction(Color color1) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: color1,
      ));
}
