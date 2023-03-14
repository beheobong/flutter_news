class DateTimeToString {
  static String toYMD(DateTime? time) {
    if (time == null) {
      return "";
    }
    return "${time.year}-${time.month}-${time.day}";
  }

  static String toYMDHM(DateTime? time) {
    if (time == null) {
      return "";
    }
    return "${time.day < 10 ? "0${time.day}" : time.day.toString()}/${time.month}/${time.year} ${time.hour}:${time.minute < 10 ? "0${time.minute}" : time.minute.toString()}";
  }
}
