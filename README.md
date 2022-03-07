# Confidentiality-Confidence-Builder

## PART ONE: OVERVIEW

This repository will help you practice using {keyring}, and {dotenv}. These are very useful packages when it comes to keeping confidential information off of GitHub.

Step 1: Fork this repository so that you have a copy under your own GitHub account

Step 2: Clone the new repository that is under your own GitHub account (this will allow you to push your commits)

Step 3: Create a .env file using the methods below in PART TWO

Step 4: Practice using [{keyring}]() following the steps in PART THREE

Step 5: Demo how these tools could be used in a workflow using the R script called dataprep.R

## PART TWO: USING [{dotenv}](https://github.com/gaborcsardi/dotenv) TO HIDE INTERNAL LINKS:

[{dotenv}](https://github.com/gaborcsardi/dotenv) provides a simple solution for teams that need to share access information internally but that information should not be committed to the repository. Learn more [here](https://towardsdatascience.com/using-dotenv-to-hide-sensitive-information-in-r-8b878fa72020)

Step 1: Create a .env file. Here you will define visible public names for each sensitive piece of information

- Open a new text file
- Add the following to the first line 'Visible_Public_Name='hidden information'
- Add a blank line at the end of this file. If not, R will have an issue processing it
- To prepare for today's demo, save the text file as "practice.env"
- [More dotenv formatting details:](https://github.com/gaborcsardi/dotenv/blob/x/README.md)
    - Note whitespace is NOT allowed right before or after the equal sign
    - Comments start with #, without any leading whitespace
    - You cannot mix variable definitions and comments in the same line
    - Empty lines (containing whitespace only) are ignored

Step 2: Make sure the .env file is not committed to the repository by adding '*.env' to a new line in the .gitignore file in your project folder

Step 3: Ensure your .env file has the correct file type and is in the correct working directory (in the project’s top level folder, or root directory)

Step 4: Open a new R script. Install and load the dotenv package. 
```
install.packages("dotenv")
library(dotenv)
```

Step 5: Load hidden sensitive information stored in .env file using `load_dot_env("practice.env")`

Step 6: Bring your hidden sensitive information into your global environment using `Sys.getenv("Visible_Public_Name")`
