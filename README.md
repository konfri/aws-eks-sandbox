# Build and deploy #

## Set up AWS EKS

```
cd infrastructure/terraform
aws configure
terraform init
terraform apply

# you might want to backup your ./kube/config file before you execute the next line
aws eks --region eu-central-1 update-kubeconfig --name $(terraform output cluster_name)
export ECR_URI=$(terraform output ecr-uri)

kubectl get all
```

## Build ##

```
./gradlew clean build
export BUILD_ID=$(uuidgen | tr 'A-Z' 'a-z')
docker build -t $ECR_URI:$BUILD_ID -f infrastructure/docker/Dockerfile .

```

## Deploy ##
push or run (locally)
```
aws --region eu-central-1 ecr get-login-password  | docker login  --password-stdin  --username AWS $ECR_URI:$BUILD_ID
docker push $ECR_URI:$BUILD_ID

docker run -p 8080:8080 $ECR_URI:$BUILD_ID
```

The application should be up on http://localhost:8080


```
cd infrastructure
envsubst < hackathon-deployment.yaml |kubectl apply -f -

kubectl get all
# use the load balancer entry for the curl
curl http://a9e9202ab474e4ecfb514582cf95a13b-662402173.eu-central-1.elb.amazonaws.com:8080
# should return -> {"value":"Hello World"}
```
