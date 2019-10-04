FROM debian:testing

RUN apt update && apt install -y build-essential libreadline-dev zlib1g-dev libbison-dev git flex openssh-server

RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser

RUN echo 'sshuser:pass' | chpasswd

CMD ["sleep", "infinity"] 