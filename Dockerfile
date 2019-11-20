# Folding at home

#ciaran's folding at home docker for contriubuting to LTT folding team

FROM ubuntu

ENV USERNAME cTurtle98
ENV TEAM 223518
ENV POWER medium

#install updates
RUN sudo apt update && sudo apt upgrade -y

# download the folding at home client
# currently version 7.5.1
RUN dpkg -i https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb

ADD config.xml /etc/fahclient/
RUN chown fahclient:root /etc/fahclient/config.xml
RUN sed -i -e "s/{{USERNAME}}/$USERNAME/;s/{{TEAM}}/$TEAM/;s/{{POWER}}/$POWER/" /etc/fahclient/config.xml

CMD /etc/init.d/FAHClient start && tail -F /var/lib/fahclient/log.txt
