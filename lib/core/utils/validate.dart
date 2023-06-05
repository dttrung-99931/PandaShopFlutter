import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/utils.dart';

class Validate {
  static String? email(String? email) {
    if (isNullOrEmpty(email)) {
      return 'messages.enter_email'.tr();
    }
    if (isValidEmail(email!)) {
      return 'messages.invalid_email'.tr();
    }
    return null;
  }

  static String? phone(String? phone) {
    if (isNullOrEmpty(phone)) {
      return 'messages.enter_phone'.tr();
    }
    if (isValidPhone(phone!)) {
      return 'messages.invalid_phone'.tr();
    }
    return null;
  }

  static String? pass(String? pass) {
    if (isNullOrEmpty(pass)) {
      return 'messages.enter_pwd'.tr();
    }

    return null;
  }

  static bool isValidEmail(String email) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone);
  }

  static bool isNumeric(String str) {
    try {
      double.parse(str);
    } on FormatException {
      return false;
    }
    return true;
  }

  static bool isUuid(String uuid) {
    return RegExp(r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}').hasMatch(uuid);
  }
}
