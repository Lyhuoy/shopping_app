import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shoppingapp/core.dart';

//**
// KTextField
// */
class AppTextField extends StatelessWidget {
  /// KTextField
  ///
  /// **Note [validatorMessage] == null it's will show optional
  const AppTextField({
    Key? key,
    required this.name,
    this.isRequired = true,
    this.label = "",
    this.isShowLabel= true,
    this.initialValue = "",
    this.hint = "",
    this.message,
    this.obscureText = false,
    this.inputFormatters,
    this.validatorMessage,
    this.iconData,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.prefixText,
    this.suffixText,
    this.secondChild,
    this.maxLine,
    this.valueCounter,
    this.autoFocus = false,
    this.autocorrect = true,
    this.enableSuggestions = false,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmit,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.enabled = true,
    this.backgroundColor = AppColors.textFieldBackground,
    this.iconColor = Colors.black,
    this.textColor = AppColors.textPrimary,
    this.formValidator,
  }) : super(key: key);

  final bool isRequired;
  final String name;
  final String initialValue;
  final String label;
  final bool isShowLabel;
  final String hint;
  final String? message;
  final IconData? iconData;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? validatorMessage;
  final int? maxLine;
  final int? valueCounter;
  final bool autoFocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final FocusNode? focusNode;
  final Widget? secondChild;
  final String? prefixText;
  final String? suffixText;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final bool enabled;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final String? Function(String?)? formValidator;

  /// Called when the field value is changed.
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSubmit;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderTextField(
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
          enabled: enabled,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: "•",
          initialValue: controller == null ? initialValue : null,
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: 1,
          maxLines: obscureText ? 1 : maxLine,
          onChanged: onChanged,
          autofocus: autoFocus,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          onSubmitted: onSubmit,
          validator: formValidator,
          inputFormatters: inputFormatters ??
              [
                if (keyboardType == TextInputType.phone) ...[
                  MaskFormat.phoneNumber,
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                ]
              ],
          name: name,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            labelText: isShowLabel ?
                "${label.isEmpty ? name : label} ${isRequired ? '' : "(${'optional'.tr})"}" : null,
            counterText: maxLength != null && valueCounter != null
                ? "$valueCounter/$maxLength"
                : "",
            hintText: hint,
            suffix: suffixText != null ? Text(suffixText!) : null,
            labelStyle: TextStyle(
                color: textColor.withOpacity(0.5), fontWeight: FontWeight.w400),
            hintStyle: TextStyle(color: textColor.withOpacity(0.2)),
            prefixText: prefixText,
            prefixIcon: iconData == null
                ? null
                : Icon(
                    iconData,
                    size: 20,
                    color: iconColor,
                  ),
          ),
        ),
        // Container(
        //     padding:
        //         const EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
        //     margin: const EdgeInsets.only(bottom: 0),
        //     decoration: BoxDecoration(
        //       color: backgroundColor,
        //       borderRadius: const BorderRadius.all(Radius.circular(7)),
        //     ),
        //     child:

        //   ),

        if (message != null) ...[
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
              bottom: 10,
            ),
            child: Text(
              message ?? '',
              textAlign: TextAlign.start,
              style: AppTextStyle.label,
            ),
          ),
        ],
        AnimatedCrossFade(
          firstChild: _validationMessageWidget(
            validatorMessage ?? '',
          ),
          secondChild: const SizedBox(),
          crossFadeState:
              validatorMessage != null && validatorMessage!.isNotEmpty
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          excludeBottomFocus: false,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _validationMessageWidget(String message) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15),
      child: Text(
        message,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.error,
            fontSize: 11,
            decorationColor: Colors.transparent,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
