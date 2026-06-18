/**
 *@description Class that manages generating serial numbes
 */
public with sharing class SerialNumberGenerator {
   private static final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  public static String generate() {
    return randomLetters(2) +
      '-' +
      randomDigits(1) +
      '-' +
      randomLetters(1) +
      '-' +
      randomDigits(4);
  }

  private static Integer generateRandomDigit(Integer max, Integer min) {
    return (Integer) (Math.random() * (max - min + 1)) + min;
  }

  private static String randomLetters(Integer length) {
    String result = '';

    for (Integer i = 1; i <= length; i++) {
      Integer randomDigit = generateRandomDigit(chars.length(), 1);
      result += chars.substring(randomDigit - 1, randomDigit);
    }
    return result;
  }

  private static String randomDigits(Integer length) {
    String result = '';

    for (Integer i = 1; i <= length; i++) {
      result += generateRandomDigit(9, 0);
    }
    return result;
  }
}
