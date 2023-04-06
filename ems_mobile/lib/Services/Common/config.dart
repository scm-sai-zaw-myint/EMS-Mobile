// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://172.20.30.27:8080/ems/api";
  static final String imgUrl = domainUrl.replaceAll("api", "");

  /// Pages Routes Start ///
  static const String welcomePage = "/";
  static const String loginPage = "/login";
  static const String dashboardPage = "/dashboard";
  static const String changePasswordPage = "/changePassword";
  static final String profilePage = "/leaveHistory";
  static final String singleLeaveRequestPage = "/singleLeaveRequest";
  static final String longTermLeaveRequestPage = "/longLeaveRequest";
  static final String overtimeRequestPage = "";
  static final String attendanceRequestPage = "";
  static final String transportationRequestPage = "";
  static final String singleLeaveHistoryPage = "";
  static final String longTermLeaveHistoryPage = "";
  static final String overtimeHistoryPage = "";
  static final String attendanceHistoryPage = "";
  static final String transportationHistoryPage = "";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";

  static final String changePassword = "/changePassword?update=update";
  static final String profile = "/employeeProfile";
  static final String leaveHistory = "/leaveRecord";
  static final String singleLeaveRequest = "/leaveReport";
  static final String longLeaveRequest = "/longTermLeaveReport";
}
