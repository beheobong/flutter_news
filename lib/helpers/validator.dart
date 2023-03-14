class Validators {
  static final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,11}$');

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  // regex test tạm chưa chính xác
  static final RegExp _cccdRegExp = RegExp(
    r'^(\d{13})?$',
  );

  static final RegExp _spaceRegExp = RegExp(r"\s");

  static bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static bool isEmpty(String? text) {
    return text == null ||
        text.trim().isEmpty ||
        text == 'null' ||
        text.isEmpty;
  }

  static bool isValidCCCD(String cccd) {
    return _cccdRegExp.hasMatch(cccd);
  }

  static String? validCccd(String? cccd) {
    if (cccd == null || cccd.isEmpty) {
      return 'CCCD không được để trống';
    } else if (cccd.trim() == '' || cccd.trim().isEmpty) {
      return 'CCCD không được là khoảng trắng';
    } else if (!isValidCCCD(cccd.trim())) {
      return 'CCCD không hợp lệ';
    }
    return null;
  }

  static String? isValidChat(String? chat) {
    if (chat == null || chat.isEmpty) {
      return 'Vui lòng nhập tin nhắn';
    }
    return null;
  }

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidSpace(String password) {
    return _spaceRegExp.hasMatch(password);
  }

  static bool isValiNumber(String? s) {
    if (s == null || s.contains('-')) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static String? validEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email không được để trống';
    } else if (email.trim().isEmpty) {
      return 'Email không được là khoảng trắng';
    } else if (!isValidEmail(email.trim())) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? valiPhone(String? number) {
    if (number == null || number.isEmpty) {
      return 'Số điện thoại không được để trống';
    } else if (number.trim().isEmpty) {
      return 'Số điện thoại không được là khoảng trắng';
    } else if (!isValiNumber(number) || number.length < 11) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  static String? validPw(String? password) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng nhập khẩu';
    } else if (isEmpty(password)) {
      return 'Vui lòng nhập mật khẩu khác rỗng';
    } else if (isValidSpace(password)) {
      return 'Mật khẩu không được chứa ký tự khoảng trắng';
    } else if (!isValidPassword(password)) {
      return 'Mật khẩu không hợp lệ, mật khẩu có chứa ít nhất 6 đến 11 ký tự, trong đó có ít nhất một số và bao gồm cả chữ thường và chữ hoa và ký tự đặc biệt';
    }
    return null;
  }

  static String? validConfirmPw(String? password, String? confirmPassword) {
    if (password == null ||
        password.isEmpty ||
        confirmPassword == null ||
        confirmPassword.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (isEmpty(confirmPassword)) {
      return 'Vui lòng nhập mật khẩu khác rỗng';
    } else if (isValidSpace(confirmPassword)) {
      return 'Mật khẩu không được chứa ký tự khoảng trắng';
    } else if (!isValidPassword(confirmPassword)) {
      return 'Mật khẩu không hợp lệ, mật khẩu có chứa ít nhất 6 đến 11 ký tự, trong đó có ít nhất một số và bao gồm cả chữ thường và chữ hoa và ký tự đặc biệt';
    } else if (password != confirmPassword) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

  static String? validName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Tên không được để trống';
    } else if (name.trim() == '' || name.trim().isEmpty) {
      return 'Tên không được là khoảng trắng';
    }
    return null;
  }
}
