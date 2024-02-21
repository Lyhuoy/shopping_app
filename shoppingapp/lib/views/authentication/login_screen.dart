import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/controllers/login_controller.dart';
import 'package:shoppingapp/core.dart';
import 'package:shoppingapp/views/authentication/forget_password_screen.dart';
import 'package:shoppingapp/views/homes/home_welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _passwordObscure = true;
  final _controller = Get.put(LoginController());

  final IAuthenticateService _authenticateService = AuthenticateService();
  AuthLoginInputModel input = AuthLoginInputModel();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> loginAsync() async {
    _controller.showLoadingFullScreen();
    // var result = await _authenticateService.loginAsync(input);
    if (input.userName == "vannsann1@gmail.com" && input.password == "123456") {
      LoginTemp.token = "14|FMzCWfKSTYzyMgzfq4dgPIvilH9oBSaKyX0YUPiJac9bac9e";
      LoginTemp.user.id = 1;
    }
    await Future.delayed(const Duration(milliseconds: 200));
    _controller.hideLoadingFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 25),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                  const Center(
                    child: Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Please enter your data to continue",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Color(0xFF9775FA)),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Color(0xFF9775FA)),
                    //       ),
                    //       labelText: 'Username',
                    //       labelStyle: TextStyle(color: Color(0xFF9775FA)),
                    //     ),
                    //   ),
                    // ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          input.userName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9775FA)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9775FA)),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFF9775FA)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        obscureText: _passwordObscure,
                        onChanged: (value) {
                          input.password = value;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordObscure = !_passwordObscure;
                              });
                            },
                            icon: const Icon(Icons.visibility,
                                color: Color(0xFF9775FA)),
                            color: const Color(0xFF9775FA),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9775FA)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9775FA)),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Color(0xFF9775FA)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const ForgetPasswordScreen());
                            },
                            child: const Text("Forgot password?",
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.right),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Remember me"),
                          Transform.scale(
                            transformHitTests: false,
                            scale: .7,
                            child: CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "By connect your account you confirm that you agree",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "with our",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await loginAsync();
                      if (LoginTemp.token.isNotEmpty &&
                          LoginTemp.user.id != 0) {
                        Get.to(() => const HomeWelcomeScreen());
                      } else {
                        AppChoiceDialog.ok(
                            title: "Login Fails",
                            message:
                                "Please check your mail and password and try again.",
                            ok: () {
                              Get.back();
                            },
                            buttonTitle: "Close");
                      }
                    },
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9775FA),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
