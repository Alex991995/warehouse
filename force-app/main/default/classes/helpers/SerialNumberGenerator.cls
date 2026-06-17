/**
 *@description Class that manages generating serial numbes
 */
public with sharing  class SerialNumberGenerator {
  final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  
  public String geterate() {
    String result = '';
    
    for (Integer i = 1; i <= 11; i++) {
      Integer digit = geterateRandomDigit(9,0);
      Integer digitForLetter = geterateRandomDigit(chars.length(), 1);
      String randomLetter =  chars.substring(digitForLetter - 1, digitForLetter);
      
      if(i <= 2){
        result += randomLetter;
      }
      /**
       *@description If it's odd number and 7 or less then true
       */
      else if(0 != Math.mod(i, 2) && i <= 7){
        result += '-';
      }
      else if(i == 4){
        result += digit;
      }
      else if(i == 6){
        result += randomLetter;
      }
      else {
        result += digit;
      }
    }
    return result;
  }
  
  private Integer geterateRandomDigit (Integer max, Integer min){
    return (Integer) (Math.random() * (max - min + 1)) + min;
  }
}