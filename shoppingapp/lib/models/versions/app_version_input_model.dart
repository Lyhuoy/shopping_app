
import 'package:get/get.dart';

class AppVersionOutputModel {
  final _isUpdated = false.obs;
  bool get isUpdated => _isUpdated.value;
  set isUpdated(bool value) => _isUpdated.value = value;

  final _isRequiredUpdate = false.obs;
  bool get isRequiredUpdate => _isRequiredUpdate.value;
  set isRequiredUpdate(bool value) => _isRequiredUpdate.value = value;

  final _localVersion = ''.obs;
  String get localVersion => _localVersion.value;
  set localVersion(String value) => _localVersion.value = value;

  final _storeVersion = ''.obs;
  String get storeVersion => _storeVersion.value;
  set storeVersion(String value) => _storeVersion.value = value;

  final _appStoreLink = ''.obs;
  String get appStoreLink => _appStoreLink.value;
  set appStoreLink(String value) => _appStoreLink.value = value;

  final _releaseNotes = ''.obs;
  String get releaseNotes => _releaseNotes.value;
  set releaseNotes(String value) => _releaseNotes.value = value;

  AppVersionOutputModel({
    bool isUpdated = false,
    bool isRequiredUpdate = false,
    String localVersion = "",
    String storeVersion = "",
    String appStoreLink = "",
    String releaseNotes = "",
  }) {
    this.isUpdated = isUpdated;
    this.isRequiredUpdate = isRequiredUpdate;
    this.localVersion = localVersion;
    this.storeVersion = storeVersion;
    this.appStoreLink = appStoreLink;
    this.releaseNotes = releaseNotes;
  }

  static AppVersionOutputModel create() {
    var result = AppVersionOutputModel();
    return result;
  }
}
