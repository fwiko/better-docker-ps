// Docker API endpoints supported by Podman's Docker API compatability layer -> see https://podman.io/blogs/2020/07/01/rest-versioning
package consts

// DockerAPIContainerList -> see https://docs.docker.com/engine/api/v1.41/#tag/Container/operation/ContainerList
const DockerAPIContainerList = "http://localhost/v1.54/containers/json"

// DockerAPIContainerInspect -> see https://docs.docker.com/engine/api/v1.41/#tag/Container/operation/ContainerInspect
// the single '%s' is replaced with the container ID
const DockerAPIContainerInspect = "http://localhost/v1.54/containers/%s/json"
