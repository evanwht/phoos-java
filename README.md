# Phoos-Java
[![CI](https://github.com/evanwht1/phoos-java/workflows/CI/badge.svg)](https://github.com/evanwht1/phoos-java/actions)

A foosball score tracking web server implemented in java and react. This will track very basic information
about foosball games (scores and players). As of right now it assumes a specific set of rules are followed:
1) 4 players, split into 2 teams
2) Each player plays half the game on offense and half on defense
    - players can choose where they start but must stay on their side until half time
3) Games are played to 10 points, switching sides once a team reaching 5 (half time)
4) Win by 2 up to 15

## Installation

You can run this web server with docker or docker-compose.
___
To run with docker compose run 
```bash
$ docker-compose -f docker/docker-compose.yml -f docker/docker-compose.latest.yml up -d
```
___
To run with docker you need to start the db first and then start the server.
```bash
$ docker build -t phoos-db docker/db/
$ docker network create phoos-network
$ docker run -d --name phoos-db --expose 3306 --network=phoos-network phoos-db
$ docker run -t -p 8080:8080 --network=phoos-network evanwht/phoos-javalin:latest
```
In order to interact with the db locally with a database management tool you can replace `--expose 3306` with `-p 3306:3306`

## Development
After making changes to either the ui or the javalin server, you can build your changes into a new
docker container and run locally to test out your changes. Running `gradle build` from the top-level
package will run `npm install`, `npm build`, copy the build artifacts to app/src/main/resources/public, 
and build the javalin server. In order to dockerize the web server, run `gradle jibDockerBuild`. This will
build the javalin server into a docker image and load it to your local docker daemon. Alternatively you
can run `gradle jibBuildTar` to build a tar ball of the docker image and then `docker load` to load it
into a separate docker daemon. Stop any running javalin containers and replace with your newly built
image.
- `gradle jibDockerBuild`
    - jib tags the image with the current project version by default. This can be overridden by running `gradle jibDockerBuild -Djib.to.tags='my-tag'`.
- `docker run -t -p 8080:8080 --network=phoos-network evanwht/phoos-javalin:{version}`
    - replace {version} with project version or whatever custom tag you used.
- `docker-compose -f docker/docker-compose.yml up -d phoos-javalin`
    - You will need to modify the compose file if you used a custom tag.
