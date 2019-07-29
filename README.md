# xpaas-scripts
Utility scripts for Red Hat Openshift middleware containers

---
## update-xpaas.sh 
Used to update the imagestreams and templates for Red Hat middleware container images.

### Configuration
- `REPOURL` - defaults to the Github repository for the Red Hat JBoss middleware images
- `RHEAP6_REPOURL` - defaults to the Github repository for the JBoss EAP 6.4.x Openshift image
- `RHEAP6_BRANCH` - branch used to clone the imagestreams and templates for JBoss EAP 6.4.x
- `RHDM_REPOURL` - defaults to the Github repository for the Red Hat Decision Manager Openshift image
- `RHDM_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Decision Manager
- `RHPAM_REPOURL` - defaults to the Github repository for the Red Hat Process Automation Manager Openshift image
- `RHPAM_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Process Automation Manager
- `RHSSO_REPOURL` - defaults to the Github repository for the Red Hat Single Sign On Openshift image
- `RHSSO_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Single Sign On
- `RHJWS3_REPOURL` - defaults to the Github repository for the Red Hat JBoss Webserver 3 Openshift image
- `RHJWS3_BRANCH` - branch used to clone the imagestreams and templates for Red Hat JBoss Webserver 3
- `RHJWS5_REPOURL` - defaults to the Github repository for the Red Hat JBoss Webserver 5 Openshift image
- `RHJWS5_BRANCH` - branch used to clone the imagestreams and templates for Red Hat JBoss Webserver 5
- `RHAMQ_REPOURL` - defaults to the Github repository for the Red Hat AMQ Openshift image
- `RHAMQ_BRANCH` - branch used to clone the imagestreams and templates for Red Hat AMQ
- `RHDG_REPOURL` - defaults to the Github repository for the Red Hat Datagrid Openshift image
- `RHDG_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Datagrid
- `RHDV_REPOURL` - defaults to the Github repository for the Red Hat Datavirt Openshift image
- `RHDV_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Datavirt
- `RHEAP_REPOURL` - defaults to the Github repository for the Red Hat JBoss EAP 7 Openshift image
- `RHEAP_BRANCH` - branch used to clone the imagestreams and templates for Red Hat JBoss EAP 7
- `RHPS_REPOURL` - defaults to the Github repository for the Red Hat Process Server 6 Openshift image
- `RHPS_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Process Server 6
- `RHDS_REPOURL` - defaults to the Github repository for the Red Hat Decision Server 6 Openshift image
- `RHDS_BRANCH` - branch used to clone the imagestreams and templates for Red Hat Decision Server 6


### Running
This script should be executed as an Openshift user that has `system:admin` or cluster admin privileges.  The script uses the Openshift command line client and git. 

---
