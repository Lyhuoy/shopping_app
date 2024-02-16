import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _passwordObscure = true;
  bool _confirmPasswordObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  "New Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: _passwordObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordObscure = !_passwordObscure;
                        });
                      },
                      icon: _passwordObscure ? const Icon(Icons.visibility, color: Color(0xFF9775FA)) : const Icon(Icons.visibility_off, color: Color(0xFF9775FA)),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: _confirmPasswordObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _confirmPasswordObscure = !_confirmPasswordObscure;
                        });
                      },
                      icon: _confirmPasswordObscure ? const Icon(Icons.visibility, color: Color(0xFF9775FA)) : const Icon(Icons.visibility_off, color: Color(0xFF9775FA)),
                      color: const Color(0xFF9775FA),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF9775FA)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF9775FA)),
                    ),
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Color(0xFF9775FA)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Please write your new password.",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 75,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9775FA),
                  ),
                  child: const Center(
                    child: Text(
                      'Reseet Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
