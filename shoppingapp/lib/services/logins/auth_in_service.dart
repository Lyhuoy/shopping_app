

import 'package:shoppingapp/core.dart';

abstract class IAuthenticateService {
  Future<ResultModel<AuthLoginOutputModel>> loginAsync(AuthLoginInputModel input);
  Future<void> logoutAsync();
}