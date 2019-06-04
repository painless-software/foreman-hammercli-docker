# hammercli-docker
Dockerfile for [hammer-cli](https://github.com/theforeman/hammer-cli) with foreman plugin installed

## Build
```
docker build -t hammer .
```

## Run
### Show available commands
```
docker run -it --rm hammer --server https://foreman.local --verify-ssl false --help
``` 
### Get Host details
```
docker run -it --rm hammer --server https://foreman.local --username admin --verify-ssl false host info --name my-host.local
```