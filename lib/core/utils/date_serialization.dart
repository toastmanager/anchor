class DateSerialization {
  static int toJson(DateTime date) => date.millisecondsSinceEpoch;
  static DateTime fromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  static List<int> listToJson(List<DateTime> dates) {
    List<int> res = [];
    for (DateTime date in dates) {
      res.add(date.millisecondsSinceEpoch);
    }
    return res;
  }

  static List<DateTime> listFromJson(List<dynamic> timestamps) {
    List<DateTime> res = [];
    for (int timestamp in timestamps) {
      res.add(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    }
    return res;
  }
}
