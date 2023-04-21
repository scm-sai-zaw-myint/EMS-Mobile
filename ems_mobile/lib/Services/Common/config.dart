// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://150.95.82.104:8080/ems/api";
  static final String imgUrl = domainUrl.replaceAll("api", "");

  /// Pages Routes Start ///
  static const String welcomePage = "/";
  static const String loginPage = "/login";
  static const String dashboardPage = "/dashboard";
  static const String changePasswordPage = "/changePassword";
  static final String profilePage = "/profile";
  static final String singleLeaveRequestPage = "";
  static final String longTermLeaveRequestPage = "";
  static final String overtimeRequestPage = "/overtimeRequest";
  static final String attendanceRequestPage = "";
  static final String transportationRequestPage = "";
  static final String leaveHistoryPage = "/leaveHistory";
  static final String leaveDetailPage = "/leaveDetail";
  static final String overtimeHistoryPage = "/overtimeHistory";
  static final String attendanceHistoryPage = "";
  static final String transportationHistoryPage = "";
  static final String dailyTemperatureReportPage = "/dailyTemperatureReport";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";

  static final String changePassword = "/changePassword?update=update";
  static final String profile = "/employeeProfile";
  static final String leaveHistory = "/leaveRecord";
  static final String overtimeRegist = "/registerOvertime";

  static final String attendanceData = "/historyAttendanceReport";
  static final String leaveHistoryRecord = "/historyleaveRecord";
  static final String overtimeHistoryRecord = "/searchHistory";
  static final String holidayList = "/getHolidays";
}
