import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healing_haven/doctorUI/doctor_scheduleacc.dart';
import 'package:healing_haven/doctorUI/login_doctor.dart';
import 'package:healing_haven/doctorUI/profiledoctor.dart';

import 'package:healing_haven/homepage/doctor_homepage1.dart';

import 'package:healing_haven/homepage/home_page1.dart';
import 'package:healing_haven/intro%20page/onboarding_screen.dart';
import 'package:healing_haven/loginsignup%20page/forgot_pass.dart';
import 'package:healing_haven/loginsignup%20page/login_page.dart';
import 'package:healing_haven/loginsignup%20page/register_page.dart';
import 'package:healing_haven/loginsignup%20page/register_page2.dart';
import 'package:healing_haven/profilepage/edit_profile.dart';
import 'package:healing_haven/profilepage/password.dart';

import 'package:healing_haven/scheduling_page/scheduling_page.dart';
import 'package:healing_haven/scheduling_page/waiting.dart';
import 'package:healing_haven/superadmin/superadmin_homepage.dart';
import 'package:healing_haven/superadmin/superadminsignin_page.dart';
import 'package:healing_haven/superadmin/usermanagement.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Colors.brown.shade800),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade800),
          ),
          border: OutlineInputBorder(),
        ),
      ),
      home: OnboardingScreen(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/homepageUser': (context) => HomePage1(),
        '/registerpage': (context) => RegisterPage(),
        '/registerpage2': (context) => RegisterPage2(),
        '/doctorhomepage': (context) => DoctorHomePage1(),
        '/schedulingpage': (context) => SchedulingPage(),
        '/waitingpage': (context) => WaitingPage(),
        '/schedulepagedoctor': (context) => DoctorSchedulePage(),
        '/profiledoctor': (context) => DoctorProfilePage(),
        '/editportfolio': (context) => EditProfilePage(),
        '/changepassword': (context) => ChangePasswordPage(),
        '/onboardingscreen': (context) => OnboardingScreen(),
        '/logindoctor': (context) => LoginPageDoctor(),
        '/forgotpasswordpage': (context) => ForgotPasswordPage(),
        '/usermanagement': (context) => UserManagementScreen(),
        '/superadminpage': (context) => SuperAdminHomePage(),
        '/hiddenpage': (context) => LoginPageSuperAdmin(),
      },
    );
  }
}
