import 'package:flutter/material.dart';

class AppRadioButton {
  static Widget primary<T>({
    required T value,
    required T groupValue,
    Widget? child,
    required void Function(dynamic)? onChanged,
  }) {
    return InkWell(
      onTap: () =>onChanged!=null? onChanged(value):null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            toggleable: true,
          ),
          if(child!=null)...[
            child
          ]
        ],
      ),
    );
  }
}
