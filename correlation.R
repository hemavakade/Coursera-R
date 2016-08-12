corr <- function(directory, threshold=0){
	cor_df <- complete("specdata")
	cor_id <- cor_df[cor_df$"nobs" > threshold,]$"id"
	fn <- list.files(directory)
	reqd_fn <- fn[cor_id]
	old_path <- getwd()
	setwd(directory)
	corlist <- sapply(reqd_fn, function(x){
		dat <- read.csv(x)
		dat1 <- dat[complete.cases(dat),]
		cor(dat1$"sulfate",dat1$"nitrate")})
	setwd(old_path)
	corlist
}