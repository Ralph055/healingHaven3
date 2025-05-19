import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healing_haven/loginsignup page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup page/utils/mybutton.dart';
import '../auth_service.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final _formKey = GlobalKey<FormState>();

  bool isConfirmPasswordHidden = true;
  bool isPasswordHidden = true;

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final Authserv _authService = Authserv();

  String? email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    email = ModalRoute.of(context)!.settings.arguments as String?;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleCreateAccount() async {
    if (_formKey.currentState!.validate()) {
      if (email == null) {
        _showError("Email not found from previous step.");
        return;
      }

      try {
        await _authService.createAccount(
          email: email!.trim(),
          password: passwordController.text.trim(),
        );

        // Navigate to homepage on success
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/homepageUser',
          (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (e) {
        _showError(
          e.message ?? "An error occurred while creating the account.",
        );
      }
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Registration Error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
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
                  const SizedBox(height: 20),
                  Icon(
                    Icons.cloud_outlined,
                    size: 100,
                    color: Colors.grey.shade100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create Your Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyTextField(
                    hintText: "Password",
                    ObsecureText: isPasswordHidden,
                    controller: passwordController,
                    validator: _validatePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyTextField(
                    hintText: "Confirm Password",
                    ObsecureText: isConfirmPasswordHidden,
                    controller: confirmpasswordController,
                    validator: _validateConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordHidden = !isConfirmPasswordHidden;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                  Mybutton(
                    onTap: _handleCreateAccount,
                    buttonTxt: "Create Account",
                    color: Colors.brown.shade100,
                    splashcolor: Colors.brown.shade100,
                    txtColor: Colors.brown.shade900,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
