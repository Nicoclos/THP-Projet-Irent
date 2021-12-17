# iRent - the next big revolution in eshops universe !

**iRent** is a **Ruby On Rails** web application. It's a **renting platform between individuals** made by [Adrien](https://github.com/Adrien011), [Jordan](https://github.com/jordan-creyelman), [Juan](https://github.com/Ju4n-P), [Lionel](https://github.com/lionelcoding) and [Nico](https://github.com/Nicoclos).

It's the final project for The Hacking Project coding bootcamp, wxinter 2021 session .

## Where to find our application?

You can find our application on **Heroku**:

**Production version** -> [HERE](irent-project.herokuapp.com/)

## How to use the app?

This app is using **Ruby 2.7.4** and **Rails 5.2.6**.

This web app in RoR is using a list of **gems**, don't forget to run `bundle install` to create a `gemfile.lock` to store all dependencies that your app needed.

## Create and initialiaze the Database 

This app is using `PostgreSQL` for the Database.

When you __clone the app__ from this repository, you will have to create a **database**, run:

````ruby
rails db:create
````

Then you will have to upload the migrations by executing:

````ruby
rails db:migrate
````

All the **migrations** are going **up**. You can check it with:

````ruby
rails db:migrate:status
`````

Now you have **a functional Database** you can fill it.
If you don't want to fill it yourself, we made you a super Seed. You can fill you Database by running:

```ruby
rails db:seed
````
#### Now you are ready to get this machinery work!
