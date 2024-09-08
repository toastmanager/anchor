class DateSerialization {
  static String? tryToJson(DateTime? date) {
    return date?.toIso8601String();
  }

  static String toJson(DateTime date) {
    return tryToJson(date)!;
  }

  static DateTime? tryFromJson(String? timestamp) =>
      timestamp != null ? DateTime.parse(timestamp) : null;
  static DateTime fromJson(String timestamp) => tryFromJson(timestamp)!;

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
