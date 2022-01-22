class StringHelper {
  //Gets String and makes first letter Uppercase
  static String capitalizeStringWithoutAddingEmptySpaceToTheEnd(String? string) {
    if (string == null) return "";
    String updatedName = "";
    var wordsInName = string.split(" ");
    for (int i = 0; i < wordsInName.length; i++) {
      wordsInName[i] = wordsInName[i].replaceAll("I", "ı");
      if (wordsInName[i].length >= 2) {
        updatedName += wordsInName[i][0].toUpperCase() + wordsInName[i].substring(1).toLowerCase();
        //add space at the end of firt word of the name if person has more then 1 name
        if (i + 1 < wordsInName.length) {
          updatedName += ' ';
        }
      }
    }
    return (updatedName.trimLeft());
  }

  //Gets String and makes first letter Uppercase
  static String capitalizeString(String? string) {
    if (string == null) return "";
    String updatedName = "";
    var wordsInName = string.split(" ");
    for (int i = 0; i < wordsInName.length; i++) {
      wordsInName[i] = wordsInName[i].replaceAll("I", "ı");
      if (wordsInName[i].length >= 2) {
        updatedName += wordsInName[i][0].toUpperCase() + wordsInName[i].substring(1).toLowerCase() + " ";
      }
    }
    return (updatedName.trimLeft());
  }
}
