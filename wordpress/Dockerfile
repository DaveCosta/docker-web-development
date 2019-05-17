FROM centos:latest

MAINTAINER David da Costa

RUN yum -y group install "Development Tools"
RUN yum -y install clang llvm-devel
RUN yum -y install libXext libSM libXrender libXpm-devel

RUN mkdir -p /root/textures

RUN echo "" >> /root/.bashrc
RUN echo ". /usr/local/root/bin/thisroot.sh" >> /root/.bashrc

ADD Makefile  /root/textures
ADD root_v6.08.06.Linux-centos7-x86_64-gcc4.8.tar.gz /usr/local

WORKDIR /root/textures
