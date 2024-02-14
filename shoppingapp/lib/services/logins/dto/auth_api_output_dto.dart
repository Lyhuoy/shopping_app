class AuthApiOutputDto {
  late int userId;
  AuthApiOutputDto({this.userId = 0});

  AuthApiOutputDto.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'] ?? 0;
  }
}