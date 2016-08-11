pollutantmean <- function(directory, pollutant, id = 1:332){
	# choose all the files
	filenames <- list.files(path='specdata', pattern = '*.csv')
	# filter the files we need
	reqd_fn <- filenames[id]
	# Create an empty dataframe
	df = data.frame()
	# Save the old path of the working directory
	old_path <- getwd()
	# Go to the directory where the files are
	setwd(directory)
	# Concatenate the files row wise as we read the CSVs into the dataframe
	for (file in reqd_fn){
		df <- rbind(df,read.csv(file))
	}
	# Set the working directory as the old path
	setwd(old_path)
	# Calulate the mean of the pollutant in the dataframe after removing all NAs
	mean(df[[pollutant]],na.rm=TRUE)
}