// From https://www.hackerrank.com/challenges/30-abstract-classes
// Task:
// Given a Book class and a Solution class, write a MyBook class that
// does the following:
//
// - Inherits from Book
// - Has a parameterized constructor taking these 3 parameters:
//    - string title
//    - string author
//    - int price
// - Implements the Book class' abstract display() method so
//   it prints these 3 lines:
//    - Title: , a space, and then the current instance's title.
//    - Author: , a space, and then the current instance's author.
//    - Price: , a space, and then the current instance's price.
// Note: Because these classes are being written in the same file,
// you must not use an access modifier (e.g.: )
// when declaring MyBook or your code will not execute.
//
// Input Format:
//
// You are not responsible for reading any input from stdin.
// The Solution class creates a Book object and calls the
// MyBook class constructor (passing it the necessary arguments).
// It then calls the display method on the Book object.
//
// Output Format:
//
// The void display() method should print and label the respective title,
// author, and price of the MyBook object's instance (with each value on its
// own line).

import java.util.*;
abstract class Book
{
    String title;
    String author;
    Book(String t,String a){
        title=t;
        author=a;
    }
    abstract void display();


}

class MyBook extends Book{
    int price;

    MyBook(String title, String author, int price){
        super(title, author);
        this.price = price;
    }

    void display(){
        System.out.println("Title: " + title);
        System.out.println("Author: " + author);
        System.out.println("Price: " + price);
    }
}

class Solution
{

   public static void main(String []args)
   {
      Scanner sc=new Scanner(System.in);
      String title=sc.nextLine();
      String author=sc.nextLine();
      int price=sc.nextInt();
      Book new_novel=new MyBook(title,author,price);
      new_novel.display();

   }
}
