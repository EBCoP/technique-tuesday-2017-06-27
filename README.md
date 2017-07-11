# README

The first Technique Tuesday has two complimentary goals:

1. Write some code to import and combine an arbitrary number of CSV
   into a single table/data set. And then look at the resulting data.
2. Introduce some programming concepts which make this possible.

The bulk of the challenge, is seemingly ~~boring~~ trivial. Importing
an arbitrary number of files is not exciting. But it is an opportunity
to think about the programming skills involved and how they could be
relevant in other contexts.

The content of the original challenge, as posted to the EBCoP
SharePoint site is [here](./challenge.md). All of the answers
submitted can be found in the [submitted](./submitted/) folder. I
tweaked the submissions slightly so they would work on my laptop, but
nothing invasive.

The remainder of the discussion is broken down into two parts.

1. File Import
2. Extra Credit

## 1. File Import

Today, I introduce four different programming methods to import the
data files and concatenate them together. The four methods shown are:

1. Copy/Paste *(**WOW:** Nobody attempted it this way.)*
2. Iterative *(**WOW:** Every single R submission solved the challenge this way.)*
3. Recursion *(**NOTE:** Not a single submission attempted this.)*
4. Functionals *(**WARNING:** This approach may cause extreme euphoria.)*

Our task is to import 20 files. But we could import 200, or 2,000. The
actual number of files is irrelevant. Each example solution can import
an arbitrary number of files.  Importing 2,000,000 files would take
more time, but would not require ANY changes to the code.

Before we go any further, we should discuss efficiency. Each of these examples will complete the task in roughly the same amount of time. In this contect, efficiency is about PROGRAMMER efficiency, not program efficiency. If we are more productive/efficient, we can spend more time working on the interesting things and less time thinking about data import/management.

### Method Examples

- I demonstrate several packages in this
  code. Run [setup.R](./setup.R) before running my examples to make
  sure you have the necessary packages installed on your system.
- Examples assume the working directory is in this folder, which holds
all of the example .Rmd files.

### Example Solutions

These examples only import the raw CSV data. I tried to keep these
examples as simple as possible. The code used in the Extra Credit
sections to import the data is more complicated.

1. [Copy/Paste](./copy-paste.md)
2. [Iterative](./iterative.md)
3. [Recursion](./recursion.md)
4. [Functionals](./functionals.md)

The above links take you to the compiled Markdown objects. If you
would like to see how to produce these files, see the .Rmd file with
the corresponding name in the repo [here](./).

# 2. Extra Credit

The extra credit part didn't work out as well as I had hoped. I made a rather silly mistake when I created the data, so the file-level differences were actually quite subtle. Real, but subtle. The code example below imports the data using a more complex version of the functionals solution, and then solves both extra credit challenges.

[Extra Credit](./extra-credit.md)
