import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/my_colors.dart';
import '../theming/my_text_styles.dart';

class MyTextForm extends StatefulWidget {
  final String title;
  final String? validatorMessage;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hint;

  const MyTextForm({
    super.key,
    this.validatorMessage,
    required this.controller,
    this.focusNode,
    required this.title,
    this.validator,
    this.maxLines,
    this.inputType,
    this.inputFormatters,
    this.hint,
  });

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: MyTextStyles.font13greyRegular),
        SizedBox(height: 5.h),
        IntrinsicHeight(
          child: Stack(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {

                  });
                },
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.inputType,
                maxLines: widget.maxLines,
                style: Theme.of(context).textTheme.titleMedium,
                focusNode: widget.focusNode,
                controller: widget.controller,
                validator:
                    widget.validator ??
                    (value) {
                      if (value?.isEmpty == true) {
                        return widget.validatorMessage;
                      }
                      return null;
                    },
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: MyTextStyles.font14PrimarySemiBold,
                  contentPadding: const EdgeInsetsDirectional.only(
                    start: 16.0,
                    end: 4.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyColors.primaryColor),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
              ),
              if(widget.controller.text.isNotEmpty)Padding(
                padding: EdgeInsetsDirectional.only(end: 7.w),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      widget.controller.clear();
                      setState(() {

                      });
                    },
                    child: const Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
