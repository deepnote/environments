FROM deepnote/ir:4.0.4

# Dependencies needed for R libraries
RUN apt-get update \
   && apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev libcairo2-dev libxt-dev \
   libpq-dev \
   libudunits2-dev libgdal-dev libgeos-dev libproj-dev

# Install the R libraries
RUN R -e "install.packages(c('tidyverse', 'data.table', 'RSQLite', 'remotes', 'reticulate', 'igraph', 'plotly'), lib='/usr/local/lib/R/site-library', dependencies = T)"
