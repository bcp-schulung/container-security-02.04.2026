docker build -t my-nginx:latest .
docker images
docker run -d -p 2222:80 --name my-nginx-container my-nginx:latest
curl http://localhost:2222
docker ps
docker exec -it my-nginx-container /bin/bash
cat /usr/share/nginx/html/index.html
apt update
apt install -y nano
nano /usr/share/nginx/html/index.html
exit
curl http://localhost:2222
docker stop my-nginx-container
docker rm my-nginx-container
docker run -d -p 2222:80 --name my-nginx-container my-nginx:latest
curl http://localhost:2222
docker ps
docker cp my-nginx-container:/usr/share/nginx/html/index.html ./index.html
cat index.html
docker tag my-nginx:latest registry.it-scholar.com/bencoeppicus/my-nginx:latest
docker push registry.it-scholar.com/bencoeppicus/my-nginx:latest
docker images