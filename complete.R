complete <- function(directory, id = 1:332) {
	old_path <-	getwd()
	# Get list of filenames
	filenames <- list.files(directory)
	# Get the required filenames from the directory using the id
	reqd_fn <- filenames[id]
	setwd(directory)
	# Read the csv files and use only the rows which do not have NA in them
	counts_no_na <- sapply(reqd_fn, function(f){sum(complete.cases(read.csv(f)))})
	# Remove all the column names
	names(counts_no_na) <- NULL
	# Set the old path back.
	setwd(old_path)
	# Create and return a dataframe with the id and the corresponding number of rows with no NA values
	data.frame(id = id , nobs = counts_no_na)	
}