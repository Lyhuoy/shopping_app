
import 'package:shoppingapp/core.dart';
import 'package:get/get.dart';

class AuthenticateService extends AppService implements IAuthenticateService {

  @override
  Future<ResultModel<AuthLoginOutputModel>> loginAsync(
      AuthLoginInputModel input) async {
    try {
      var resultDto = ResultModel<AuthLoginOutputModel>();
      var version = ApiBaseVersion(
        value: AuthApiInputDto.toJson(input),
        version: VersionNumber.version1,
      );
      var inputJson = version.toJson();
      var response = await postsAsync(
        apiName: ApiName.authenticateLogin,
        input: inputJson,
      );
      if (response.success) {
        var authenticateLogin = AuthLoginOutputModel.create(
          AuthApiOutputDto.fromJson(response.result),
        );
        
        return ResultModel(result: authenticateLogin, success: true);
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
}
