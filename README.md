# ashbox

`ashbox` provides a Docker image for reproducing the results of the [ash](https://github.com/stephens999/ash/) project and running [ashr](https://github.com/stephens999/ashr/).

## Running

* [Install Docker](https://docs.docker.com/installation/).

* Download the ashbox Docker image and run a container named `ashbox0`:

        docker pull road2stat/ashbox
        docker run -d -p 8787:8787 --name ashbox0 road2stat/ashbox

* Go to [http://localhost:8787](http://localhost:8787), use `rstudio`/`rstudio` to log in to the RStudio Server. Compile and interact with the R Markdown documents in the ashbox folder.

## Cleaning

* To stop and remove the running container `ashbox0`:

        docker stop ashbox0
        docker rm ashbox0

* To remove the `ashbox` image:

        docker rmi road2stat/ashbox
