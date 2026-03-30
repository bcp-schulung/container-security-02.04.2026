sudo docker run -d -p 80:80 nginx
sudo docker ps -a
curl http://localhost
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)