import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:healing_haven/loginsignup%20page/utils/square_tile.dart';

class LoginPageSuperAdmin extends StatefulWidget {
  const LoginPageSuperAdmin({super.key});

  @override
  State<LoginPageSuperAdmin> createState() => _LoginPageSuperAdminState();
}

class _LoginPageSuperAdminState extends State<LoginPageSuperAdmin> {
  final superAdminUsernameController = TextEditingController();
  final superAdminPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    superAdminUsernameController.dispose();
    superAdminPasswordController.dispose();
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
        '/superadminpage',
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 120,
                      width: 240,
                      child: Image.asset(
                        'lib/images/31.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "???????👑",
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
                    controller: superAdminUsernameController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hintText: "Password",
                    ObsecureText: true,
                    controller: superAdminPasswordController,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 30),
                  Mybutton(
                    txtColor: Colors.brown.shade900,
                    onTap: _handleLogin,
                    buttonTxt: "Sign In",
                    color: Colors.brown.shade100,
                    splashcolor: Colors.brown.shade100,
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
