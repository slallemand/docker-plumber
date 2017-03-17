FROM rocker/r-base MAINTAINER Jeff Allen <docker@trestletech.com> RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev
RUN R -e 'install.packages(c("devtools"))'
RUN R -e 'devtools::install_github("trestletech/plumber")'
EXPOSE 8000 ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(port=8000)"]
CMD ["/usr/local/lib/R/site-library/plumber/examples/04-mean-sum/meansum.R"]
