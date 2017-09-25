# README
# BOOKSTORE
<!-- # [Homepage](http://) -->


## Getting Started

Para começar a usar este projeto, siga as intruções abaixo:
* Clone o repsitório: `git clone https://github.com/pedRo-shd/Sistema-Web-Classificados.git`

Dependências:
* RVM (https://rvm.io/rvm/install)

* Ruby: 2.4.1
  ```
  rvm install ruby 2.4.1
  rvm use ruby 2.4.1
  ```

* ImageMagick (https://www.imagemagick.org)
  ```
  sudo apt-get update
  sudo apt-get install imagemagick
  ```

* Rode
  ```
  bundle
  rails db:create db:migrate
  ```

* Para logar como administrador da Bookstore
  ```
  rails db:seed
  ```
  login:    admin@bookstore.com.br
  password: testeteste
