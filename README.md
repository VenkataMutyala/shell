Prerequisites:
- MacOS
- Docker Desktop
- ~/.ssh/id_ed25519 ssh key
- ~/.aws directory with config and credentials

```
docker build . -t shell
cd into-your-app-folder
docker run --privileged  -it -p 3000:3000 -v `pwd`:/home/workspace/dev -v `pwd`/.openvscode-server:/home/workspace/.openvscode-server  -v /var/run/docker.sock:/var/run/docker.sock -v ~/.ssh/id_ed25519:/home/workspace/.ssh/id_ed25519 -v ~/.aws:/home/workspace/.aws shell
```
