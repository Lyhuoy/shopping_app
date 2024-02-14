
import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';

class LanguageModel {
  final _index = 0.obs;
  get index => _index.value;
  set index(value) => _index.value = value;

  final _imagePng = ImagePngUrl.flagEnglish.obs;
  String get imagePng => _imagePng.value;
  set imagePng(String value) => _imagePng.value = value;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _isSelected = false.obs;
  get isSelected => _isSelected.value;
  set isSelected(value) => _isSelected.value = value;

  static LanguageModel create(int index, String name, bool selected,
      {String imageSvg = ImagePngUrl.flagKhmer}) {
    var result = LanguageModel();
    result.index = index;
    result.name = name;
    result.isSelected = selected;
    result.imagePng = imageSvg;
    return result;
  }
}
