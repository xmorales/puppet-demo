FROM centos:6

MAINTAINER Xavier Morales <xavier.morales@amaris.com>

#Hack to leave the container up by default
CMD tail -f /etc/redhat-release

RUN rpm -i https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum install -y vim-enhanced git puppet
