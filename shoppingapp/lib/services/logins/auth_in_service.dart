import 'package:shoppingapp/core.dart';

abstract class IAuthenticateService {
  Future<ResultModel<UserDto>> loginAsync(
    AuthLoginInputModel input,
  );
  Future<void> logoutAsync();

  Future<UserDto> getUserAsyn();
}
