import 'package:ems_mobile/Screens/Attendance/attendance_edit.dart';
import 'package:ems_mobile/Screens/Attendance/attendance_history.dart';
import 'package:ems_mobile/Screens/Attendance/attendance_report.dart';
import 'package:ems_mobile/Screens/Dashboard/dashboard.dart';
import 'package:ems_mobile/Screens/Leave/leave_detail.dart';
import 'package:ems_mobile/Screens/Leave/leave_history.dart';
import 'package:ems_mobile/Screens/Leave/lorn_term_leave_report.dart';
import 'package:ems_mobile/Screens/Leave/single_leave_report.dart';
import 'package:ems_mobile/Screens/Login/login_page.dart';
import 'package:ems_mobile/Screens/Overtime/overtime_report.dart';
import 'package:ems_mobile/Screens/Profile/change_password.dart';
import 'package:ems_mobile/Screens/Profile/profile.dart';
import 'package:ems_mobile/Services/Common/config.dart';
import 'package:get/get.dart';

class PagesConfig {
  static final List<GetPage> pages = [
    GetPage(name: Config.loginPage, page: () => LoginPage()),
    GetPage(name: Config.dashboardPage, page: () => const Dashboard()),
    GetPage(name: Config.changePasswordPage, page: () => ChangePassword()),
    GetPage(name: Config.profilePage, page: () => const Profile()),
    GetPage(name: Config.leaveHistoryPage, page: () => const LeaveHistory()),
    GetPage(name: Config.leaveDetailPage, page: () => const LeaveDetail()),
    GetPage(
        name: Config.singleLeaveRequestPage,
        page: () => const SingleLeaveReport()),
    GetPage(
        name: Config.longTermLeaveRequestPage,
        page: () => const LongTermLeaveReport()),
    GetPage(
        name: Config.attendanceRequestPage,
        page: () => const AttendanceEditReport()),
    GetPage(
        name: Config.attendanceHistoryPage,
        page: () => const AttendanceHistory()),
    GetPage(
        name: Config.overtimeRequestPage, page: () => const OvertimeReport()),
  ];
}
