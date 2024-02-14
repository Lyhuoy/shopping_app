import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppScannerKeyCode {
  static const int enter = 66;
  static const int backSpace = 67;
}

class AppScannerRuntime {
  AppScannerRuntime();
  static const String keyDown = "RawKeyDownEvent";
}

class AppScannerInput extends StatefulWidget {
  const AppScannerInput({
    super.key,
    required this.controller,
    required this.onEditComplete,
    this.onTextChange,
    this.onCharector,
    this.onBackSpace,
    this.hintText,
    this.isBusy = false,
  });

  final void Function(String value) onEditComplete;
  final void Function(String value)? onTextChange;
  final void Function(String value)? onCharector;
  final void Function()? onBackSpace;

  final TextEditingController controller;
  final String? hintText;
  final bool isBusy;

  @override
  State<AppScannerInput> createState() => _AppScannerInputState();
}

class _AppScannerInputState extends State<AppScannerInput> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: handleKey,
      child: TextField(
        autofocus: true,
        readOnly: true,
        decoration: InputDecoration(
          hintText: widget.hintText ?? "${"ItemCode".tr}, ${"ItemBarcode".tr}",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
        ),
        controller: widget.controller,
        onSubmitted: (s) {
          if (s.isEmpty) {
            
          }
        },
      ),
    );
  }

  handleKey(RawKeyEvent key) async {
    if (widget.isBusy) return;
    // print("Event runtimeType is ${key.runtimeType}");
    if (key.runtimeType.toString() == AppScannerRuntime.keyDown) {
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      // String _keyCode;
      // _keyCode = data.keyCode.toString(); //keycode of key event (66 is return)

      // print("why does this run twice $_keyCode");
      // print(key.character);

      var oldText = widget.controller.text;
      switch (data.keyCode) {
        case AppScannerKeyCode.enter:
          if (widget.controller.text.isEmpty) break;
          widget.onEditComplete(widget.controller.text);
          break;
        case AppScannerKeyCode.backSpace:
          if (widget.controller.text.isNotEmpty) {
            widget.controller.text = widget.controller.text.substring(
              0,
              widget.controller.text.length - 1,
            );
          }
          if (widget.onBackSpace != null) {
            widget.onBackSpace!();
          }
          break;
        default:
          if (key.character != null) {
            var ch = key.character?.replaceAll("\u0000", "") ?? "";
            if (ch.isNotEmpty) {
              widget.controller.text = "${widget.controller.text}$ch";
              if (widget.onCharector != null) {
                widget.onCharector!(ch);
              }
            }
          }
          break;
      }

      if (widget.onTextChange != null && oldText != widget.controller.text) {
        widget.onTextChange!(widget.controller.text);
      }
      // if (data.keyCode == AppScannerKeyCode.scanKeyUp) {
      //   widget.onScanFinish(widget.controller.text);
      // } else {
      //   if (key.character != null) {
      //     var ch = key.character ?? "";
      //     if (ch.isNotEmpty) {
      //       widget.controller.text =
      //           "${widget.controller.text}${ch.replaceAll("\u0000", "")}";
      //     }
      //   }
      // }
    }
  }
}
