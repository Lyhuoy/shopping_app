import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shoppingapp/views/authentication/new_password_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  OtpFieldController otpController = OtpFieldController();

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
                        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Forget Password",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image(
                          image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6195/6195696.png'),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: OTPTextField(
                      controller: otpController,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      fieldWidth: 60,
                      outlineBorderRadius: 10,
                      style: const TextStyle(fontSize: 17),
                      onChanged: (pin) {},
                      onCompleted: (pin) {},
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "00:22",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " resend confirmation code.",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const NewPasswordScreen());
                    },
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9775FA),
                      ),
                      child: const Center(
                        child: Text(
                          'Confirm Code',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
