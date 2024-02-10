class AppUrls{

  static const String _baseApi = "https://admin.lcoyemen.com/api/v1";


  static const String loginUrl = "$_baseApi/auth/login";


  static String checkAttendeeUserUrl(String code, int userId) => "$_baseApi/attendees/check/$code?user_id=$userId";
  static const String allAttendeesUrl = "$_baseApi/attendees";


  static const String registerUserAttendanceToRoomUrl = "$_baseApi/attendances";
  static const String attendancesSummaryUrl = "$_baseApi/attendances/summary";
  static const String attendancesFiltersUrl = "$_baseApi/attendances/filters";


}