# K8s basics
## Module 4: Network and Ingress in Kubernetes

### Pre-requisites:
#### 0. Install [Rancher Desktop](https://docs.rancherdesktop.io/).
#### 1. Build executable jar-files for all projects (gradle-modules):
- **eureka** - this service will not be needed for K8s experiments;
- **songs-service**;
- **resource-service**;

To do this, being in the project's root folder, run the command in the Terminal:
```
.\gradlew bootJar 
```
Locations of respective bootable jars:
- **eureka** - eureka/build/libs/eureka-1.0-SNAPSHOT.jar;
- **songs-service** - songs-service/build/libs/songs-service-1.0-SNAPSHOT.jar;
- **resource-service** - resource-service/build/libs/resources-service-1.0-SNAPSHOT.jar;

#### 3. Build Docker images from respective Dockerfiles:
- **songs-service** ```docker build -t experimentalmicroservice-1-songs-ms:1.0 .```
- **resource-service** ```docker build -t experimentalmicroservice-1-resources-ms:1.0 .```  
  *NB: The final ```.``` in the command provides the path or URL to the build context.  
  At this location, the builder will find the Dockerfile and other referenced files.*  
  Refer to:
  [Docker:build-tag-and-publish-an-image](https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/).

When docker-image is built, it is stored in the local image registry supplied by [Docker Moby](https://github.com/moby/moby),  
which is a part of [Rancher Desktop](https://docs.rancherdesktop.io/#container-management):  
Components include container build tools, a **container registry**, orchestration tools, a runtime, and more,  
and these can be used as building blocks in conjunction with other tools and projects.  
This is crucial because kubernetes requires docker-images for all components, it deploys in a cluster,  
that without **local image-registry** have to be pushed into the remote Docker Hub or another image-registry system, e.g. AWS ERC.

![Mudule4_Pre_requisit_1.jpg](screenshot/Mudule4_Pre_requisit_1.jpg)

#### 4. **K8s module 4 "Ingress" tasks**
    - Install ingress controller using helm chart. (guide)
    - Change Services type to ClusterIP to restrict external access.
    - Create ingress resource and route your traffic using rules.
    - Configure rewrite-target of path using annotations. Example routing: from http://localhost:8080/api/v1/songs to http://songs:8080/api/v1.
([ref docs](https://kubernetes.github.io/ingress-nginx/examples/rewrite/#rewrite-target)).


#### WORK IN PROGRESS...

#### At this point, Module 4 could be considered as resolved.