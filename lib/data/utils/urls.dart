class Urls {
  static final String _baseUrl = "http://35.73.30.144:2005/api/v1";
  static String registration = "$_baseUrl/Registration";
  static String login = "$_baseUrl/Login";
  static String addTask = "$_baseUrl/createTask";
  static String getNewTask = "$_baseUrl/listTaskByStatus/New";
  static String getCompleteTask = "$_baseUrl/listTaskByStatus/Completed";
  static String getCancelledTask = "$_baseUrl/listTaskByStatus/Cancelled";
  static String summaryCard = "$_baseUrl/taskStatusCount";
}
