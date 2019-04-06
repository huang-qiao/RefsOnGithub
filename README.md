## EasyGrok = docker + opengrok + vcs-tools

This project simplifies the procedure to setup opengrok for source code navigation.

#### dependencies
1. git
2. python-vcs
3. docker-ce

#### usage:
##### 1. download target repositories to opengrok/src
    git clone <repo_url> opengrok/src/<target_folder>
##### 2. build docker image (only need to do once on each machine)
    ./build_docker.sh
##### 3. run docker image
    ./run_docker.sh
##### 4. browse the repositories on http://localhost:8080/source

#### branches:
- master: commits related to opengrok and docker
- develop: updating source repositories list (for my personal use, checkout this branch if you're interested what I'm currently studying)
