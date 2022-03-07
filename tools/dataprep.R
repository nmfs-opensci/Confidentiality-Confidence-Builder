# 1 LOAD LIBRARIES ####

  # TURN ON THE FOLLOWING LIBRARIES 
  # USE WHICHEVER METHOD YOU PREFER

  librarian::shelf(here, googlesheets4, ROracle, keyring, dotenv)

# 2 SET WD WITH {HERE} ####

  # CONFIRM WORKING DIRECTORY RELATIVE TO PROJECT ROOT

  here::i_am("tools/dataprep.R")

# 3 CREATE FOLDER FOR DATA STORAGE ####

  dir.create(here("data"))

# 4 ADD DATA FOLDER TO GITIGNORE ####

  # CREATE A NEW LINE IN THE GITIGNORE FILE
  # ADD COMMENT AND FOLDER NAME FOLLOWED BY "/"
  #  # ignore all files in any directory named data
  #  data/
  # SAVE AND COMMIT CHANGES TO THE GITIGNORE FILE

# READ IN DATA ####

  # 3a READ USING GOOGLESHEETS4
  # OPTIONAL: HIDE GROUP LINK USING {dotenv}

    # EDIT THE PRACTICE.ENV YOU CREATED EARLIER; 
    # ADD A LINE: practice_link="LINK THANK WILL BE PROVIDED DURING OUR MEETING"

      load_dot_env('practice.env')
      gs4_auth()
      1
      data_raw <- read_sheet(Sys.getenv("practice_link")) 
    
  # 3b READ CSV FROM SHARED NETWORK
  # OPTIONAL: HIDE FILE NAME USING {dotenv}
    
    # EDIT THE PRACTICE.ENV YOU CREATED EARLIER; 
    # ADD A LINE: practice_directory="SPECIFIC DIRECTORY ON SHARED NETWORK"
    
    # load_dot_env('practice.env')
    # data_raw <- read.csv(practice_directory)

  # 3c READ DIRECTLY FROM ORACLE
  # SET UP DATABASE CONNECTION TO SERVER 
  # USING {ROracle}, {keyring}, and {dotenv}
    
    # EDIT THE PRACTICE.ENV YOU CREATED EARLIER; 
    # ADD A LINE: practice_oracle="SPECIFIC DATABASE LINK YOU USE"
     
    # con <- dbConnect(dbDriver("Oracle"), username = key_get("MY_USERNAME"),
    #                  password = key_get("MY_PASSWORD"),
    #                  dbname = load_dot_env('practice_oracle'))
    # data_raw <- dbGetQuery(con, )
    # dbDisconnect(con)
    
# 5 ADD CONFIDENTIALITY PATTERN IN GITIGNORE ####
  
  # CREATE A NEW LINE IN THE GITIGNORE FILE
  # ADD COMMENT AND PATTERN 
  # AN ASTERISK MATCHES ZERO OR MORE CHARACTERS
  #  # ignore files flagged for confidentiality
  #  *_C.
  # SAVE AND COMMIT CHANGES TO THE GITIGNORE FILE

# 6 SAVE DATA ####
  
  # BUILD RAW DATA REFERENCE NAME (USE CONFIDENTIALITY PATTERN)
    data_raw.ref <- paste("data_raw", format(Sys.Date(),"%Y%m%d"), "C", sep = "_")
    
  # 6a SAVE ONE FILE AS CSV
    write.csv(data_raw, here("data", paste0(write.ref,".csv")))
    
  # 6b SAVE ONE FILE AS .RDATA 
  # NOTE THAT .RDATA IS INCLUDED IN DEFAULT R GITIGNORE (BUT .RDA IS NOT)
    save(data_raw, here("data", paste0(write.ref,".RData")))
  
  # 6c SAVE WORKSPACE
    # save.image(data_raw, here("data", paste0(write.ref,".RData")))