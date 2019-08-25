# NewFlandersServer

## Om de server zelf te runnen (eerste keer)
Open een cmd of Powershell (of andere, your pick) venster in de map waar je de server wenst op te slaan
Voor cmd/Powershell:
```
git clone https://github.com/Aurelien97/NewFlandersServer.git
cd NewFlandersServer
```

Run de server:
```
java -Xmx4096M -Xms1024M -jar minecraft_server.1.14.4.jar nogui
```
De parameter '-Xmx4096M' kan je aanpassen, dit regelt namelijk de hoeveelheid RAM die je toekent aan de server (4096M = 4Gb)

##  Om de server zelf te runnen (volgende keren)
Simpelweg een shell open doen in de map van de server en volgende commando's uitvoeren:
```
git pull
```
Nu is de server up to date en kan je hem runnen

## De server afsluiten
Om de server af te sluiten ga je naar de shell waar de server draait en typ je
```
exit
```

Daarna open je een shell in de map van de server en voer je volgende commando's uit:
```
git add .
git commit -am "'message'"
```
Waar je 'message' vervangt door bv datum en naam.
Dan:
```
git push -u origin master
```
Op die manier staan de veranderingen aan de server online en kan iedereen de laatste versie downloaden! :)


## Spelen op de server
Open Hamachi en kopieer je IPv4-adres. In Minecraft, direct connect naar die IPv4-adres. Congratz, you're in ;)
