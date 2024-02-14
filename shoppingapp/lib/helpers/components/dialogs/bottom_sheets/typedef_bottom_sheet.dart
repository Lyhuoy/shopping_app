
import 'package:flutter/widgets.dart';

typedef OnSelectedCBottomSheet<T> = void Function(int index, T value);
typedef CBottomSheetChild<T> = Widget Function(int index, T value);