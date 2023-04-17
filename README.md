# Tabletop-api

#### Tabletop-api

#### By Kyle Kay-Perez

#### Shortcuts
- [Technologies Used](#technologies-used)
- [Description](#description)
- [Setup/Installation Requirements](#setup/installation-requirements)
- [License](#license)
- [Contact Information](#contact-information)


## Technologies Used

* [Ruby](https://www.ruby-lang.org/en/)
* [Postgresql](https://www.postgresql.org/)
* [Rails](https://rubyonrails.org/)
* [Ruby Gems](https://rubygems.org/)
* [Postman](https://www.postman.com/)

## Description

This is an API that joins with [Tabletop-Management-App](https://github.com/professional-pigeon/Tabletop-Management-Tool) in order to create a robust TTRPG campaign management app.

## Setup/Installation Requirements

* Ruby 3.1.2 is required, follow the download instructions here [Ruby](https://www.ruby-lang.org/en/)
* Rails 7.0.4 is required, follow install instructions here [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html)
* Install bundler in your terminal with "gem install bundler"
* Install postgres if not already installed and run the terminal command "postgres" to open a SQL server, or attach to postgresSQL 14 server on computer.
* Download code database from github repository[Park API](https://github.com/professional-pigeon/Parks-API)
* Navigate to the top level of the directory and run "bundle install" in your terminal to install dependencies
* Run "rake db:create" and then "rake db:migrate" to create a database and migrate tables.
* To use effectively also download and run [Tabletop-Management-App](https://github.com/professional-pigeon/Tabletop-Management-Tool) Or open an app like Postman and make requests to the rails server you started (localhost:3000 is the default and is referenced in the documentation below)
  - [Instructions for request types](#api-documentation)

## License

MIT License

Copyright (c) Kyle Kay-Perez 2021

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contact Information

Kyle.KayPerez@gmail.com
