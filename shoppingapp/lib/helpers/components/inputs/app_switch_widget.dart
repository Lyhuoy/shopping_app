import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

class AppSwitchWidget extends StatelessWidget {
  const AppSwitchWidget(
      {Key? key,
      required this.value,
      this.text,
      this.child,
      this.isEnable = true,
      required this.onChanged})
      : assert(child != null || text != null),
        super(key: key);
  final String? text;
  final bool value;
  final bool isEnable;
  final Widget? child;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: InkWell(
          onTap: () {
            if (!isEnable) return;
            return onChanged(value);
          },
          child: child ??
              Text(
                '$text',
                style: TextStyle(
                    color: isEnable
                        ? AppColors.textPrimary
                        : AppColors.textSecondary),
              ),
        )),
        Switch(
          value: value,
          onChanged: (value) {
            if (!isEnable) return;
            return onChanged(value);
          },
          activeColor:
              isEnable ? AppColors.primary : AppColors.primary.withOpacity(0.5),
          activeTrackColor: AppColors.primary.withOpacity(0.2),
        )
      ],
    );
  }
}
