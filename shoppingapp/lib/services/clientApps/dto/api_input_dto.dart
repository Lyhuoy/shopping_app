import 'dart:convert';

class ApiBaseVersion {
  dynamic value ;
  late int version =0;

  ApiBaseVersion({this.value,required this.version});

  Map<String, dynamic> toJson() =>
      {
        'value': value,
        'version': version,
      };
    
  String toJsonString() => json.encode(toJson());
}

class VersionNumber{
  static const int version1 = 1;
  static const int version2 = 2;
  static const int version3 = 3;
}