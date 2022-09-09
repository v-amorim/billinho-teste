Billinho
========

This is a Billinho's seed version, you can use it as a base or feel free to create your project from scratch. We used those technologies:

| Technology    | Version |
| ------------- | ------ |
| Ruby on Rails | 5.1.6  |
| PostgreSQL    | 9.6.10 |
| Ruby          | 2.4.2  |

Getting started
---------------

### Preparing your work environment
We recommend that you use a UNIX-like operating system, as a MacOS X or Ubuntu for developing this application.

First of all we will need to install Ruby. Let's use RVM to manage our ruby versions, RVM installation guide can be found here: https://rvm.io/rvm/install, it is a really simple, straightforward guide.

After RVM is installed, we can install Ruby 2.4.2 and set this version as default.
```bash
rvm install ruby-2.4.2
rvm --default use ruby-2.4.2
```

Now, to guarantee that ruby is installed we can type `ruby -v`, and we should get something like this, depending on your operating system:
```bash
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]
```

Now, let's install `bundle` and `rails`
```bash
gem install bundle
gem install rails
```

We are almost done, the last one is the database, we can install PostgreSQL here https://www.postgresql.org/download/ or if you are using Linux just execute the code below:
```bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
```

Last step is to configure a user and grant its permission in our database so the application can access it. First let's connect to psql:
```bash
psql -U postgres
```

Inside the database we need to create a new user for our application:
```sql
CREATE USER billinho WITH PASSWORD "billinho";
ALTER USER billinho CREATEDB;
```
### Starting the application

Lets create our database and run the migrations:
```bash
rails db:create
rails db:migrate
```

Install the project gems:
```bash
bundle install
```

To start the application:
```bash
rails s
```

Now your app should be running in `http://localhost:3000/`. If you access this in your brower you should see the rails default page.

Tests
-----

For test we are using the `rspec` gem. The tests can be found in `spec/` folder.

To run them just type `rspec` in the terminal.
