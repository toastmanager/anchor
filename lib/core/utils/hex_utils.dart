class HexUtils {
  static int? tryParse(String? hex) {
    if (hex == null) {
      return null;
    } else {
      return int.tryParse(hex, radix: 16);
    }
  }

  static String? tryToJson(int? hex) {
    if (hex == null) {
      return null;
    } else {
      return hex.toString().substring(3);
    }
  }
}