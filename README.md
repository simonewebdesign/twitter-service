# Twitter Service

This is a Ruby on Rails app that communicates with a Twitter-like RESTful web service.


## Getting started

Four steps:

1. Clone or fork the repository as usual.

2. `cd` into the project folder and run `bundle install`.

3. Create a PostgreSQL database using `bundle exec rake db:create db:migrate`.

4. Run `rails s` to start the application.


### Requirements

You should have at least Ruby 2.1 installed on your machine, because it's needed by Rails (4.2.0.rc1) for the ActiveJob functionality.

You should also have PostgreSQL 9.3.x running in background. 


### Troubleshooting

Depending on your OS you may have to create a new role with the same name of your user. To do this, you can do it via `psql`:

```
sudo -u postgres psql
create role YOUR_ROLE_NAME login createdb; -- should be the same name of your user
```

### Running the test suite

We use [RSpec](https://github.com/rspec/rspec) for testing. Run the specs with `rspec spec` or `bundle exec rake` or just `rake`. You can also run a single spec using e.g. `rspec spec path/to/spec.rb`.


### Retrieving the data that the app stores

You can use the [ActiveRecord Query Interface](http://guides.rubyonrails.org/active_record_querying.html) to get all the data (e.g. via `rails console`), depending on your needs. If you want to export all the SQL data you can [follow this tutorial](http://help.ninefold.com/getstarted/exporting_and_importing_postgresql_data/), or if you are running OS X you can use [PGAdmin](http://www.pgadmin.org/).

---

The MIT License (MIT)

Copyright (c) 2014 Simone Vittori

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
