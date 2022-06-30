import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget extends StatelessWidget {
  TextEditingController controller;
  String placeholder;
  bool isObscure;
  String? suffixSvgImage;
  // String? suffixSvgImage2;
  VoidCallback? suffixClick;
  VoidCallback? suffixClick2;
  bool isError;
  String errorMessage;
  TextInputType keyboardType;
  String? prefixSvgImage;
  int minLines;
  int maxLines;
  Color fillColor;
  bool isReadonly;
  int maxLength;
  List<TextInputFormatter> formatters;
  TextfieldWidget({Key? key,

    required this.controller,
    required this.placeholder,
    this.isObscure = false,
    this.suffixSvgImage,
    // this.suffixSvgImage2,
    this.suffixClick,
    this.isError = false,
    this.errorMessage = '',
    this.keyboardType = TextInputType.text,
    this.prefixSvgImage,
    this.minLines = 1,
    this.maxLines = 1,
    this.fillColor = neutral3Color,
    this.isReadonly = false,
    this.maxLength = 1000,
    this.formatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: formatters,
          maxLength: maxLength,
          readOnly: isReadonly,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: isObscure,
          minLines: minLines,
          maxLines: maxLines,
          style: fontStyle(neutral6Color, FontWeight.w400, 16),
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefixSvgImage != null
                ? Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: Image.asset(
                prefixSvgImage!,
                color: neutral4Color,
              ),
            )
                : const SizedBox(),
            prefixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                suffixSvgImage != null || isError
                    ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: isError
                      ? Image.asset(
                    'assets/images/error.svg',
                  )
                      : GestureDetector(
                    onTap: () {
                      suffixClick!();
                    },
                    child: Image.asset(
                      suffixSvgImage!,
                      color: neutral4Color,
                    ),
                  ),
                )
                    : const SizedBox(),
              ],
            ),
            fillColor: fillColor,
            filled: true,
            hintText: placeholder,
            hintStyle: inputHintStyle,
            contentPadding:
            const EdgeInsets.only(top: 18, bottom: 18, left: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(3.0),
              ),
              borderSide:
              BorderSide(color: isError ? semantic1Color : Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isError ? semantic1Color : primaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        isError
            ? const SizedBox(
          height: 5,
        )
            : const SizedBox(),
        isError
            ? Text(
          errorMessage,
          style: fontStyle(semantic1Color, FontWeight.w400, 14),
        )
            : const SizedBox(),
      ],
    );
  }
}