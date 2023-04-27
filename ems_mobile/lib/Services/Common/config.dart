// ignore_for_file: prefer_const_declarations

class Config {
  static final String domainUrl = "http://172.20.30.98:8080/ems/api";
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
  static final String overtimeHistoryPage = "/overtimeHistoryPage";
  static final String attendanceHistoryPage = "/attendanceHistory";
  static final String editAttendancePage = "/editAttendance";
  static final String transportationHistoryPage = "";
  static final String dailyTemperatureReportPage = "/dailyTemperatureReport";
  static final String addressChangeRequestPage = "/addressChangeRequest";
  static final String addressChangeHistoryPage = "/addressChangeHistory";
  static final String profileChangeRequestPage = "/profileChangeRequestPage";
  static final String profileChangeHistoryPage = "/profileChangeHistoryPage";
  static final String profileChangeDetailPage = "/profileChangeDetailPage";

  /// Pages Routes End ///

  /// API Routes  ///
  static final String login = "/showLogin";

  static final String changePassword = "/changePassword?update=update";
  static final String profile = "/employeeProfile";
  static final String leaveHistory = "/leaveRecord?offset=1&limit=10";
  static final String singleLeaveRequest = "/leaveReport";
  static final String longLeaveRequest = "/longTermLeaveReport";
  static final String overtimeRegist = "/registerOvertime";
  static final String registerAttendance = "/registerAttendanceReport";
  static final String attendanceHistory = "/historyAttendanceReport?offset=1&limit=31";
  static final String editAttendance = "/updateAttendanceReport";
  static final String deleteAttendance = "/deleteAttendanceRecord";
  static final String overtimeHistory = "/historyOvertime?offset=1&limit=20";
  static final String attendanceData = "/historyAttendanceReport";
  static final String leaveHistoryRecord = "/historyleaveRecord";
  static final String overtimeHistoryRecord = "/searchHistory";
  static final String holidayList = "/getHolidays";
  static final String addressChangeHistory =
      "/addressChangeHistory?offset=1&limit=10";
  static final String addressChangeRegist = "/addressChangeRegistration";
  static final String addressChangeSave = "/saveAddressChangeRegistration";
  static final String addressChangeRequest =
      "/requestAddressChangeRegistration";
  static final String transportationRequest = "/registerOtherTransportation";
  static final String transportationHistory = "/listOtherTransportation";
  static final String editTransportation = "/editOtherTransportation/update";

  static final String profileChangeRequest = "/profileChangeRequest/request";
  static final String profileChangeEdit = "/profileChangeEdit?url=1";
  static final String profileChangeSave = "/profileChangeRequest/save";
  static final String profileChangeHistory =
      "/profileChangeHistory?offset=1&limit=10";

  //status list

  static final statusList = {
    "1": "Request",
    "2": "Approve",
    "3": "Reject",
    "4": "Save",
    "7": "Approve (M)"
  };
}
