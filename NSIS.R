# stable version from CRAN + dependencies
install.packages("aqp", dependencies = TRUE)
install.packages("soilDB", dependencies = TRUE)
install.packages("sharpshootR", dependencies = TRUE)

# database packages (replacement for RODBC)
install.packages(c("DBI","odbc","RSQLite"), dependencies = TRUE)

# latest version off GitHub
remotes::install_github("ncss-tech/aqp", dependencies = FALSE, upgrade = FALSE, build = FALSE)
remotes::install_github("ncss-tech/soilDB", dependencies = FALSE, upgrade = FALSE, build = FALSE)
remotes::install_github("ncss-tech/sharpshootR", dependencies = FALSE, upgrade = FALSE, build = FALSE)

# load required libraries
library(aqp)
library(soilDB)

# fetch all pedons from the selected set in local NASIS database
x <- fetchNASIS(from = 'pedons')

# make sketches of the first 10 pedons
par(mar = c(0,0,0,0))
plot(x[1:10, ], name = 'hzname', label = 'taxonname')