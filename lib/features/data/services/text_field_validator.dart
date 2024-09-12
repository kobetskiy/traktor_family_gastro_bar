import 'package:traktor_family_gastro_bar/generated/l10n.dart';

abstract class TextFieldValidator {
  static String? validateName(String? value) {
    final nameRegExp = RegExp(r"^[a-zA-Zа-яА-ЯёЁ]+([ \'-][a-zA-Zа-яА-ЯёЁ]+)*$");
    if (value!.trim().isEmpty) {
      return S.current.enterYourName;
    } else if (!nameRegExp.hasMatch(value.trim())) {
      return S.current.enterAValidName;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final nameRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.trim().isEmpty) {
      return S.current.enterYourEmail;
    } else if (!nameRegExp.hasMatch(value.trim())) {
      return S.current.enterAValidEmail;
    }
    return null;
  }

  static String? validatePhone(String? value, {bool? canBeNull}) {
    final phoneRegExp = RegExp(r'^\d{9}$');
    if (canBeNull ?? true) {
      if (value == null || value.trim().isEmpty) return null;
    } else {
      if (!phoneRegExp.hasMatch(value!.trim())) {
        return S.current.enterAValidPhoneNumber;
      }
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final passwordRegExp = RegExp(r'^.{6,}$');
    if (value!.trim().isEmpty) {
      return S.current.enterPassword;
    } else if (!passwordRegExp.hasMatch(value.trim())) {
      return S.current.passwordMustBeAtLeast6Characters;
    }
    return null;
  }

  static String? validateNotNull(String? value, String errorMessage) {
    if (value?.trim().isEmpty ?? true) {
      return errorMessage;
    }
    return null;
  }
}
