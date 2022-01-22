class TextAreaController {
  final int maxLength;
  final int minLength;
  int currentLength;
  Function clear;

  int get remainingLength {
    if (this.maxLength == 0) {
      return 0;
    }
    return this.maxLength - this.currentLength;
  }

  bool get isOK {
    bool result = true;

    if ((currentLength < minLength) || (currentLength > maxLength)) {
      result = false;
    }

    return result;
  }

  TextAreaController({this.maxLength = 500, this.minLength = 0, this.currentLength = 0, required this.clear});
}
