

class SortHelper{
     static List<T> sortUpdatedArray<T>(List<T> theArray, int index) {
    // take last changed element and put it in front
    final first = theArray.sublist(0, index);
    final last = theArray.sublist(index + 1);
    final theArraySorted = [theArray[index], ...first, ...last];

    return theArraySorted;
  }
}