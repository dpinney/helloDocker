### Goal

Get a server in place that allows deployment of dozens of small web apps at a reasonable annual price ($500/year tops).

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

XXX Something that runs on a timer? monitorliz. Look at docs. sched library looked promising, but multiprocessing or threading is a better solution. Went with threading.

XXX Is this really portable? Move and test on a Windows VM. Doesn't work because it wants to use Hyper-V, VMWare will let it try, but then Docker crashes. What about an Ubuntu VM? Works like a champ.

XXX Make sure Python scripts survive as services? https://stackoverflow.com/questions/4705564/python-script-as-linux-service-daemon. Probably better to use built in Docker restart. https://blog.codeship.com/ensuring-containers-are-always-running-with-dockers-restart-policy/ We should test with a crasher route, have some state on the box. Seems like this isn't an issue because we can mount the stopped container. https://github.com/jpetazzo/nsenter/issues/27

XXX Test out deployment to Docker host in production. SSH in and pull? Yeah. It means the monitoring tools are identical to the ones in the dev environments (docker ps, docker start, etc.). Works great after fixing the AWS firewall.

OOO What about data volumes and updates to them and/or the data container pattern?

OOO https://stackoverflow.com/questions/1612733/including-non-python-files-with-setup-py

OOO How to better manage secrets?

XXX Maybe we made the wrong platform choice? Nah, Docker's fine.
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+rkt&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+apache+mesos&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+kubernetes&ie=UTF-8&oe=UTF-8
https://www.google.com/search?client=safari&rls=en&q=getting+started+with+vagrant&ie=UTF-8&oe=UTF-8