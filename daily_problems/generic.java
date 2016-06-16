// from https://www.hackerrank.com/challenges/30-generics

// Write a single generic function named printArray;
// this function must take an array of generic elements as a parameter.

import java.lang.reflect.Method;

class Solution {
  
  public static <E> void printArray(E[] genericArray) {
    for (int i = 0; i < genericArray.length; i++) {
      E element = genericArray[i];
      System.out.println(element);
    }
  }

  public static void main(String args[]){
    Integer[] intArray = { 1, 2, 3 };
    String[] stringArray = { "Hello", "World" };

    printArray( intArray  );
    printArray( stringArray );

    if(Solution.class.getDeclaredMethods().length > 2){
      System.out.println("You should only have 1 method named printArray.");
    }
  }
}
