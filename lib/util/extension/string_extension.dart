extension StringExtension on String {
  // * --- Convert --- * //
  DateTime toDate() => DateTime.parse(this);

  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  // * --- Validation --- * //
  bool get isUrl => RegExp(r'https?://[a-zA-Z0-9\-%_/=&?.]+').hasMatch(this);

  bool get isId => RegExp(r'[a-zA-Z0-9\-%_/=&?.]+').hasMatch(this);

  bool get isEmail =>
      RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}').hasMatch(this);

  /// 大文字小文字含む英数字8桁以上かどうか。
  bool get isPassword =>
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9.?/-]{8,}$')
          .hasMatch(this);

  // * --- Other --- * //
  bool isNewLine() => '\n' == substring(length - 1);
}
