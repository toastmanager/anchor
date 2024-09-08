class DateSerialization {
  static String toJson(DateTime date) {
    return date.toIso8601String();
  }

  static DateTime fromJson(String timestamp) => DateTime.parse(timestamp);

  static List<String> listToJson(List<DateTime> dates) {
    List<String> res = [];
    for (DateTime date in dates) {
      res.add(toJson(date));
    }
    return res;
  }

  static List<DateTime> listFromJson(List<dynamic> timestamps) {
    List<DateTime> res = [];
    for (String timestamp in timestamps) {
      res.add(fromJson(timestamp));
    }
    return res;
  }
}
