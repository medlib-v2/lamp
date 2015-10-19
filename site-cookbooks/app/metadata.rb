name              "app"
maintainer        "Patrick LUZOLO SIASIA"
maintainer_email  "luzolo_p@enta-alternance.net"
description       "Principal point de l'installation et la configuration de Medlib LAMP stack"
version           "1.0.0"

recipe "app", "Principal point de l'installation et la configuration de Medlib LAMP stack"

depends "apache"
depends "dotdeb"
depends "php"
depends "apt"
depends "openssl"
depends "mysql"

%w{ debian ubuntu }.each do |os|
  supports os
end
