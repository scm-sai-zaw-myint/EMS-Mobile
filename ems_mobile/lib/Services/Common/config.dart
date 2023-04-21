// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://172.20.90.74:8080/ems/api";
  static final String imgUrl = domainUrl.replaceAll("api", "");

  /// Pages Routes Start ///
  static const String welcomePage = "/";
  static const String loginPage = "/login";
  static const String dashboardPage = "/dashboard";
  static const String changePasswordPage = "/changePassword";
  static final String profilePage = "/profile";
  static final String singleLeaveRequestPage = "/SingleLeaveReport";
  static final String longTermLeaveRequestPage = "/longTermLeaveReport";
  static final String overtimeRequestPage = "/overtimeRequest";
  static final String attendanceRequestPage = "/attendanceRequest";
  static final String transportationRequestPage = "";
  static final String leaveHistoryPage = "/leaveHistory";
  static final String leaveDetailPage = "/leaveDetail";
  static final String overtimeHistoryPage = "";
  static final String attendanceHistoryPage = "/attendanceHistory";
  static final String transportationHistoryPage = "";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";

  static final String changePassword = "/changePassword?update=update";
  static final String profile = "/employeeProfile";
  static final String leaveHistory = "/leaveRecord?offset=1&limit=10";
  static final String singleLeaveRequest = "/leaveReport";
  static final String longLeaveRequest = "/longTermLeaveReport";
  static final String overtimeRegist = "/registerOvertime";

  static final String attendanceData = "/historyAttendanceReport";
  static final String leaveHistoryRecord = "/historyleaveRecord";
  static final String overtimeHistoryRecord = "/searchHistory";
  static final String holidayList = "/getHolidays";
}
