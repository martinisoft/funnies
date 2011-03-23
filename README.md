## Funnies

Read your favorite Web Comics on one page, just like a Newspaper.

### Why?

I love reading my web comics every week. In real life I have a newspaper
with it all in one section.  Why not online? RSS Feeds are useless
because you have to separartely go to each page for updates.

### Requirements

Ruby 1.9.2-p180 (I live dangerously on the edge)
Ruby on Rails 3.0.5
PostgreSQL Database (this can be changed, see database.yml.example)
Nokogiri Gem (scrapes all the comic image data)
Some XPath Skills (this app uses XPath to locate image data)

### Installation

This app uses a separate appconfig.yml file to store the pepper and secret
token keys for security reasons. Before you can run the server (even locally)
you'll need to copy over the appconfig.yml.example file:

<code>
  cp config/appconfig.yml.example config/appconfig.yml
</code>

You'll also need to setup your database settings via the database.yml.example
file in the config directory.

<code>
  cp config/database.yml.example config/database.yml
</code>

If you're not using PostgreSQL, you'll need to also modify the Gemfile with
your database gem of choice along with modifying the contents of the
database.yml file.

### Deployment locations

Staging: [http://staging.funniesapp.com](http://staging.funniesapp.com)

Production: [www.funniesapp.com](http://www.funniesapp.com)

### Production Stack

Funnies runs on a Linode 512 out of Dallas (more central location)

OS: Ubuntu 10.04 LTS (I like apt)

App Server: nginx (with passenger)

Database: PostgreSQL 8.4

### Contribute:

I publicly storycarded this app at [Pivotal Tracker](https://www.pivotaltracker.com/projects/201253)

Any issues can be reported to the [Github Issues Tracker](https://github.com/martinisoft/funnies/issues)

Generally, the master branch won't be too far ahead of staging and is where you
should start with patches. Here's the process:

* Fork this repo
* Make your changes
* Add test coverage (and make sure the current tests pass)
* Send a pull request

Make sure your patch includes tests or there is a *strong* chance the request
will get closed.

Design help would be *awesome*!

### Special Thanks:

*BIG* Thanks go to [Hashrocket](http://www.hashrocket.com/) for accepting me
as an Apprentice Developer in their Chicago office. Finally getting to do what
you love (and get paid for it) is amazing.

[Mark James](http://famfamfam.com/) aka FamFamFam for the awesome Silk icons.

### Contributors: (Helped patch or paired with me)

* [Joshua Davey](http://joshuadavey.com/) "Paried with me initially to get the project going"
* [Desi McAdam](http://twitter.com/desi) "Doing my acceptance testing on Pivotal"
* [Veezus Kreist](http://veez.us/) "Pairing with me on the comic strip updating"
* [Dave Lyon](http://davelyon.net/) "Pairing and Contributing Patches"
* [Brian Dunn](https://twitter.com/higgaion) "Pairing with me on the comic update code and tests"
