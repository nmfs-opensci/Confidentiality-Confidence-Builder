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
    
  # 3b IF DATA ARE ON A SHARED NETWORK CONSIDER HIDING FILE NAMES USING {dotenv}
    # SHARE THE DIRECTORY DETAILS WITH APPROVED DATA USERS VIA A .env FILE
    
      # THIS CHUNK OF CODE IS NOT MEANT TO BE RUN IN TODAY'S DEMO
      # data_raw <- read.csv(shared_directory_via_env)

  # 3c IF DATA ARE ACCESSED USING DATABASES MANAGEMENT SYSTEMS, CONSIDER USING USING {DBI} OR {ROracle}
    # SHARE THE DATABASE LINKS WITH APPROVED DATA USERS VIA A .env FILE
    # USE keyring TO MANAGE YOUR USERNAMES AND ACCESS KEYS

      # THIS EXAMPLE CHUNK OF CODE IS NOT MEANT TO BE RUN IN TODAY'S DEMO
      # con <- dbConnect(dbDriver("service", username = ,
                         password = ,
                         dbname = Sys.getenv("dbname"))
      # data_raw <- dbGetQuery(con, "Select * from paste0(Sys.getenv("table_name"))")
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
