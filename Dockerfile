FROM skranz/rskranz:latest

MAINTAINER Sebastian Kranz "sebastian.kranz@uni-ulm.de"

# copy and run package installation file
COPY install.r /tmp/install_rtutor.r
RUN Rscript /tmp/install_rtutor.r

COPY install.r /tmp/install_procurement.r
RUN Rscript /tmp/install_procurement.r

