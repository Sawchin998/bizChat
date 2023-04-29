# README

## Overview

bizChat is a messenger application built with Ruby on Rails with ruby version '3.1.3p185' and rails version '7.0.4.3'. It allows users to send messages to each other in real-time and view their conversation history. Users can also create groups for group messages.

## Installation

### To install bizChat, follow these steps:

  1.  Clone the repository: git clone git@git.bajratechnologies.com:j-23-01/sachin.git
  2.  Install dependencies: bundle install
  3.  Set up the database: rails db:migrate
  4.  Start the server: rails server

## Usage

### To use bizChat, follow these steps:

  1.  Sign up for an account or log in if you already have one.
  2.  Create a new conversation by searching name or email of reciever.
  3.  Create a new group and add members in group for group chat.
  4.  Send a message by typing it into the message input and pressing "send".
  5.  View your conversation history by selecting a conversation from the list of previous conversations.

## Configuration

### bizChat uses the following environment variables:

  1.  'SMTP_EMAIL': The email address that Action Mailer will use to send email from.
  2.  'SMTP_PASSWORD':  The password for the email address configured in the SMTP_EMAIL option. 

To set these variables, create a .env file in the root directory of the project and add the these env variables.

## Gems

### Beside the default gem used by rails projects, these gems are used:

  1. 'devise' : For user authentication and authorization.
  2. 'dotenv-rails': For environment variables setup.
  3. 'rspec-rails', 'factory_bot_rails', 'simplecov': For testing the project.


