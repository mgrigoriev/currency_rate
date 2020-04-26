# USD/RUB app (Q2)

Watch USD/RUB rate like a boss, without refreshing your browser.

Requirements
------------
* PostgreSQL
* Redis

Instructions
------------
```
git clone git@github.com:mgrigoriev/currency_rate.git
cd currency_rate

gem install bundler
gem install foreman

bundle install

rails db:create && rails db:migrate && rails db:seed

foreman start
```

Author
------
Mikhail Grigoriev, [mgrigoriev@gmail.com](mailto:mgrigoriev@gmail.com)
