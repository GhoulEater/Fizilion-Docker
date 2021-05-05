#base image
FROM fedora:34

#packages list update
RUN dnf -y install \
    curl git openssl postgresql postgresql-devel python3 python3-pip python3-devel sqlite tar neofetch wget xz zip

#fusion
RUN dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
&& dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#fizilion
RUN dnf -y install \
    aria2 chromium ffmpeg figlet gcc gzip

#pip3
ADD https://raw.githubusercontent.com/PrajjuS/ProjectFizilion/Demon/requirements.txt requirements.txt 
RUN pip3 install -U pip setuptools wheel && pip3 install --no-cache-dir -r requirements.txt && rm requirements.txt

#finalization
CMD ["python3"]
