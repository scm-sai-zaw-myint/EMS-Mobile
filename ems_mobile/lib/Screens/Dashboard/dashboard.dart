import 'package:ems_mobile/Screens/Common/calendar_widget.dart';
import 'package:ems_mobile/Screens/Common/common_widget.dart';
import 'package:ems_mobile/Screens/Common/drawer_widget.dart';
import 'package:ems_mobile/Services/Dashboard/dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String _month = DateFormat('MMMM').format(DateTime.now());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardService>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: CommonWidget.lightColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) {
                          return IconButton(onPressed: () => {
                            Scaffold.of(context).openDrawer()
                          }, icon: const Icon(Icons.menu));
                        }
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Good Morning",
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.black12,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Text(
                                "Employee",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: CommonWidget.primaryColor,
                        child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.account_box)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CalendarWidget(),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: const [
                                Text(
                                  "Leave",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 0.5,
                                runSpacing: 0.5,
                                children: [
                                  Chip(
                                    avatar: const CircleAvatar(
                                      backgroundColor: Color(0xFF009865),
                                      child: Text('A'),
                                    ),
                                    backgroundColor: const Color(0xFF006C3F),
                                    label: Text("${DateFormat('MM/d/y').format(DateTime.now())} ( Full )"
                                    ,style: const TextStyle(color: Colors.white),
                                    )
                                  ),
                                  const SizedBox(width: 10,),
                                  Chip(
                                      avatar: const CircleAvatar(
                                        backgroundColor: Color(0xFFFFFFFF),
                                        child: Text('P'),
                                      ),
                                      backgroundColor: const Color(0xFF868686),
                                      label: Text("${DateFormat('MM/d/y').format(DateTime.now())} ( Full )"
                                        ,style: const TextStyle(color: Colors.white),
                                      )
                                  ),
                                  const SizedBox(width: 10,),
                                  Chip(
                                      avatar: const CircleAvatar(
                                        backgroundColor: Color(0xFFEAB2B2),
                                        child: Text('R'),
                                      ),
                                      backgroundColor: const Color(0xFFAB3A3A),
                                      label: Text("${DateFormat('MM/d/y').format(DateTime.now())} ( Full )"
                                        ,style: const TextStyle(color: Colors.white),
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(children: const [
                                Text(
                                  "Overtime",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: CommonWidget.softColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${DateFormat('MM/d/y').format(DateTime.now())}"),
                                      const Text("|"),
                                      Text("${DateFormat('h:m a').format(DateTime.now())} ~ ${DateFormat('h:m a').format(DateTime.now())}"),
                                      const Text("|"),
                                      const Text("1 hour")
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: CommonWidget.softColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${DateFormat('MM/d/y').format(DateTime.now())}"),
                                      const Text("|"),
                                      Text("${DateFormat('h:m a').format(DateTime.now())} ~ ${DateFormat('h:m a').format(DateTime.now())}"),
                                      const Text("|"),
                                      const Text("1 hour")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: const SafeArea(
            child: DrawerWidget(
              employeeName: "Ma May Soe Thinzar Moe",
            ),
          ),
        );
      }
    );
  }
}
