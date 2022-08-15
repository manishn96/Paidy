# Devops Assignment
## Installation

```bash
sudo apt update
sudo apt-get install
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   11    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
docker --version
chmod 777 /var/run/docker.sock
sudo chmod 777 /var/run/docker.sock
```

### Login to AWS ECR

```bash
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 451179339596.dkr.ecr.ap-northeast-1.amazonaws.com
```


### Sphinx docs in Docker



```bash
docker image ls
docker build -t paidytest .
docker tag paidytest:latest 451179339596.dkr.ecr.ap-northeast-1.amazonaws.com/paidyr
docker push 451179339596.dkr.ecr.ap-northeast-1.amazonaws.com/paidyrepo:latest
mkdir docs
```

Then run the following docker command

```bash
docker run -d  -v /home/ubuntu/docs:/docs:/docs -p 80:8000 paidytest
```

This creates a docker container that mounts the `docs` directory to `/docs` (where the documentation is expected to be). Use `docker ps` to find the ID of the newly created container. Then initiate the documentation with the following command 

```bash
docker exec -it 544bdeb2984c sphinx-quickstart
docker exec -it 544bdeb2984c  sphinx-apidoc -o . mymodule
docker exec -it 544bdeb2984c  make html
```

Once the setup is done, restart the sphinx container

```bash
docker container restart 544bdeb2984c
```

Open a browser and navigate to `http://18.183.53.199/paidy_super_ai.html#paidy_super_ai.calculate_risk_score

### whitelist provided ip addresses
We can whitelist provided ip address 60.125.0.0/16 and 152.165.0.0/16 by creating rule inside security group on your AWS VPC 

![image](https://user-images.githubusercontent.com/31979011/184686838-cb342038-170c-4480-b54f-b559b3c10d96.png)
