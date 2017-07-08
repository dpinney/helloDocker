### Goal

Get a server in place that allows deployment of many small web apps at a reasonable annual price ($500/year tops).

And it appears that redundant globally-distributed container swarms are here to stay. So I might as well learn one of those stacks.

### Task List (XXX = Done, OOO = Todo)

XXX EC2 Docker support? Good. Install docs: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

XXX How much power can I rent for $500/year? An M4 large, 2 vCPUs and 8 GB of RAM, http://www.ec2instances.info/?min_memory=2&min_vcpus=2&cost_duration=annually&reserved_term=yrTerm1Standard.allUpfront&selected=m4.large

XXX User interfaces I want? Web. Maybe iPython (superset of web).

XXX The Docker macOS app? It passes the sniff test. Only 200 MB which is good; I was worried there would be 20 GB of VM and other junk. Download site: https://store.docker.com/editions/community/docker-ce-desktop-mac

XXX Intro tutorial for mac https://docs.docker.com/docker-for-mac/. Not a lot of useful info.

XXX Read a real intro. https://docs.docker.com/get-started/

XXX How to save an image to files? `docker save imageName > whatever.tgz` and then `docker load whatever.tgz`

XXX How to get a shell in to a container? `docker exec -it containerIdOrName bash`

XXX Look at https://sandstorm.io? Container framework, but too much GUI app focus.

XXX http://play-with-docker.com/. Easier to just use the laptop.

XXX What apps to start with? Static website. Web app with a form. SomethingThatRunsRepeatedly.

XXX Static website? Up and running in staticsite dir. Change the default index.html? Done. Also added some nice stop/start scripts.

XXX What about a small Python image? python:alpine is great. 100 MB. Runs flask.

XXX Web app with form? flaskdoc up and running. Maybe do it via a CGI script. nginx doesn't have an easy CGI interface. So we went with Flask.

OOO Something that runs on a timer? https://stackoverflow.com/questions/474528/what-is-the-best-way-to-repeatedly-execute-a-function-every-x-seconds-in-python

OOO Is this really portable to Windows? Move and test on a VM.

OOO Make sure Python scripts survive as services? Probably better to use built in restart. https://blog.codeship.com/ensuring-containers-are-always-running-with-dockers-restart-policy/

OOO Test out deployment to Docker host in production.

OOO What about data volumes and updates to them and/or the data container pattern?

OOO How to better manage secrets?

OOO https://stackoverflow.com/questions/4705564/python-script-as-linux-service-daemon

OOO https://stackoverflow.com/questions/1612733/including-non-python-files-with-setup-py

OOO Maybe we made the wrong platform choice?
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+rkt&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+apache+mesos&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+kubernetes&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+vagrant&ie=UTF-8&oe=UTF-8