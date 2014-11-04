FROM jjhughes57/docker-selenium-server

#==============
# Xvfb
#==============
RUN apt-get update -qqy \
  && apt-get -qqy install \
    xvfb 

#=================
# Mozilla Firefox
#=================
RUN apt-get remove iceweasel

RUN echo "deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" >> /etc/apt/sources.list

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29

RUN apt-get update -qqy \
  && apt-get -qqy install \
    firefox 

EXPOSE 4444

CMD ["java", "-jar", "/usr/src/selenium-server.jar", "-role", "node", "-hub", "http://selenium-server:4444/grid/register", "-browser", "browserName=firefox,platform=LINUX"]