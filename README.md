## Week 9 Project
# Docker

### Running the Weight Tracker application inside a Docker Container on a virtual machines.
</br>

## Prerequisites for the project

- __IaC with Terraform- Provisioning of two identical environments : [Week 6 project](https://github.com/Ilankulikov/Terraform-project-for-Ansible) .__


- __Node Weight Tracker - The Bootcamp application which you can find [here](https://github.com/Ilankulikov/bootcamp-app) .__


Project environment:

![week-6-envs]()

__In this project I implemented a CI/CD piplines as code.
To do so first I've created a new pipline, then selected my project repository and then selected a Docker template to connect my `Azure Container Registry` with the pipeline.__

![build and push]()

In addition, I followed the 'feature branch workflow' by adding a branch policy for the master branch: __*any change need a code review and build validation before integrating them to the master branch.*__

![branch policy]()

I used 2 environments (staging / production) with their resources to target the deployments from the pipline.

![environments]()

## Continuous Integration

When there is any change in the feature branch the CI process builds a Docker Image.

__Only__ when a feature branch integrated to the master branch the CI process get back into action and in addition to building a new image pushes the image to the Azure Container Registry.


## Continuous Deployment and Continuous Delivery

The continuous deployment and continuous delivery pipelines are similar except that the continuous delivery requires manual approval.

To make the continuous delivery pipline wait for approval I chose the environment I want and then `Approvals and checks > Add check > Approvals`.

Once a change pushed to the master branch the CD pipelines stops and deletes the old container and then starting running a new one by __pulling the latest image from the Azure Container Registry__.

The `run` command is executed with the environment variables passed to it directly from the variable group in the library.

![variable groupp]()
