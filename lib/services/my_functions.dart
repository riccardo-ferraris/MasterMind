import 'dart:math';

class MyFunctions {
  String createWordToGuess() {
    final random = Random();

    int first = 0 + random.nextInt(9);
    int second = 0 + random.nextInt(9);
    int third = 0 + random.nextInt(9);
    int fourth = 0 + random.nextInt(9);
    return '$first$second$third$fourth';
  }

  int countGenericRightNumbers(
    String wordToGuess,
    String firstNumber,
    String secondNumber,
    String thirdNumber,
    String fourthNumber,
  ) {
    int counter = 0;

    // first clause
    if (wordToGuess.contains(firstNumber)) {
      counter++;
    }

    // second clause
    if (secondNumber != firstNumber && wordToGuess.contains(secondNumber)) {
      counter++;
    } else if (secondNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    }

    //third clause
    if (thirdNumber != secondNumber &&
        thirdNumber != firstNumber &&
        wordToGuess.contains(thirdNumber)) {
      counter++;
    } else if (thirdNumber == secondNumber &&
        thirdNumber != firstNumber &&
        secondNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    } else if (thirdNumber != secondNumber &&
        thirdNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    } else if (thirdNumber == secondNumber &&
        thirdNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 2) {
      counter++;
    }

    //fourth clause
    if (fourthNumber != thirdNumber &&
        fourthNumber != secondNumber &&
        fourthNumber != firstNumber &&
        wordToGuess.contains(fourthNumber)) {
      counter++;
    } else if (fourthNumber == thirdNumber &&
        fourthNumber != secondNumber &&
        fourthNumber != firstNumber &&
        thirdNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    } else if (fourthNumber != thirdNumber &&
        fourthNumber == secondNumber &&
        fourthNumber != firstNumber &&
        secondNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    } else if (fourthNumber != thirdNumber &&
        fourthNumber != secondNumber &&
        fourthNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 1) {
      counter++;
    } else if (fourthNumber == thirdNumber &&
        fourthNumber == secondNumber &&
        fourthNumber != firstNumber &&
        secondNumber.allMatches(wordToGuess).length > 2) {
      counter++;
    } else if (fourthNumber == thirdNumber &&
        fourthNumber != secondNumber &&
        fourthNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 2) {
      counter++;
    } else if (fourthNumber != thirdNumber &&
        fourthNumber == secondNumber &&
        fourthNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 2) {
      counter++;
    } else if (fourthNumber == thirdNumber &&
        fourthNumber == secondNumber &&
        fourthNumber == firstNumber &&
        firstNumber.allMatches(wordToGuess).length > 3) {
      counter++;
    }

    return counter;
  }

  int countRightNumbersAtRightPosition(
    String wordToGuess,
    String firstNumber,
    String secondNumber,
    String thirdNumber,
    String fourthNumber,
  ) {
    int counter = 0;

    if (wordToGuess[0] == firstNumber) {
      counter++;
    }
    if (wordToGuess[1] == secondNumber) {
      counter++;
    }
    if (wordToGuess[2] == thirdNumber) {
      counter++;
    }
    if (wordToGuess[3] == fourthNumber) {
      counter++;
    }
    return counter;
  }
}
