abstract final class AppConstants {
  static int backgroundColor = 0xFFFFFFFF;
}

extension ColorExtension on String {
  int toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return int.parse("0x$hexColor");
    }
    return 0xFF000000;
  }

  String toHexString() {
    if (isEmpty) return "#000000";
    return this;
  }
}
