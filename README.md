# Confidentiality-Confidence-Builder

## PART ONE: OVERVIEW

This repository will help you practice using {keyring}, and {dotenv}. These are very useful packages when it comes to keeping confidential information off of GitHub.

**Step 1.1**: Fork this repository so that you have a copy under your own GitHub account

**Step 1.2:** Clone the new repository that is under your own GitHub account (this will allow you to push your commits)

**Step 1.3:** Create a .env file using the methods below in PART TWO

**Step 1.4:** Practice using [{keyring}](https://r-lib.github.io/keyring/index.html) following the steps in PART THREE

**Step 1.5:** Demo how these tools could be used in a workflow using the R script called dataprep.R (located in the tools/ folder)

## PART TWO: USING [{dotenv}](https://github.com/gaborcsardi/dotenv) TO HIDE INTERNAL LINKS

[{dotenv}](https://github.com/gaborcsardi/dotenv) provides a simple solution for teams that need to share access information internally but that information should not be committed to the repository. Learn more [here](https://towardsdatascience.com/using-dotenv-to-hide-sensitive-information-in-r-8b878fa72020)

**Step 2.1:** Create a .env file. Here you will define visible public names for each sensitive piece of information

- Open a new text file
- Add the following to the first line `Visible_Public_Name="hidden information"`
- Add a blank line at the end of this file. If not, R will have an issue processing it
- To prepare for today's demo, save the text file as "practice.env" in the root directory
- [More dotenv formatting details:](https://github.com/gaborcsardi/dotenv/blob/x/README.md)
    - Note whitespace is NOT allowed right before or after the equal sign
    - Comments start with #, without any leading whitespace
    - You cannot mix variable definitions and comments in the same line
    - Empty lines (containing whitespace only) are ignored

**Step 2.2:** Make sure the .env file is not committed to the repository by adding '*.env' to a new line in the .gitignore file in your project folder

**Step 2.3:** Open a new R script. Install and load the dotenv package. 
```
install.packages("dotenv")
library(dotenv)
```

**Step 2.4:** Load hidden sensitive information stored in .env file using `dotenv::load_dot_env("practice.env")`

**Step 2.5:** Bring your hidden sensitive information into your global environment using `Sys.getenv("Visible_Public_Name")`

## PART THREE: USING [{keyring}](https://r-lib.github.io/keyring/index.html) TO HIDE PERSONAL USER NAMES AND PASSWORDS

This method is suited for storing personal information that individuals on a team use to access their respective databases

"Each keyring can contain one or many secrets (keys). A key is defined by a service name and a password. Once a key is defined, it persists in the keyring store of the operating system. This means the keys persist beyond the termination of a R session. Specifically, you can define a key once, and then read the key value in completely independent R sessions... Note that all platforms have a default keyring, and key_get(), etc. will use that automatically."

**Step 3.1:** Open a new R script. Install and load the keyring package.
```
install.packages("keyring")
library(keyring)
```

**Step 3.2:** Store your username with password using key_set_with_value() OR in via Windows Credential Manager 
- Set up password information in R using keyring:
```
keyring::key_set_with_value(service = "test service", 
                   username = "test username",
                   password = "test password")
```
- Set up a credential in windows:
   - Go to Credential Manager
   - Under the Windows Credentials tab select "Add a generic credential" 
   - Enter information and click OK

![image](https://user-images.githubusercontent.com/71387505/157102607-775a42b1-2465-458d-b50b-808c590e7059.png)

**Step 3.3:** Bring your username and password into your code as needed with 'keyring::key_list()' and 'keyring::key_get()'
- `keyring::key_list()` will show list of the services and usernames you have saved
- `keyring::key_list("test service")$username` will give you just the username
- `keyring::key_get("test service", "test username")` will provide the password associated with a given service and username





