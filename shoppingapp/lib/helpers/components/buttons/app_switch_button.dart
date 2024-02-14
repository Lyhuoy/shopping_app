import 'package:shoppingapp/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSwitchButton extends Switch {
  const AppSwitchButton({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      // // overrides the default green color of the track
      activeColor: AppColors.primary,
      // // color of the round icon, which moves from right to left
      // thumbColor: AppColors.primary,
      // // when the switch is off
      // trackColor: Colors.black12,
      // boolean variable value
      value: value,
      // changes the state of the switch
      onChanged: onChanged,
    );
  }

  // Switch normal(){
  //   return  Switch(
  //       value: controller.isAllowNotification,
  //       onChanged: (value) {
  //         // if (controller.isLoading) return;
  //         // controller.switchNotification(value);
  //       },
  //       activeColor: AppColors.primary,
  //       inactiveThumbColor: AppColors.primary.withOpacity(0.5),
  //       activeTrackColor: AppColors.kSwitchBg,
  //       inactiveTrackColor: AppColors.kSwitchBg,
  //     );
  // }
}
