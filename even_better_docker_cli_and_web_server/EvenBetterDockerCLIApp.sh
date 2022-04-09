#!/bin/sh

<<COMMENT
Regular usage:
	docker run --rm docker/whalesay cowsay Hooray!
Write to file:
	docker run --rm docker/whalesay cowsay Hooray! >my_cowsay.txt
Read and write:
	docker run --rm docker/whalesay cowsay `cat input_for_cow.txt` >output_cow.txt
Notes
	https://stackoverflow.com/questions/35688407/piping-a-file-into-docker-run
	https://riptutorial.com/docker/example/10313/passing-stdin-to-the-container
	https://www.attosol.com/using-docker-for-distributing-command-line-tools/
COMMENT

# First, open docker and wait for it to start.
if (! docker stats --no-stream); then
  open -a Docker
printf "Waiting for Docker to launch..."
while [[ -z "$(! docker stats --no-stream 2> /dev/null)" ]];
  do printf ".";
  sleep 1
done
fi

if [ "$#" -eq  "0" ]
	then
		echo "Usage: EvenBetterDockerCLIApp.sh input_file_name output_file_name"
	else
  		input_file_name=$1
  		output_file_name=$2
  		# pull if needed.
		# maybe if-then this? https://stackoverflow.com/questions/30543409/how-to-check-if-a-docker-image-with-a-specific-tag-exist-locally
		docker pull docker/whalesay
		echo "input $1"
		echo "output $2"
		docker run --rm docker/whalesay cowsay `cat "$input_file_name"` >"$output_file_name"
fi