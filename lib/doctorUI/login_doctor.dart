import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/forgot_pass.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:healing_haven/loginsignup%20page/utils/square_tile.dart';

class LoginPageDoctor extends StatefulWidget {
  const LoginPageDoctor({super.key});

  @override
  State<LoginPageDoctor> createState() => _LoginPageDoctorState();
}

class _LoginPageDoctorState extends State<LoginPageDoctor> {
  final _formKey = GlobalKey<FormState>();
  final adminUsernameController = TextEditingController();
  final adminPasswordController = TextEditingController();

  @override
  void dispose() {
    adminUsernameController.dispose();
    adminPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  bool _isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!_isValidPassword(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, number, and special char.';
    }
    return null;
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/doctorhomepage',
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 120,
                    width: 240,
                    child: Image.asset('lib/images/31.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Sign in as a Doctor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyTextField(
                    hintText: "Email",
                    ObsecureText: false,
                    controller: adminUsernameController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hintText: "Password",
                    ObsecureText: true,
                    controller: adminPasswordController,
                    validator: _validatePassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ForgotPasswordPage(
                                  onBackToLogin: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/logindoctor',
                                    );
                                  },
                                ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: const Alignment(0.8, 0),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Mybutton(
                    txtColor: Colors.brown.shade900,
                    onTap: _handleLogin,
                    buttonTxt: "Sign In",
                    color: Colors.brown.shade100,
                    splashcolor: Colors.brown.shade100,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown.shade300,
                        ),
                      ),
                      const Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareTile(Imagepath: 'lib/images/g.png'),
                      SizedBox(width: 20),
                      SquareTile(Imagepath: 'lib/images/f.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
