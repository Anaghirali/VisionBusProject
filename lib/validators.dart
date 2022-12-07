import 'package:flutter/material.dart';

class Validators {
  Validators._();

  static FormFieldValidator compare(TextEditingController? valueVS, String message) {
    return (value) {
      final valueCompare = valueVS?.text ?? '';
      if (value == null || (value != null && value != valueCompare)) {
        return message;
      }
      return null;
    };
  }
}