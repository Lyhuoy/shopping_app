import 'package:get/get.dart';

class BrandModel {
  int id = 0;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _photoUrl = ''.obs;
  String get photoUrl => _photoUrl.value;
  set photoUrl(String value) => _photoUrl.value = value;

  BrandModel();

  List<BrandModel> sampleData(int count) {
    var result = <BrandModel>[];
    for (int i = 1; i <= count; i++) {
      var item = BrandModel();
      item.id = i;
      item.name = "Brand $i";
      item.photoUrl =
          "https://www.shutterstock.com/image-vector/valencia-spain-april-25-2023-600nw-2293213071.jpg";
      result.add(item);
    }
    return result;
  }
}
