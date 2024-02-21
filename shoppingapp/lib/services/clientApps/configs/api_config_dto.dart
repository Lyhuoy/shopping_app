import 'package:dio/dio.dart';

class ApiConfigHelper{
  static String url({String apiName=''}) => "http://206.189.144.45:8011/api/$apiName";
  static String clientDomain = "";
}

class ApiConfigHeader{
  static const headerJson = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static const plainText = <String, String>{
    'Content-Type': 'text/plain; charset=UTF-8',
  };

  static const headerPDF = <String, String>{
    'Content-Type': 'application/pdf',
  };
  static const headerJPEG = <String, String>{
    'Content-Type': 'image/jpeg',
  };
  static const headerMultipart = <String, List<String>>{
    'Content-Type': ['multipart/form-data'],
  };

  static Options getOptionHeader({String token=""}) {
    var authorizationHeader = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $token",
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json"
    };

    var noRequired = Options(
      followRedirects: true,
      validateStatus: (status) => true,
      headers: headers,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    var required = Options(
      followRedirects: false,
      validateStatus: (status) => true,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: authorizationHeader,
    );
    // request required with authorization token
    return token.isEmpty ? noRequired : required;
  }
}

class ApiResponseCode{
  static int domainNotValid = 600;
}