## Les prérequis

Ce qu'il faut installer sur votre machine pour que ce projet tourne :

- sqlite
- redis

## Installer le projet

Il suffit de lancer les commandes suivantes pour que les dépendances du projet
soient installées, et mettre en place la base de données :

```
bundle install
bin/rails db:migrate
```

## Lancer le projet

*Note* : Si vous n'avez pas l'intention de lancer la tâche Rake, vous pouvez
vous contenter de lancer le serveur.
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

## Mise à jour des données

Pour mettre à jour la liste des Pokemons (et de leurs types), il faut lancer la
commande suivante :

```
bin/rake pokemons:update
```

Cette tâche va aller chercher tous les pokemons disponibles sur PokeAPI et
mettre en file d'attente un job par pokemon. Pour voir l'avancée de la mise à
jour, vous pouvez donc consulter le dashboard de Sidekiq.

## TODO

- [] paginate pokemons index
- [] remove url attribute from pokemon in `pokemon/show/:id` because of the
    redundancy
