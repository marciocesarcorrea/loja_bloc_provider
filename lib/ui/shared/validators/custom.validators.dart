class CustomValidators {
  static isEmail(String value) {
    if (value.isEmpty) {
      return 'Email invalido';
    }
    return null;
  }
}
