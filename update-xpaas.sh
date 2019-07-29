#/bin/bash

#-------------------------------------------------------------------
# This script automates updating an Openshift environment to have
# specific versions of the xPaaS imagestreams and templates
#----
# Must have OCP admin rights to perform these tasks
#-------------------------------------------------------------------

CWD=`pwd`

# JBoss EAP 6.4.x
RHEAP6_REPOURL=https://github.com/jboss-openshift/application-templates
RHEAP6_BRANCH=master

# Newer locations for imagestreams and templates
REPOURL=https://github.com/jboss-container-images
RHDM_REPOURL=$REPOURL/rhdm-7-openshift-image
RHDM_BRANCH=7.4.x
RHPAM_REPOURL=$REPOURL/rhpam-7-openshift-image
RHPAM_BRANCH=7.4.x
RHSSO_REPOURL=$REPOURL/redhat-sso-7-openshift-image
RHSSO_BRANCH=sso72-dev
RHJWS3_REPOURL=$REPOURL/jboss-webserver-3-openshift-image
RHJWS3_BRANCH=webserver31-dev
RHJWS5_REPOURL=$REPOURL/jboss-webserver-5-openshift-image
RHJWS5_BRANCH=webserver50-dev
RHAMQ_REPOURL=$REPOURL/jboss-amq-7-broker-openshift-image
RHAMQ_BRANCH=amq71-dev
RHDG_REPOURL=$REPOURL/jboss-datagrid-7-openshift-image
RHDG_BRANCH=datagrid73-dev
RHDV_REPOURL=$REPOURL/jboss-datavirt-6-openshift-image
RHDV_BRANCH=datavirt64-dev
RHEAP_REPOURL=$REPOURL/jboss-eap-7-openshift-image
RHEAP_BRANCH=eap72-dev
RHPS_REPOURL=$REPOURL/jboss-processserver-6-openshift-image
RHPS_BRANCH=6.4.x
RHDS_REPOURL=$REPOURL/jboss-decisionserver-6-openshift-image
RHDS_BRANCH=6.4.x

function updateImagestreams () {
  TARGET_DIR=$1
  
  # change to a specific child directory
  cd $TARGET_DIR

  ISLIST=`ls *.@(json|yaml) | grep -v '/secrets/' | grep 'image-stream'`
  COUNT=`wc -l $ISLIST`
  if [ "$COUNT" -eq "0" ]; then
    echo "Unable to find any imagestreams in $TARGET_DIR"
    cd $CWD
    return
  fi

  # update the imagestreams
  for stream in $ISLIST ;
  do
    echo "updating imagestream ${stream}"
    # delete current imagestream
#    cat ${stream} | oc -n openshift delete -f -
    # create new imagestream
#    oc -n openshift create -f ${stream}
  done

  # reset the current directory to the parent directory
  cd $CWD
}

function updateTemplates () {
  TARGET_DIR=$1
  
  # change to a specific child directory
  cd $TARGET_DIR

  # get the list of template file names
  TEMPLATELIST=`ls *.@(json|yaml) | grep -v '/secrets/' | grep -v 'image-stream'`
  COUNT=`wc -l $TEMPLATELIST`
  if [ "$COUNT" -eq "0" ]; then
    echo "Unable to find any templates in $TARGET_DIR"
    cd $CWD
    return
  fi

  # delete any existing templates
  for template in $TEMPLATELIST ;
  do
    echo "deleting template ${template}"
#    cat ${template} | oc -n openshift delete template -f -
  done

  # create templates
  for template in $TEMPLATELIST ;
  do
    echo "creating template ${template}"
#    oc -n openshift create -f ${template}
  done

  # reset the current directory to the parent directory
  cd $CWD
}

# clone specific branches from the repos
git clone -b $RHEAP6_BRANCH $RHEAP6_REPOURL
git clone -b $RHDM_BRANCH $RHDM_REPOURL
git clone -b $RHPAM_BRANCH $RHPAM_REPOURL
git clone -b $RHSSO_BRANCH $RHSSO_REPOURL
git clone -b $RHJWS3_BRANCH $RHJWS3_REPOURL
git clone -b $RHJWS5_BRANCH $RHJWS5_REPOURL
git clone -b $RHAMQ_BRANCH $RHAMQ_REPOURL
git clone -b $RHDG_BRANCH $RHDG_REPOURL
git clone -b $RHDV_BRANCH $RHDV_REPOURL
git clone -b $RHEAP_BRANCH $RHEAP_REPOURL
git clone -b $RHPS_BRANCH $RHPS_REPOURL
git clone -b $RHDS_BRANCH $RHDS_REPOURL

# update the imagestreams and templates
updateImagestreams $(basename $RHEAP6_REPOURL)/eap
updateTemplates $(basename $RHEAP6_REPOURL)/eap
updateImagestreams $(basename $RHDV_REPOURL)/resources/openshift
updateTemplates $(basename $RHDV_REPOURL)/resources/openshift
updateImagestreams $(basename $RHDM_REPOURL)
updateTemplates $(basename $RHDM_REPOURL)/templates
updateImagestreams $(basename $RHPAM_REPOURL)
updateTemplates $(basename $RHPAM_REPOURL)/templates
updateImagestreams $(basename $RHSSO_REPOURL)/templates
updateTemplates $(basename $RHSSO_REPOURL)/templates
updateImagestreams $(basename $RHJWS3_REPOURL)/templates
updateTemplates $(basename $RHJWS3_REPOURL)/templates
updateImagestreams $(basename $RHJWS5_REPOURL)/templates
updateTemplates $(basename $RHJWS5_REPOURL)/templates
updateImagestreams $(basename $RHAMQ_REPOURL)/templates
updateTemplates $(basename $RHAMQ_REPOURL)/templates
updateImagestreams $(basename $RHDG_REPOURL)/templates
updateTemplates $(basename $RHDG_REPOURL)/templates
updateImagestreams $(basename $RHEAP_REPOURL)/templates
updateTemplates $(basename $RHEAP_REPOURL)/templates
updateImagestreams $(basename $RHPS_REPOURL)/templates
updateTemplates $(basename $RHPS_REPOURL)/templates
updateImagestreams $(basename $RHDS_REPOURL)/templates
updateTemplates $(basename $RHDS_REPOURL)/templates



