// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://172.20.30.27:8080/ems/api";
  static final String imgUrl = domainUrl.replaceAll("api", "");

  /// Pages Routes Start ///
  static const String welcomePage = "/";
  static const String loginPage = "/login";
  static const String dashboardPage = "/dashboard";
  static const String changePasswordPage = "/changePassword";
  static const String profilePage = "/profile";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";
  static final String changePassword = "/changePassword?update=update";
  static final String profile = "/employeeProfile";
}
