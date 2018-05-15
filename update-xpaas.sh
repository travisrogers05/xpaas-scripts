#/bin/bash

#-------------------------------------------------------------------
# This script automates updating an Openshift environment to have
# specific versions of the xPaaS imagestreams and templates
#----
# Must have OCP admin rights to perform these tasks
#-------------------------------------------------------------------

# The repo url
REPOURL=https://github.com/jboss-openshift/application-templates

# Set the desired tag to use
TAG=ose-v1.4.12

# get a specific tag of the jboss-openshift repo
git clone $REPOURL
cd application-templates
git checkout $TAG

ISLIST=`find . -name "*.json" | grep -v '/secrets/' | grep -v 'image-streams' | grep 'image-stream'`
for stream in $ISLIST ;
 do
   # delete current imagestream
   cat ${stream} | oc -n openshift delete -f -
   # create new imagestream
   oc -n openshift create -f ${stream}
 done


# delete any existing xpaas templates
TEMPLATELIST=`find . -name "*.json" | grep -v '/secrets/' | grep -v 'image-stream' | cut -c 3- | cut -d '/' -f2 | rev | cut -c 6- | rev`
for template in $TEMPLATELIST ;
 do
   oc -n openshift delete template ${template}
 done

# load the new xpaas templates
TEMPLATELIST=`find . -name "*.json" | grep -v '/secrets/' | grep -v 'image-stream'`
for template in $TEMPLATELIST ;
 do
   oc -n openshift create -f ${template}
 done


# ensure the image versions are available (fixes a bug)
#for is in jboss-eap71-openshift \
#  jboss-eap64-openshift \
#  jboss-webserver31-tomcat7-openshift \
#  jboss-webserver31-tomcat8-openshift \
#  jboss-datagrid71-openshift \
#  jboss-datagrid71-client-openshift \
#  jboss-datavirt64-openshift \
#  jboss-datavirt64-driver-openshift \
#  jboss-processserver64-openshift \
#  jboss-decisionserver64-openshift \
#  jboss-amq-63 \
#  redhat-openjdk18-openshift \
#  redhat-sso72-openshift ;
#do
#  oc -n openshift import-image ${is} --all=true
#done


 


