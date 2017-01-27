[ ![Build Status](https://app.codeship.com/projects/05f88220-bf12-0134-b657-7a625a3fabd4/status?branch=master)](https://app.codeship.com/projects/196490)
[![Code Climate](https://codeclimate.com/github/sehrmann/SchwamIt/badges/gpa.svg)](https://codeclimate.com/github/sehrmann/SchwamIt)
[![Coverage Status](https://coveralls.io/repos/github/sehrmann/SchwamIt/badge.svg?branch=master)](https://coveralls.io/github/sehrmann/SchwamIt?branch=master)

# SchwamIt

## Overview

[SchwamIt](schwamit.herokuapp.com) is a review site dedicated to topics from the 1990's.

Authors:

* Nick Asilo
* Nick Belanger
* Scott Ehrmann
* Yonatan Meschede-Krasa
* Sean Kalil

Reviewers:

* Nick Alberts
* Lily Barrett
* Amanda Beiner
* Jenn Eng
* Justin Huynh
* Eben Lowe
* Mike Thomson

##Features

This is a site based on user-generated content. All content is publicly available; visitors can see all content, but not submit items, reviews, or vote on reviews. Once a visitor has created an account, they are free to perform these actions.

The index page automatically updates to show newly posted content in real time.

Voting on reviews updates the reviews' score in real time, and reviews are reordered based on their score.

Admins can delete unwanted content as well as delete toxic user accounts.

Users are notified via email when their items have received a new review.

##Core Technologies

###Stack

* PostgreSQL
* ActiveRecord
* Ruby on Rails
* React
* Foundation

###Test

* RSpec
* Capybara
* Enzyme
* Karma
* PhantomJS
* Jasmine
* Coveralls
* Codeship
* CodeClimate
* FactoryGirl
* DatabaseCleaner

###Gems
* Devise
* CarrierWave
* ReCaptcha
* FontAwesome
