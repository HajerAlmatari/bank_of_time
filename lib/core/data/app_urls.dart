class AppUrls{

  static const String _baseApi = "https://bank-of-time.onrender.com/api";

  static const String loginUrl = "$_baseApi/auth/login";
  static const String registerUrl = "$_baseApi/auth/register";


  static const String categoriesUrl = "$_baseApi/categories/skills";
  static const String addSkillUrl = "$_baseApi/persons/add-skills/";
  static String userWithSkills({required int userId}) => "$_baseApi/persons/$userId/skills";


}