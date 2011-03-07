## Funnies

Read your favorite Web Comics in one spot, just like a Newspaper.

### Why?

I love reading my web comics every week. In real life I have a newspaper with it all in one section.
Why not online? RSS Feeds are usually useless because you have to separartely go to each page for updates.

### Requirements

Ruby 1.9.2-p180 (I live dangerously on the edge)
Ruby on Rails 3.0.5
PostgreSQL Database (this can be changed, see the database.yml.example)
Nokogiri Gem (scrapes all the comic image data)

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

Staging: [Linode](http://staging.funniesapp.com)

Production: [Linode](http://www.funniesapp.com)

### Production Stack

Funnies runs on a Linode 512 out of Dallas (more central location)

OS: Ubuntu 10.04 LTS (I like apt and pkgsrc)
App Server: nginx (with passenger)
Database: PostgreSQL 8.4

### Contribute:

I publicly storycarded this app at [Pivotal Tracker](https://www.pivotaltracker.com/projects/201253)
Any issues can be reported to the [Github Issues Tracker](https://github.com/martinisoft/funnies/issues)

Any design help would be *awesome*

### Thanks:

BIG Thanks go to [Hashrocket](http://www.hashrocket.com/) for accepting me as an Apprentice Developer
in their Chicago office. Finally getting to do what you love (and get paid for it) is amazing.

Contributors: (Helped patch or paired with me)

* [Joshua Davey](http://joshuadavey.com/)
* [Desi McAdam](http://twitter.com/desi)
* [Veezus Kreist](http://veez.us/)
