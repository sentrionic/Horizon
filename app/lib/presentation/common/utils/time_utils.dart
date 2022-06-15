import 'package:intl/intl.dart';

String getDurationString(int seconds) {
  final duration = Duration(seconds: seconds);
  final minString = duration.inMinutes.toString();
  final secString = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
  return "$minString:$secString";
}

final DateFormat _formatter = DateFormat("MMM dd, yyyy");

String getDateAdded(String time) {
  final date = DateTime.parse(time);
  final now = DateTime.now();
  final days = now.difference(date).inDays;
  if (days == 0) {
    return "today";
  } else if (days == 1) {
    return "1 day ago";
  } else if (days <= 31) {
    return "$days days ago";
  } else {
    return _formatter.format(date);
  }
}

String getPlaylistDuration(int seconds) {
  final duration = Duration(seconds: seconds);
  if (duration.inHours > 0) {
    final hourString = duration.inHours;
    final minString = duration.inMinutes.remainder(60);
    return "$hourString hr $minString min";
  } else {
    final minString = duration.inMinutes;
    final secString = duration.inSeconds.remainder(60);
    return "$minString min $secString sec";
  }
}

String getTimeOfDay() {
  final time = DateTime.now().hour;
  if (time >= 6 && time < 12) {
    return "Good morning";
  } else if (time >= 12 && time < 14) {
    return "Good noon";
  } else if (time >= 14 && time < 18) {
    return "Good afternoon";
  } else if (time >= 18 && time < 22) {
    return "Good evening";
  } else {
    return "Good night";
  }
}
