import 'package:mask/mask.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormat {
  static String phoneNumberString(String value) {
    return MaskTextInputFormatter(
        mask: '### ### ####', filter: {"#": RegExp(r'[0-9]')}).maskText(value);
  }

  static final phoneNumber = Mask.generic(masks: ['## ### ####']);

  static final cid = Mask.generic(masks: ['### ####']);

  static final accountNumber = Mask.generic(masks: ['### ### ### ####']);
  static String maskAccountNumber(String value) {
    return MaskTextInputFormatter(mask: "### ### ### ####").maskText(value);
  }

  final refundAmount =
      MaskTextInputFormatter(mask: '0', filter: {"#": RegExp(r'[0-9]')});

  static final maskNationalID = Mask.generic(masks: ["### ### ###"]);
}

// extension KAccountMask on String {
//   String toCnbAccountMask() {
//     try {
//       // return DateFormat(pattern).format(this);
//       NumberFormat numberFormat = NumberFormat('000 000 000 0000', "en_US");
//       return numberFormat.format(int.tryParse(this) ?? '0');
//     } catch (e) {
//       return "";
//     }
//   }
// }
