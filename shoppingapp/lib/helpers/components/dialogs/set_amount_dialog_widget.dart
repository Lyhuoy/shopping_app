// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cnbmerchantapp/core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// typedef OnConfirmSetAmount = void Function(double amount);

// class SetAmountDialogWidget extends StatelessWidget {
//   SetAmountDialogWidget({
//     super.key,
//     required CurrencyEnum currency,
//     required this.maximumAmount,
//     required this.onConfirm,
//     double? initialAmount,
//   }) {
//     amount = initialAmount ?? .0;
//     amountString = amount.toThousandSeparatorString();
//     this.currency = currency;
//   }

// //#region All Override method
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Ink(
//         padding: const EdgeInsets.all(5),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//           color: Colors.white,
//         ),
//         child: SafeArea(
//           top: false,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ContainerDevider.blankSpaceSm,
//               Text(
//                 "EnterAmount".tr,
//                 style: AppTextStyle.headline6.copyWith(color: Colors.black),
//               ),
//               const SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const SizedBox(width: 60),
//                   Text(
//                     "${CurrencyConverter.currencyToSymble(currency)}${thousandSeparatQR(amountString)}",
//                     style: const TextStyle(
//                         fontSize: 40, color: AppColors.textPrimary),
//                   ),
//                   SizedBox(
//                       width: 60,
//                       child: Visibility(
//                         visible: amount > 0,
//                         child: InkWell(
//                           onTap: _onClearAsync,
//                           child: const Padding(
//                             padding: EdgeInsets.fromLTRB(0, 10, 25, 10),
//                             child: Icon(
//                               Icons.cancel_sharp,
//                               color: AppColors.textSecondary,
//                             ),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//                 child: _reachMaximumAmountWidget(),
//               ),
//               SizedBox(
//                 height: 260,
//                 child: KNumpadWidget(
//                   onPressed: _userTapOnKeyboardAsync,
//                   onBackSpacePressed: _onBackSpaceAsync,
//                 ),
//               ),
//               // const SizedBox(height: 10),
//               AppButtonStyle.primaryButton(
//                 label: "Confirm".tr,
//                 isEnable: isMaximumAmount == false,
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
//                 onPressed: () => {onConfirm(amount), Get.back()},
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   //#endregion

//   //#region All Properties

//   final OnConfirmSetAmount onConfirm;
//   final double maximumAmount;

//   final _amount = 0.0.obs;
//   double get amount => _amount.value;
//   set amount(double value) => _amount.value = value;

//   final _currency = CurrencyEnum.usd.obs;
//   CurrencyEnum get currency => _currency.value;
//   set currency(CurrencyEnum value) => _currency.value = value;

//   final _isMaximumAmountMessage = ''.obs;
//   String get isMaximumAmountMessage => _isMaximumAmountMessage.value;
//   set isMaximumAmountMessage(String value) =>
//       _isMaximumAmountMessage.value = value;

//   final _amountString = '0'.obs;
//   String get amountString => _amountString.value;
//   set amountString(String value) => _amountString.value = value;

//   final _isMaximumAmount = false.obs;
//   bool get isMaximumAmount => _isMaximumAmount.value;
//   set isMaximumAmount(bool value) => _isMaximumAmount.value = value;
//   //#endregion

//   Widget _reachMaximumAmountWidget() {
//     return AnimatedCrossFade(
//         crossFadeState: isMaximumAmount
//             ? CrossFadeState.showSecond
//             : CrossFadeState.showFirst,
//         alignment: Alignment.center,
//         duration: const Duration(milliseconds: 200),
//         firstChild: const SizedBox(),
//         secondChild: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             color: AppColors.darkYellow,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: AutoSizeText(
//             'IsMaxAmountMessage'.tr.replaceAll('0', isMaximumAmountMessage),
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 13,
//                 height: 1.5,
//                 fontFamily: FontConst.familyFont,
//                 fontWeight: FontWeight.w400),
//           ),
//         ));
//   }

//   Future<void> _userTapOnKeyboardAsync(String value) async {
//     if (value == ValueConst.point) {
//       if (amountString.contains(ValueConst.point)) return;
//       amountString += value;
//     } else {
//       // Check max length user input
//       if (amountString.length >= 11) return;

//       if (amountString.length == 1 && amountString == '0') {
//         amountString = value;
//       } else {
//         if (_checkDecimalValue(amountString) == 3) return;
//         if (!isMaximumAmount) {
//           amountString += value;
//         }
//       }
//     }
//     amount = double.tryParse(amountString.toSafeDoubleAsString()) ?? 0;
//     isMaximumAmount = _checkMaximumAmount();
//   }

//   int _checkDecimalValue(String text) {
//     if (text.contains(ValueConst.point)) {
//       int startIndex = text.indexOf('.');
//       var value = text.substring(startIndex);
//       return value.length;
//     }
//     return 0;
//   }

//   bool _checkMaximumAmount() {
//     if (currency == CurrencyEnum.khr && amount > maximumAmount) {
//       isMaximumAmountMessage = '៛${maximumAmount.toThousandSeparatorString()}';
//       return true;
//     }
//     if (currency == CurrencyEnum.usd && amount > maximumAmount) {
//       isMaximumAmountMessage = '\$${maximumAmount.toThousandSeparatorString()}';
//       return true;
//     }
//     return false;
//   }

//   Future<void> _onBackSpaceAsync() async {
//     if (amountString.isNotEmpty) {
//       String result = amountString.substring(0, amountString.length - 1);
//       amountString = result.isEmpty ? '0' : result;
//     }
//     amountString = amountString.isEmpty ? '0' : amountString;
//     amount = double.parse(amountString.toSafeDoubleAsString());

//     isMaximumAmount = _checkMaximumAmount();
//   }

//   Future<void> _onClearAsync() async {
//     if (amountString.isNotEmpty) {}
//     amountString = '0';
//     amount = double.parse(amountString.toSafeDoubleAsString());

//     isMaximumAmount = _checkMaximumAmount();
//   }
// }
