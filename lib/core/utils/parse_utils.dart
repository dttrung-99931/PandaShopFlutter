double parseDouble(String? value) {
  return value != null && value.isNotEmpty ? double.parse(value) : 0;
}

int parseInt(String? value) {
  return value != null && value.isNotEmpty ? int.parse(value) : 0;
}

double? parseDoubleNullable(String? value) {
  return value != null && value.isNotEmpty ? double.parse(value) : null;
}

int? parseIntNullable(String? value) {
  return value != null && value.isNotEmpty ? int.parse(value) : null;
}

int parseMinuteStringToSeconds(String? minutes) {
  return (minutes != null ? double.parse(minutes) * 60 : 0).toInt();
}

int parseSecondsStringToMinutes(String? seconds) {
  return (seconds != null ? double.parse(seconds) / 60 : 0).toInt();
}
