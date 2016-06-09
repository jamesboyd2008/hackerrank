import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// This class has a method for finding the largest difference between two
// elements in an array of positive integers.  I did it in Java because
// hackerrank.com wouldn't let me do it in Ruby.
class Difference {
  	private int[] elements;
  	public int maximumDifference;
    public Difference(int[] array){
        this.elements = array;
    }

    void computeDifference(){
        int localMax = -1;
        int[] array = this.elements;

        for(int i = 0; i < (array.length - 1); i++){

            for(int j = 1; (i + j) < array.length; j++ ){
                int diff = Math.abs(array[i] - array[j]);
                if(diff > localMax){
                    localMax = diff;
                }
            }
        }
        maximumDifference = localMax;
    }
}

public class Solution {
  	public static void main(String[] args) {
    	Scanner sc = new Scanner(System.in);
    	int N = sc.nextInt();
    	int[] a = new int[N];

    	for (int i = 0; i < N; i++) {
    		a[i] = sc.nextInt();
    	}

      	Difference D = new Difference(a);

        D.computeDifference();

        System.out.print(D.maximumDifference);
   }
}
