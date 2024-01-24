class AppUtils {
  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'E-mail is required';
    } else if (!regex.hasMatch(value)) {
      return 'E-mail must be a valid e-mail';
    } else {
      return null;
    }
  }

  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }
}
