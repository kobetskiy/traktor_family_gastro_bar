class TextFieldValidator {
  static String? validateName(String? value) {
    final nameRegExp = RegExp(r"^[a-zA-Zа-яА-ЯёЁ]+([ \'-][a-zA-Zа-яА-ЯёЁ]+)*$");
    if (value!.trim().isEmpty) {
      return "Enter your name";
    } else if (!nameRegExp.hasMatch(value.trim())) {
      return "Enter a valid name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final nameRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.trim().isEmpty) {
      return "Enter your email";
    } else if (!nameRegExp.hasMatch(value.trim())) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final phoneRegExp = RegExp(r'^\d{9}$');
    if (value!.trim().isEmpty) {
      return "Enter your phone";
    } else if (!phoneRegExp.hasMatch(value.trim())) {
      return "Enter a valid phone";
    }
    return null;
  }
}
