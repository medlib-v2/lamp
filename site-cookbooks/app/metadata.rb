name              "app"
maintainer        "Patrick LUZOLO SIASIA"
maintainer_email  "luzolo_p@enta-alternance.net"
description       "Principal point de l'installation et la configuration de Medlib LAMP stack"
version           "1.0.0"

recipe "app", "Principal point de l'installation et la configuration de Medlib LAMP stack"

depends          "apache2"
depends          "apt"
depends          "build-essential"
depends          "dotdeb"
depends          "openssl"
depends          "composer"
depends          "git"
depends          "magento-toolbox"
depends          "mysql"
depends          "nodejs"
depends          "percona"
depends          "phing"
depends          "php"
depends          "python"
depends          "mailhog"
depends          "postfix"

%w{ debian ubuntu }.each do |os|
  supports os
end
