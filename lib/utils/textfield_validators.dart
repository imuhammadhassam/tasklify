class Validators {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name required";
    }
    // ✅ sirf alphabets aur spaces allow, minimum 2 chars
    final regex = RegExp(r'^[A-Za-z ]{2,}$');
    if (!regex.hasMatch(value)) {
      return "Name must be at least 2 letters (A-Z, a-z only)";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email required";
    }

    // ✅ Generic Email Regex (har domain allow)
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regex.hasMatch(value)) {
      return "Please enter a valid email address";
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
      return "Password doesn’t match";
    }
    return null;
  }
}
