docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post advu/post:1.0
docker run -d --network=reddit --network-alias=comment advu/comment:1.0
docker run -d --network=reddit -p 9292:9292 advu/ui:1.0
