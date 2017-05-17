# OpenShift Template for triggering a Docker container build

The template asks for 2 parameters 
  SOURCE_REPOSITORY_URL - pointing to accessible GIT repository container Dockerfiles and required artifacts
  OBJECT_NAME_PREFIX - the container to be built; available options are "kafka" and "zookeeper"
  