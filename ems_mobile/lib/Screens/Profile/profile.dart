import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Services/Profile/profile_service.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ProfileService.getProfile();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Management System"),
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img_bg.png"),
                    repeat: ImageRepeat.repeat)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/img_profile.jpg",
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Zaw Lwin Tun",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CommonWidget.profileTitle("Detail Information"),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              CommonWidget.profileRow("Employee ID", "E00419"),
                              CommonWidget.profileRow(
                                  "Employee Name", "Zaw Lwin Tun"),
                              CommonWidget.profileRow(
                                  "Position", "Junior Dveloper"),
                              CommonWidget.profileRow("Team", "Dev-4"),
                              CommonWidget.profileRow(
                                  "Join Date", "26/04/2022"),
                              CommonWidget.profileRow(
                                  "Company ", "Head Office"),
                              CommonWidget.profileRow("Card ID", "18316"),
                              CommonWidget.profileRow("Department", "Dev-4"),
                              CommonWidget.profileRow("Type", "Full Time"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CommonWidget.profileTitle(
                              "Education Detail Information"),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              CommonWidget.profileRow("Language Skill", "N4"),
                              CommonWidget.profileRow("IQ Mark", "100.0"),
                              CommonWidget.profileRow("Programming", "Java"),
                              CommonWidget.profileRow("Graduated University",
                                  "University of Computer Studies, Yangon"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CommonWidget.profileTitle(
                              "Personal Detail Information"),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              CommonWidget.profileRow("DOB", "04/04/2023"),
                              CommonWidget.profileRow("NRC DOB", "04/04/2023"),
                              CommonWidget.profileRow("Gender", "Male"),
                              CommonWidget.profileRow(
                                  "NRC No.", "12/AAAAAA(N)123456"),
                              CommonWidget.profileRow(
                                  "Phone", "09789456123, 0931456987"),
                              CommonWidget.profileRow(
                                  "Email", "scm.zawlwintun@gmail.com"),
                              CommonWidget.profileRow(
                                  "BankAccount", "0000 0000 0000 0000"),
                              CommonWidget.profileRow("SSB No.", ""),
                              CommonWidget.profileRow(
                                  "SSB Card Issue Date", ""),
                              CommonWidget.profileRow("Religion", "Atheist"),
                              CommonWidget.profileRow("PC No.", "P-00464"),
                              CommonWidget.profileRow("PC Password", "abcdefg"),
                              CommonWidget.profileRow(
                                  "MAC Address", "AA-BB-CC-DD-EE-FF"),
                              CommonWidget.profileRow("Contact Name", "Ma Ma"),
                              CommonWidget.profileRow(
                                  "Contact Phone", "09852147963"),
                              CommonWidget.profileRow(
                                  "Relation", "Sugar Mommy"),
                              CommonWidget.profileRow("Address", "Yangon"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
