Polecenie uzyte do zbudowania obrazu:
docker buildx build --build-arg VERSION=git --ssh veximek=C:\Users\vexim\.ssh\id_rsa --platform linux/amd64,linux/arm64 --cache-to=type=registry,mode=max,ref=veximek/zadanie1:cache --cache-from=type=registry,ref=veximek/zadanie1:cache -t docker.io/vexim/zadanie1:final --push .
do zbudowania obrazu potrzebny builder docker_container, w tym przypadku uzyty builder z lab7
polecenie do uruchomienia kontenera:
docker run -dt -p 3000:3000 vexim/zadanie1:final
Cache jest wysylany i wczytywany z vexim/zadanie1:cache
Pliki sa wczytywane z veximek/zadanie1 przez klucz ssh
Aby sprawdzic liczbe warstw nalezy uzyc docker history vexim/zadanie1:final
