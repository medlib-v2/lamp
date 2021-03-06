#Medlib LAMP Stack

Medlib LAMP Stack est une configuration portable __Ubuntu Trusty64__ utilisant la technologie Vagrant, pour simplifier l'Installation d'un environnement de développement LAMP (Linux/Apache/MySQL/PHP) qui comprend également le module php-yaz.

## Configuration requise
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Berkshelf](http://berkshelf.com)
	* `gem install berkshelf`
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
	* `vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1'`
* [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager)
	* `vagrant plugin install vagrant-hostmanager`
* [vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)
	* `vagrant plugin install vagrant-omnibus`

# Installation

Dans le dossier lamp, lancez la commande 'vagrant up' qui va utiliser le fichier Vagrantfile pour télécharger automatiquement la box [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) via [Atlas Vagrant Box](https://atlas.hashicorp.com/boxes/search?utm_source=vagrantcloud.com&vagrantcloud=1).

  Les dossiers site-cookbooks & vagrant contiennent ici les fichiers de configuration de la box.

  Vous devez placer vos projets dans `répertoire projects`. Ce répertoire est synchronisé avec `répertoire /var/www/{projet}/public` dans la machine virtuelle.

Cette box vagrant est configuré pour utiliser '1024 Mo' de RAM et 1 CPU. Vous pouvez changer la configuration de Vagrantfile.

## Packages inclus

- Ubuntu Trusty64 (64-Bit)
- Apache 2
- PHP _v5.6.7_ with mysql, mcrypt, memcached, memcache, sqlite, xmlrpc, geoip gd, php5-fpm, php5-common
- MySQL _v6.1.2_
- Git _v1.9.1_
- Node _v0.10.38_
- Composer _v1.0.0-alpha9_
- NPM _v1.4.28_
- Bower _v1.3.12_
- Yaz _v4.2.30_
