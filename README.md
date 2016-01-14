Piggybak Demo
========

* The Piggybak demo is a Rails application that uses Piggybak, and the supported Piggybak plugins (taxonomy, variants, coupons, bundle_discounts, giftcerts).

* The Piggybak demo includes a PostgreSQL database dump (sample.psql) that can be loaded in place of fixtures / seed data. Note that the demo does not include seed data for other database types.

* To install, clone the repo, create a config/database.yml (based on config/database.yml.example) to connect to your database. If you are running PostgreSQL, load the data into your database by running sample.psql. Then start your server, via "rails server".


Other Resources
========

* Refer to the <a href="https://github.com/piggybak/piggybak">Piggybak repository</a> for documentation.

* Refer to the <a href="https://github.com/piggybak">Piggybak GitHub account</a> for a full list of supported plugins.

Copyright (c) 2016 End Point & Steph Skardal. See LICENSE.txt for further details.
