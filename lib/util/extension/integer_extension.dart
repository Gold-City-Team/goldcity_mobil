extension FormatTime on int {
  String get formatTime {
    var result = '${(Duration(seconds: this))}'.split('.')[0].padLeft(8, '0');
    if (result.startsWith("00:")) {
      return result.substring(3);
    }
    return result;
  }
}
