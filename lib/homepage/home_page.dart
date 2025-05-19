import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healing_haven/homepage/utils/text_tile.dart';
import 'package:healing_haven/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authServ.value.authStatechanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            Future.microtask(() {
              Navigator.pushReplacementNamed(context, '/login');
            });
            return SizedBox();
          }

          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.grey[300],
              automaticallyImplyLeading: false,
              title: Text(
                "Healing Haven",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.brown.shade900,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://static.seriousmd.com/profile_pictures/doctor_profile_4712_a317745e-5dff-406d-b8e1-4a4840735e4f.jpg',
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextTile(
                                Texttile: 'Dr. Deo Adiel Wong',
                                colorWhat: Colors.black,
                                fontsizeWhat: 16,
                                fontweightWhat: FontWeight.bold,
                              ),
                              SizedBox(height: 4),
                              TextTile(
                                Texttile: 'Dr.',
                                colorWhat: Colors.grey,
                                fontsizeWhat: 14,
                                fontweightWhat: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dermatology Outpatient",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextTile(
                                      Texttile: "Specialty",
                                      colorWhat: Colors.black,
                                      fontweightWhat: FontWeight.bold,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Dermatology",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 16),
                                    TextTile(
                                      Texttile: "Subspecialty",
                                      colorWhat: Colors.black,
                                      fontweightWhat: FontWeight.bold,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Dermatopathology",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextTile(
                                      Texttile: "Experience",
                                      colorWhat: Colors.black,
                                      fontweightWhat: FontWeight.bold,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "15 Years",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 16),
                                    TextTile(
                                      Texttile: "Consultation Availability",
                                      colorWhat: Colors.black,
                                      fontweightWhat: FontWeight.bold,
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "In-Person",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://static.seriousmd.com/profile_pictures/clinic_4712_6b2d68bb-0b54-491e-b4e1-3166bee4327f.jpg',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextTile(
                                      Texttile: "Deo Wong, MD",
                                      colorWhat: Colors.black,
                                      fontsizeWhat: 16,
                                      fontweightWhat: FontWeight.bold,
                                    ),
                                    TextTile(
                                      Texttile:
                                          "1725 Fajardo St. Sampaloc, Manila",
                                      colorWhat: Colors.grey.shade700,
                                      fontsizeWhat: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextTile(
                              Texttile: "Monday to Friday",
                              colorWhat: Colors.black,
                              fontsizeWhat: 17,
                              fontweightWhat: FontWeight.bold,
                            ),
                            Text("10:00 AM - 7:00 PM"),
                            TextTile(
                              Texttile: "(Walk-in and Appointment)",
                              colorWhat: Colors.grey.shade700,
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF422b19),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextTile(
                                Texttile: "Maximum of 3 walk-ins on a full day",
                                colorWhat: Colors.white,
                                txtAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextTile(
                              Texttile: "Saturday to Sunday",
                              colorWhat: Colors.black,
                              fontsizeWhat: 17,
                              fontweightWhat: FontWeight.bold,
                            ),
                            Text("8:00 AM - 2:00 PM"),
                            TextTile(
                              Texttile: "(Walk-in and Appointment)",
                              colorWhat: Colors.grey.shade700,
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF422b19),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextTile(
                                Texttile: "Maximum of 3 walk-ins on a full day",
                                colorWhat: Colors.white,
                                txtAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextTile(
                                  Texttile: "Fee: P500",
                                  colorWhat: Colors.black,
                                  fontsizeWhat: 17,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/schedulingpage',
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xFF422b19),
                                    ),
                                    child: TextTile(
                                      Texttile: "BOOK HERE",
                                      colorWhat: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.people,
                                size: 80,
                                color: Colors.brown.shade600,
                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: TextTile(
                                  Texttile: "  Affiliations",
                                  colorWhat: Colors.black,
                                  fontsizeWhat: 22,
                                  fontweightWhat: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextTile(
                            fontsizeWhat: 18,
                            Texttile:
                                "Philippine Dermatology Society\nInternational Peeling Society\nInternational Trichoscopy Society\nSan Juan Medical Society",
                            colorWhat: Colors.black,
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Icon(
                                Icons.school,
                                size: 80,
                                color: Colors.brown,
                              ),
                            ),
                            SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextTile(
                                Texttile: "Education",
                                colorWhat: Colors.black,
                                fontsizeWhat: 22,
                                fontweightWhat: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextTile(
                                fontsizeWhat: 15,
                                Texttile: "Med School",
                                colorWhat: Colors.black,
                                fontweightWhat: FontWeight.bold,
                              ),
                              TextTile(
                                fontsizeWhat: 18,
                                Texttile: "University of Santo Tomas 2009",
                                colorWhat: Colors.black,
                              ),
                              TextTile(
                                fontsizeWhat: 15,
                                Texttile: "Residency",
                                colorWhat: Colors.black,
                                fontweightWhat: FontWeight.bold,
                              ),
                              TextTile(
                                fontsizeWhat: 18,
                                Texttile:
                                    "Jose R. Reyes Memorial Medical Center 2019",
                                colorWhat: Colors.black,
                              ),
                              TextTile(
                                fontsizeWhat: 15,
                                Texttile: "Fellowship Training",
                                colorWhat: Colors.black,
                                fontweightWhat: FontWeight.bold,
                              ),
                              TextTile(
                                fontsizeWhat: 18,
                                Texttile:
                                    "Jose R. Reyes Memorial Medical Center 2021",
                                colorWhat: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Icon(
                                Icons.verified,
                                size: 80,
                                color: Colors.brown,
                              ),
                            ),
                            SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextTile(
                                Texttile: "Certifications",
                                colorWhat: Colors.black,
                                fontsizeWhat: 22,
                                fontweightWhat: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              TextTile(
                                Texttile: "Local Board Certification",
                                colorWhat: Colors.black,
                                fontweightWhat: FontWeight.bold,
                                fontsizeWhat: 15,
                              ),
                              TextTile(
                                Texttile: "Philippine Dermatological Society",
                                colorWhat: Colors.black,
                                fontsizeWhat: 18,
                              ),
                              TextTile(
                                Texttile: "Professional Regulatory Commission",
                                colorWhat: Colors.black,
                                fontsizeWhat: 18,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Icon(
                                Icons.military_tech,
                                size: 80,
                                color: Colors.brown,
                              ),
                            ),
                            SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: TextTile(
                                Texttile: "Recognitions",
                                colorWhat: Colors.black,
                                fontsizeWhat: 22,
                                fontweightWhat: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              TextTile(
                                Texttile:
                                    "European Academy of Dermatology \nand Venereology Scholarship Awardee (2018-2021).",
                                colorWhat: Colors.black,
                                fontsizeWhat: 18,
                              ),
                              SizedBox(height: 5),
                              TextTile(
                                Texttile:
                                    "World Congress of Dermatology \nScholarship Awardee (2023).",
                                colorWhat: Colors.black,
                                fontsizeWhat: 18,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
