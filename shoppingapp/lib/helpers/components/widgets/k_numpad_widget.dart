
import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

typedef KNumpadTapCallback = void Function(String text);

// migrate with calculator_widget
class KNumpadWidget extends StatelessWidget {
  final KNumpadTapCallback onPressed;
  final VoidCallback? onBackSpacePressed;

  /// *** position on of [Clear button] and [Point button] is same place
  /// so if consider to use [onClearPress] then [Point button] not show
  final VoidCallback? onClearPress;
  final VoidCallback? onClearLongPress;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final bool isDecimal;

  const KNumpadWidget({
    Key? key,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.onBackSpacePressed,
    this.onClearPress,
    this.onClearLongPress,
    this.isDecimal = true,
  }) : super(key: key);

  TextStyle _textFontStyle() {
    return TextStyle(
      color: textColor ?? Colors.black,
      fontSize: fontSize ?? 22,
      fontWeight: fontWeight ?? FontWeight.w300,
    );
  }

  ButtonStyle _numpadBtnStyle() {
    return ButtonStyle(
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor:
          MaterialStateProperty.all(AppColors.primary.withOpacity(0.02)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("1");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("1",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("2");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("2",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("3");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("3",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("4");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("4",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("5");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("5",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("6");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("6",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("7");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("7",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("8");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("8",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("9");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("9",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: onClearPress != null
                    ? ElevatedButton(
                        onPressed: onClearPress,
                        style: _numpadBtnStyle(),
                        child: Text(
                          "C",
                          textAlign: TextAlign.center,
                          style: _textFontStyle(),
                        ),
                      )
                    : isDecimal
                        ? ElevatedButton(
                            onPressed: onClearPress ??
                                () {
                                  onPressed('.');
                                },
                            style: _numpadBtnStyle(),
                            child: Text(
                              onClearPress == null ? '.' : "C",
                              textAlign: TextAlign.center,
                              style: _textFontStyle(),
                            ),
                          )
                        : const SizedBox()),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onPressed("0");
                    },
                    style: _numpadBtnStyle(),
                    child: Text("0",
                        textAlign: TextAlign.center, style: _textFontStyle()))),
            Expanded(
                child: ElevatedButton(
                    onPressed: onBackSpacePressed ?? () {},
                    onLongPress: onClearLongPress,
                    style: _numpadBtnStyle(),
                    child: Icon(
                      Icons.close,
                      size: fontSize ?? 30,
                      color: textColor ?? Colors.black,
                    )))
          ],
        ))
      ],
    );
  }
}
