import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/forgot_pass.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:healing_haven/loginsignup%20page/utils/square_tile.dart';
import 'package:healing_haven/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Email format validation
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  // Password strength validation
  bool _isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  // Handle login logic
  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // Get the email and password from the controllers
      String email = usernameController.text.trim();
      String password = passwordController.text.trim();

      try {
        await authServ.value.signIn(email: email, password: password);
        Navigator.pushReplacementNamed(context, '/homepageUser');
      } catch (e) {
        // Show an error message if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
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
                    "Sign in to Appoint Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email
                  MyTextField(
                    hintText: "Email",
                    ObsecureText: false,
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!_isValidEmail(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Password
                  MyTextField(
                    hintText: "Password",
                    ObsecureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (!_isValidPassword(value)) {
                        return 'Password must be at least 8 characters,\ninclude uppercase, number, and special char.';
                      }
                      return null;
                    },
                  ),

                  // Forgot Password
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
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/loginpage',
                                      (Route<dynamic> route) => false,
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

                  // Sign In Button
                  Mybutton(
                    txtColor: Colors.brown.shade900,
                    onTap: _handleLogin,
                    buttonTxt: "Sign In",
                    color: Colors.brown.shade100,
                    splashcolor: Colors.brown.shade100,
                  ),

                  const SizedBox(height: 30),

                  // Divider
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

                  // gmail Logins
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          try {
                            await authServ.value.signInWithGoogle();
                            Navigator.pushReplacementNamed(
                              context,
                              '/homepageUser',
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Google sign-in failed: ${e.toString()}',
                                ),
                              ),
                            );
                          }
                        },
                        child: const SquareTile(Imagepath: 'lib/images/g.png'),
                      ),
                      const SizedBox(width: 20),
                      const SquareTile(Imagepath: 'lib/images/f.png'),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerpage');
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Doctor login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Are you the doctor?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/logindoctor');
                        },
                        child: const Text(
                          "Sign in here",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
