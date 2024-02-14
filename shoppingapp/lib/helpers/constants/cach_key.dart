class CacheKey {
  static const int userCache = 001; // default user cached
  static const int mainConfig = 002; // main configuration cached
  static const int localize = 108; // localization
  static const int localizeRef1 = 109; // localization
  static const int localizeRef2 = 110; // localization
  static const int appSetting = 111; // notification
  static const int versionUpdate = 003; // version upgrade
  static const int deviceSetting = 004; // version upgrade
}

class AppCacheKey {
  static const String userCache = "userCache"; // default user cached
  static const String mainConfig = "mainConfig"; // default user cached
  static const String localize = "localize"; // localization
  static const String appSettingCache = "appsetting"; // notification
  static const String versionUpdateCache = "versionUpdate";
  static const String deviceSetting = "deviceSetting";

}
