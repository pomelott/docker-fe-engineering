FROM centos
ARG name=fe
#RUN rm -rf /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-AppStream.repo
COPY yum.repos.d/* /etc/yum.repos.d/
RUN dnf clean all \
    && dnf makecache \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash \
    && sed  -i 's#https://nodejs.org/dist#https://npm.taobao.org/mirrors/node#g' /root/.nvm/nvm.sh \
    && [ -s "/root/.nvm/nvm.sh" ] && . "/root/.nvm/nvm.sh" \
    #&& nvm install 10.0.0 
    && yum install -y nodejs \
    && npm set registry https://registry.npm.taobao.org/ \
    && npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm install -g nrm \
    && nrm add ek_fe http://172.17.20.156:4873/ \
    && yum install -y svn \
    && yum install -y git