#Hexagonal Grid

From [hackerrank](https://www.hackerrank.com/challenges/hexagonal-grid "Hackerrank").

![grid](https://hr-filepicker.s3.amazonaws.com/2176-hexagonal-grid.png "example grid")

##The Problem:
You are given a hexagonal grid of size 2xN. Your task is to construct the grid with 2x1 dominoes. The dominoes can be arranged in any of the three orientations shown below. To add to the woes, certain cells of the hexagonal grid are blackened i.e., no domino can occupy that cell. Can you construct such a hexagonal grid? The blackened cell and the 3 dominoes are shown in the figure below.

###Input Format
The first line contains a single integer T, the number of testcases. T testcases follow.
Each testcase contains three lines. The first line of the testcase contains a single integer N, size of the hexagonal grid.
The next two lines describe the grid and have N characters each (0 corresponds to cell to be filled with domino and 1 corresponds to blackened cell).

###Output Format
For each testcase output YES if there exists at least one way to fill structure with dominoes and output NO otherwise.

###Constraints
1 ≤ T ≤ 100
1 ≤ N ≤ 10

###Note
There must be no domino above black cells.
All other cells should have only one domino above it.
