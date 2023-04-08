# jenkins
Test jenkins server

## Initial deploy
On first deploy exec into the container and run the following 
to add the Github server to the list of known hosts.
```
ssh -T git@github.com
```

## Jenkins Jobs
Uses the [Jenkins Jobs repo](https://github.com/mattnspa/jenkinsJobs) to 
define pipeline jobs

## Global functions
Uses the [Jenkins Library repo](https://github.com/mattnspa/jenkinsLibrary)
to define custom functions

## Extending Jenkins
The following API can be used to help define pipelines:
http://<<JENKINS-URL>>/plugin/job-dsl/api-viewer/index.html