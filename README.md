# xpaas-scripts
Utility scripts for Red Hat Openshift middleware containers

---
## update-xpaas.sh 
Used to update the imagestreams and templates for Red Hat middleware container images.

### Configuration
- `REPOURL` - defaults to the Github repository for the Openshift application templates
- `TAG` - used to determine the version of the imagestreams and templates to get

### Running
This script should be executed as an Openshift user that has `system:admin` or cluster admin privileges.  The script uses the Openshift command line client and git. 

---
