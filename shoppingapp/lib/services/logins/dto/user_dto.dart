import 'dart:convert';

class UserDto {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String password;
    dynamic rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    int isAdmin;
    String uuid;
    String enumRole;
    dynamic phone;
    int isCardInfoEnable;

    UserDto({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.password,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
        required this.isAdmin,
        required this.uuid,
        required this.enumRole,
        required this.phone,
        required this.isCardInfoEnable,
    });

    factory UserDto.fromRawJson(String str) => UserDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isAdmin: json["isAdmin"],
        uuid: json["uuid"],
        enumRole: json["enum_role"],
        phone: json["phone"],
        isCardInfoEnable: json["is_card_info_enable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "isAdmin": isAdmin,
        "uuid": uuid,
        "enum_role": enumRole,
        "phone": phone,
        "is_card_info_enable": isCardInfoEnable,
    };
}
