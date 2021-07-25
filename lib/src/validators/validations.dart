
class Validations {
  static bool isValidEmail(String? value) {
    Pattern pattern = r"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value!))
      return false;
    return true;
  }

  static bool isValidPassword(String? value) {
    Pattern pattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}";
    RegExp regExp = new RegExp(pattern.toString());
    if (!regExp.hasMatch(value!))
      return false;
    return true;
  }
}