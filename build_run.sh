docker build . -t  docker-registry-default.origin.local/nodeapp:latest --label "foo=bar"

# Ricerca immagine appena costruita tramite label
docker images --filter "label=foo=bar"
# in futuro protrebbe servirci per questo: docker rmi $(docker images -f "dangling=true" -q)

# Ricerca immagine appena costruita tramite grp
docker images | grep nodeapp

# Esecuzione del container
# opzioni utilizzate
# -d eseguiamo in background
# -p pubblichiamo una porta tcp di un container in un host
# -e injection di variabili d'ambiente
# -h configurazione hostname
# -v aggiunge un volume
# -rm rimuove automaticamente il container se già esiste

docker stop nodeapp
docker run -d --rm --name nodeapp -v $PWD/conf:/opt/config/DATA -e VAR1=foo -e VAR2=bar -p 3000:8080 docker-registry-default.origin.local/nodeapp:latest


docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nodeapp
