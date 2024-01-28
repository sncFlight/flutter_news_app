import 'dart:core';

String formatElapsedTime(String publishedDateString) {
  final DateTime publishedDate = DateTime.parse(publishedDateString);

  final DateTime currentTime = DateTime.now();
  final Duration timeDifference = currentTime.difference(publishedDate);

  final double seconds = timeDifference.inSeconds.toDouble();
  final double minutes = seconds / 60;
  final double hours = minutes / 60;
  final double days = hours / 24;
  final double months = days / 30;
  final double years = days / 365;
  final double weeks = days / 7;

  String value;

  if (years >= 1) {
    value = "${years.toInt()} years ago";
  } else if (months >= 1) {
    value = "${months.toInt()} months ago";
  } else if (days >= 7) {
    value = "${weeks.toInt()} weeks ago";
  } else if (days >= 1) {
    value = "${days.toInt()} days ago";
  } else if (hours >= 1) {
    value = "${hours.toInt()} hours ago";
  } else if (minutes >= 1) {
    value = "${minutes.toInt()} minutes ago";
  } else {
    value = "Recently";
  }

  if (value.contains('1')) {
    value = value.replaceAll('s', '');
  }

  return value;
}
