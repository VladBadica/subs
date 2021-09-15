# Surrey University Buy & Sell (SUBS)

## About
SUBS is a web application to allow Surrey University students to sell their unwanted goods. It was developed as part of a seven person, undergraduate group project using Ruby on Rails (a web framework that with an MVC architecture).

---

## Tester Manual
The project can either be run locally by downloading from [Github](https://github.com/vb00232/subs/archive/refs/heads/development.zip), run from a server on [Heroku](http://subs-heroku.herokuapp.com/) or it is available in a containerised form using Docker. Running locally is recommended to a demonstrate the project’s functionality as ElasticSearch/real time streaming we could not be integrated into Heroku as they are paid features.

<details open>
  <summary><b>Environment Setup For Running Locally</b></summary>

The following must be installed:
* Ruby Version 2.5.1
* Rails Version 5.2.3
* ElasticSearch 7.6.1
* MiniMagick

Run commands:
* `bundle install`
* `rake db:migrate`
* `sudo service elasticsearch start`
* `rake db:migrate`
* `rake db:seed`
* `rails s`

Browser:
* Open Chrome or Firefox
* Navigate to `localhost:3000`
  
</details>

<details open>
  <summary><b>Environment Setup For Running in a Containerised Form Using Docker</b></summary>

The following must be installed:
* Ruby Version 2.5.1
* Rails Version 5.2.3
* [Docker for desktop](https://www.docker.com/get-started)

Download the code using commands:
* `git clone -b docker-development --single-branch https://github.com/vb00232/subs.git`
* Make sure docker is running and go into folder where you cloned `docker-development`, then `cd` into subs
  
Then run commands:
* `docker-compose build`
* `chmod +x docker-entrypoint.sh` or equivalent
* `docker-compose run web bash`
* You will now be in root, first run `rake db:create`, then `rake db:migrate`, then `rake db:seed`
* Type exit should now be back in subs directory
* `docker-compose up web`
* Go to `localhost:3000` in Chrome web browser should all be there
* When you want to shut it all down `ctrl-c` to turn rails off then run `docker-compose down web`, then you can turn off docker
  
</details>

<details open>
  <summary><b>Test Data</b></summary>

12 test products with associated users and categories have been created that can be used during the test
scenarios. When running locally, they can be added to the application through the seeds file. Note that
MiniMagick must be installed when reading image files to set up the products. The seeds file must also be
run for categories to be added.
  
</details>

<br>
<br>

<div align="center">
  <img width=100 src="https://github.com/vb00232/subs/blob/development/app/assets/images/Icon.png">
</div>
