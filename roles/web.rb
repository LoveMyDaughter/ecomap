name 'web'
description 'Apache Server'
run_list(
      "recipe[apache2]",
      "recipe[apache2::mod_wsgi]"
    )
default_attributes(
      "apache" => {
        "listen" => ["*:80", "*:443"]
      }
    )

