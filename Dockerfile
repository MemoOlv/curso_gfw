FROM rocker/geospatial:4
COPY . /workdir
WORKDIR /workdir

RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('GlobalFishingWatch/gfwr', dependencies = TRUE)"
RUN R -e "install.packages('glue')"
RUN R -e "devtools::install()"
RUN R -e "devtools::document()"
RUN R -e "devtools::build()"
RUN R -e "devtools::check()"
