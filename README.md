# DogHeroWeb

## Requirements

* Port 3000 should be available in your computer.
* Docker ([install](https://docs.docker.com/install/))
* Docker Compose ([install](https://docs.docker.com/compose/install/))
* DogHeroWeb ([install](https://github.com/rafaelbcerri/dog-hero-web))

## Setup

```sh
$ git clone https://github.com/rafaelbcerri/dog-hero-api
$ cd dog-hero-api
$ docker-compose build
$ docker-compose run api bundle exec rails db:setup
```

## Start application

```sh
$ docker-compose up
```

Do not forget to run [DogHeroWeb](https://github.com/rafaelbcerri/dog-hero-web)

## Run tests

```sh
$ docker-compose run api bundle exec rspec spec
```

## Generate api docs

```sh
$ docker-compose run api bundle exec rails docs:generate
```