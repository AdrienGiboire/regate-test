## Les prérequis

Ce qu'il faut installer sur votre machine pour que ce projet tourne :

- sqlite
- redis

## Installer le projet

Il suffit de lancer la commande suivante pour que les dépendances du projet
soient installées :

```
bundle install
```

## Lancer le projet

Ce projet utilise Sidekiq, qui dépend de Redis. Donc avant de pouvoir faire
tourner l'ensemble du projet, il faut lancer ces deux services :

```
$ redis-server [--daemonize yes]
$ bundle exec sidekiq
$ bin/rails s
```

Maintenant, vous pouvez accéder au dashboard de Sidekiq :
http://localhost:3000/sidekiq

Et consommer l'API : http://localhost:3000/api/pokemons
