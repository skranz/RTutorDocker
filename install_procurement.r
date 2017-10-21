# install required R packages
install.rtutor.ps = function(user, pkg, base.dir="/home/rtutor/ps") {
  # Install package
  devtools::install_github(paste0(user,"/", pkg), upgrade_dependencies = FALSE)
  
  # Deploy ps
  info = eval(substitute(pkg::ps.pkg.info(), list(pkg=as.name(pkg))))
  dir = file.path(base.dir,pkg)
  try(dir.create(dir, recursive=TRUE))
  deploy.ps(ps.name=info$ps[1],dir = dir,info=info, ask.user=FALSE)
  
  # Create run.R script
  run = paste0(
'library("',pkg,'")

# Adapt your working directory to an existing folder
setwd("',dir,'")
# Adapt your user name
run.ps(user.name="Jon Doe", package="',pkg,'", sample.solution=FALSE)
')

  writeLines(run, file.path(dir,"run.R"))
  
  # copy all Rmd files
  ps.dir = system.file(file.path("ps",info$ps[1]),package = pkg)
  files = unique(c(
    list.files(ps.dir, pattern="*.Rmd",full.names = TRUE),
    list.files(ps.dir, pattern="*.rmd",full.names = TRUE)
  ))    
  file.copy(files, dir)
}

install.rtutor.ps("Fcolli",pkg="RTutorProcurementAuction")
