import 'package:login_task_nti/generated/l10n.dart';

abstract class ValidatorFormField {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validateName;
    }
    if (value.length < 3) {
      return S.current.validateName2;
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return S.current.validatePassword;
    }
    if (value.length < 5) {
      return S.current.validatePassword2;
    }
    return null;
  }

  static String? validateConfirmPassword(value) {
    if (value == null || value.isEmpty) {
      return S.current.validateConfirmPassword;
    }
    if (value.length < 5) {
      return S.current.validateConfirmPawword2;
    }
    return null;
  }

  static String? validateTitle(value) {
    if (value == null || value.isEmpty) {
      return S.current.validateTitle;
    }
    if (value.length < 5) {
      return S.current.validateTitle2;
    }
    return null;
  }

  static String? validateDescription(value) {
    if (value == null || value.isEmpty) {
      return S.current.ValidateDesc;
    }
    if (value.length < 5) {
      return S.current.ValidateDesc2;
    }
    return null;
  }
}
