class Validators {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name required";
    }
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (!regex.hasMatch(value)) {
      return "Only alphabets allowed (A-Z, a-z)";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email required";
    }
    final regex = RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$');
    if (!regex.hasMatch(value)) {
      return "Enter valid email (e.g. abc@gmail.com)";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm Password required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
