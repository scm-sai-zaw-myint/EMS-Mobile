// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://172.31.240.1:8080/ems/api";

  /// Pages Routes Start ///
  static const String welcomePage = "/";
  static const String loginPage = "/login";
  static const String dashboardPage = "/dashboard";
  static const String changePasswordPage = "/changePassword";
  static const String overtimeRequestPage = "/overtimeRequest";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";
  static final String changePassword = "/changePassword?update=update";
  static final String overtimeRegist = "/registerOvertime";
}
