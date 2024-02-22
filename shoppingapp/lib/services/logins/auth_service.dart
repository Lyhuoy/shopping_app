import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';

class AuthenticateService extends AppService implements IAuthenticateService {
  @override
  Future<ResultModel<UserDto>> loginAsync(AuthLoginInputModel input) async {
    try {
      var resultDto = ResultModel<UserDto>();

      var response = await postsAsync(
        apiName: "${ApiName.authenticateLogin}${AuthApiInputDto.toParamString(input)}",
        input: AuthApiInputDto.toJson(input)
      );
      if (response.success && response.result != null) {
        LoginTemp.token = response.result;
        await getUserAsyn();
        return ResultModel(result: LoginTemp.user, success: true);
      } else if (response.error != null) {
        return ResultModel(error: response.error);
      }
      return resultDto.create(null, false, null, true);
    } on Exception catch (e) {
      e.printError();
      return ResultModel(
        error: ApiResultError(
          message: "Failure",
          details: "SomethingWentWrong",
        ),
      );
    }
  }

  @override
  Future<void> logoutAsync() async {
    Get.offAll(() => const HomeScreen());
  }

  @override
  Future<UserDto> getUserAsyn() async {
    try {
      var response = await getsAsync(
          apiName: ApiName.authenticateLogin, token: LoginTemp.token);
      if (response.success && response.result != null) {
        LoginTemp.user = UserDto.fromJson(response.result);
      }
      return LoginTemp.user;
    } on Exception catch (e) {
      e.printError();
      return LoginTemp.user;
    }
  }
}
