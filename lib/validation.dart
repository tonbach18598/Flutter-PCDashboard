class Validation{
  static bool isValidEmail(String email) {
    RegExp reg = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return reg.hasMatch(email);
  }
  
static bool isValidPhone(String phone) {
    RegExp regExp = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regExp.hasMatch(phone);
  }
}