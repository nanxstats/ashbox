FROM rocker/rstudio:latest
MAINTAINER Nan Xiao <nanx@uchicago.edu>

# System dependencies for required R packages
RUN  rm -f /var/lib/dpkg/available \
  && rm -rf  /var/cache/apt/* \
  && apt-get update -qq \
  && apt-get install -t unstable -y --no-install-recommends \
    libxml2-dev \
    libssh2-1-dev

# Basic R package dependencies
RUN Rscript -e "install.packages(c('devtools','knitr','rmarkdown','shiny','RCurl'), repos = 'https://cran.rstudio.com')"

# Basic R package dependencies
RUN Rscript -e "source('https://cdn.rawgit.com/road2stat/liftrlib/fab41764ea8b56677d05c70c86225774164b6ca0/install_cran.R');install_cran(c('ggplot2/1.0.1','scales/0.3.0'))"

RUN Rscript -e "devtools::install_github(c('stephens999/ashr'))"

RUN mkdir /home/rstudio/ashbox/
WORKDIR /home/rstudio/ashbox/
COPY adaptive_shrinkage.Rmd /home/rstudio/ashbox/
