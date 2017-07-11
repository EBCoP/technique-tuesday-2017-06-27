# Announcement:

EBCoP is thrilled to announce a weekly "puzzle" to test and improve
your programming and analytic skillz (sic). On Week One, we will
introduce a puzzle (see below). You will have the rest of the week to
solve the puzzle. During that time, you can post questions or ideas
for further discussion. Once you have solved the puzzle, you can send
your answer and code to me (Andy). Answers are due by close of
business that Friday. You can send me your solution and code in an
email or just send me a link to a GitLab or GitHub repository. On week
two we will publish the code for anyone who got the right answer and
we will discuss some of the programming ideas / techniques necessary
to solve the puzzle.

Everyone who sends in a correct answer will be entered into a
drawing. The winner of the drawing will get to help develop the puzzle
introduced the following week. If you have an idea for a puzzle,
please let me know. I'm looking for puzzles that introduce a
programming or statistics challenge, but they should not take hours to
solve.

## Languages:

You can use any language you want to solve these puzzles, except
assembly. You can use SAS, SPSS, Excel (VB Script), R, Python, Java,
etc. to solve the problem. I would prefer people use languages that
are in use at DOH. If someone sends in an answer in an esoteric
language, I may not have the ability to assess the code and I will
ignore any/all answers sent to me in assembly (sorry).

## HIPAA / PHI:

These puzzles will not be based on DOH data and there will never be
any PHI. Data used in the puzzle will either be simulated or from an
open data source.

# Puzzle Number One:

All programming languages have one or more ways to implement a
loop. The goal of today's puzzle is to write a loop. This won't be
hard for experience programmers but people newer to programming may
find this a little challenging.

Attached to this post is a zip file. In that file, there are twenty
example CSV files. Place the CSV files into a folder of your
choosing. The files all have the same number of columns and they are
in the same order. Concatenate the files to produce a single CSV file
which contains all of the data from the files and identifies the file
from which the data originated.

It is possible, albeit boring, to do this manually in Excel. You could
open each file and copy paste the data into a new file which you then
save. But, what if the next data set has 2,000 files rather than 20?
I'm sure nobody wants to spend all day playing copy/paste in Excel.

Similarly, you can hard-code the file names into your code, but this
code is "fragile". If the name or number of files changes, your code
breaks. In my hypothetical above, it would be laborious to hard-code
the file names to 2,000 files.

The goal of this puzzle is to let the program figure out how many
files are in the folder, and import them. By doing it this way, your
code is robust and will work as well with 20 files as it will with
2,000 files. To do this, you will need to write a loop ("do" in SAS
parlance).

## Extra Credit #1: 

There are several numeric columns of data. These columns were made by
sampling a sequence of numbers. But I made an error in one file and
there is a column of data with a different average in that file than
in any other file. Can you figure out which file I made the error in?

## Extra Credit #2: 

Using basic descriptive statistics, what can you tell me about the
data columns?

You data is in this file:
https://nysemail.sharepoint.com/_layouts/15/images/iczip.gifconcatenating-files-challenge.zip

Answers and code are due by COB this Friday. Please send your answers
and code to: andy.choens@health.ny.gov. Suggestions for other
challenges are welcome.

 
