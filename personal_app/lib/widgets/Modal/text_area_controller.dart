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

    if ((minLength != null && currentLength < minLength) || (maxLength != null && currentLength > maxLength)) {
      result = false;
    }

    return result;
  }

  TextAreaController({this.maxLength, this.minLength, this.currentLength = 0, this.clear});
}
