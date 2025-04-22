import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/my_colors.dart';
import '../theming/my_text_styles.dart';

class MyTextForm extends StatelessWidget {
  final String title;
  final String? validatorMessage;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? hint;

  const MyTextForm({
    super.key,
    this.validatorMessage,
    this.controller,
    this.focusNode,
    required this.title,
    this.validator,
    this.maxLines, this.inputType, this.inputFormatters, this.onChanged, this.hint,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: MyTextStyles.font13greyRegular,),
        SizedBox(height: 5.h),
        TextFormField(
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          keyboardType: inputType,
          maxLines: maxLines,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
          focusNode: focusNode,
          controller: controller,
          validator:
          validator ??
                  (value) {
                if (value?.isEmpty == true) {
                  return validatorMessage;
                }
                return null;
              },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: MyTextStyles.font14PrimarySemiBold,
            contentPadding: EdgeInsetsDirectional.only(start: 16.0, end: 4.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.primaryColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10.h),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
            ),
          ),
        ),
      ],
    );
  }
}
