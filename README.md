Golang Gin gonic

Now that we are going to have to run two docker compose files we want to run in production 
We’re going to do the base docker compose plus the dev and then when we want to work in production we do the base plus the prod.
Docker-compose -f docker-compose.yml -f docker-compose.prod.yml down -v
Docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d —build

If we don’t want to mongodb production effect from build new code 

Docker-compose -f docker-compose.yml up -d —force-recreate service-name
Docker-compose -f docker-compose.prod.yml up -d —force-recreate —no-deps node-app


Change name of images
Docker image tag image-name network tag/ tag name
Docker push nes224/node-app

Improved Dockerhub workflow
	- How exactly do we push those changes ?
	- Build the whole docker image (all services) -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml build 
	- Build specific docker-compose -f docker-compose.yml -f docker-compose.prod.yml build node-app (node-app is the name of service)
	- push to docker hub specific image docker-compose -f docker-compose.yml -f docker-compose.prod.yml push node-app (node-app is the name of service)
	- ## docker-compose -f docker-compose.yml -f docker-compose.prod.yml up —help
	- update the node app -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d —no-deps node-app

Step by Step
	- Change something in the coding  
	- Once we make those changes we have to build an image -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml build node-app (node-app is specify just one service or one more service or all services)
	- Next thing we have to do we have to push this brand new image that we created to docker hub -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml push node-app (and once again we can push all of our images or just one image)
	- And so now once that’s pushed up there let’s go to our production server and then here we pull that brand new image -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml pull node-app (we specify just one image pull)
	- I only want to update my node or express application just in case because I don’t want to accidentally rebuild a database or my redid data store or any other important aspect of my application that doesn’t need updating -> docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --no-deps node-app