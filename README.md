# K8s basics

*Based on the project of the Microservices Intro educational program: 
https://learn.epam.com/catalog/detailsPage?id=550944b4-72c9-4c2d-93ef-545b6e569f61*

### Pre-requisites:
0. Install [Rancher Desktop](https://docs.rancherdesktop.io/).
1. Build executable jar-files for all projects (gradle-modules):
  - **eureka** - this service will not be needed for K8s experiments;
  - **songs-service**;  
  - **resource-service**;  

In order to do this, being in the project's root folder run command in the Terminal:  
```
.\gradlew bootJar 
```
Locations of respective bootable jars:
  - **eureka** - eureka/build/libs/eureka-1.0-SNAPSHOT.jar;
  - **songs-service** - songs-service/build/libs/songs-service-1.0-SNAPSHOT.jar;
  - **resource-service** - resource-service/build/libs/resources-service-1.0-SNAPSHOT.jar;

3. Build Docker images from respective Dockerfiles:
  - **songs-service** ```docker build -t experimentalmicroservice-1-songs-ms:1.0 .```
  - **resource-service** ```docker build -t experimentalmicroservice-1-resources-ms:1.0 .```  
*NB: The final ```.``` in the command provides the path or URL to the build context.  
At this location, the builder will find the Dockerfile and other referenced files.*  
Refer to: 
[Docker:build-tag-and-publish-an-image](https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/).  

When docker-image is built it is stored in the local image registry supplied by [Docker Moby](https://github.com/moby/moby),  
that is a part of [Rancher Desktop](https://docs.rancherdesktop.io/#container-management):  
Components include container build tools, a **container registry**, orchestration tools, a runtime and more,  
and these can be used as building blocks in conjunction with other tools and projects.  
This is a crucial because kubernetes requires docker-images for all components, it deploys in a cluster,  
that without **local image-registry** have to be pushed into the remote Docker Hub or another image-registry system, e.g. AWS ERC.

![screenshot1.jpg](screenshot/screenshot1.jpg)
4. Related to K8s tasks could be found [here](https://git.epam.com/epm-cdp/global-java-foundation-program/java-courses/-/blob/main/kubernetes-for-devs/1-k8s-overview/task/README.md)  
  4a.[Sub-task 1: Install k8s](https://git.epam.com/epm-cdp/global-java-foundation-program/java-courses/-/blob/main/kubernetes-for-devs/1-k8s-overview/task/README.md#sub-task-1-install-k8s).  
   The completion of this task is obvious.  
  4b. [Sub-task 2: Deploy containers in k8s](https://git.epam.com/epm-cdp/global-java-foundation-program/java-courses/-/blob/main/kubernetes-for-devs/1-k8s-overview/task/README.md#sub-task-2-deploy-containers-in-k8s).  
   The required k8s component deployment configuration located in the ```k8s/simple/deployment``` folder.  
   It contains **Namespace** configuration, database **Deployment** configuration as normal pod + respective **ConfigMap** and **Secret**,
   microservice **Deployment** configuration as pod respective **ConfigMap** and **Secret**. 
   Here **ConfigMap** and **Secret** are created per a **namespace**.
The deployment result is represented on the screenshot below
![screenshot2](screenshot/screenshot2.jpg).
5. 

