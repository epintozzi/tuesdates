# README

Tuesdates uses the Yelp API to make restaurant
recommendations based on a user search and send invitation alerts via
email using Sendgrid. This was a solo project that I managed from the
wireframe/mockup phase through deployment.

Production App: [https://tuesdates.herokuapp.com/](https://tuesdates.herokuapp.com/)

Ruby Version: 2.3.1
<br>
Rails Version: 5.0.0.1

#### Setup

To run this project:

```
git clone git@github.com:epintozzi/tuesdates.git
cd tuesdates
bundle install
rake db:create db:migrate
rails s
```

#### Testing

This project uses RSpec for testing and can be run with the command `rspec`
<br>
You may need to `rake db:test:prepare` before running the tests.
