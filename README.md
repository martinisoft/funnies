Funnies
=======

Read your favorite Web Comics on one page, just like a Newspaper.

### Why?

I love reading my web comics every week. In real life I have a newspaper
with it all in one section.  Why not online? RSS Feeds are useless
because you have to separartely go to each page for updates.

### Donate!

[![Click here to lend your support to: Funnies and make a donation at www.pledgie.com !](https://www.pledgie.com/campaigns/15373.png?skin_name=chrome)](http://www.pledgie.com/campaigns/15373)

Do you use Funnies? Want a better design? I'm raising a budget for a
professional re-design of the application. After the budget is raised
future donations will go towards server costs.

### Requirements

* Ruby 1.9.2-p290 (I live dangerously on the edge)
* Ruby on Rails 3.0.9 (Rails 3.1 upgrade pending)
* PostgreSQL Database (this can be changed, see database.yml.example)
* Nokogiri Gem (scrapes all the comic image data)
* Some XPath Skills (this app uses XPath to locate image data)

### Installation

This app uses a separate appconfig.yml file to store the pepper and secret
token keys for security reasons. Before you can run the server (even locally)
you'll need to copy over the appconfig.yml.example file:

```
  cp config/appconfig.yml.example config/appconfig.yml
```

You'll also need to setup your database settings via the database.yml.example
file in the config directory.

```
  cp config/database.yml.example config/database.yml
```

If you're not using PostgreSQL, you'll need to also modify the Gemfile with
your database gem of choice along with modifying the contents of the
database.yml file.

### Deployment Locations & Stack

Both deployment servers are on Linode 512 Instances

Staging: [http://staging.funniesapp.com](http://staging.funniesapp.com)
Location: Dallas, TX
OS: Ubuntu 10.04 LTS
App Server: nginx (with Passenger)
Database: PostgreSQL 8.4

Production: [www.funniesapp.com](http://www.funniesapp.com)
Location: Newark, NJ
OS: CentOS 6 (64-bit)
App Server: nginx (with Unicorn)
Database: PostgreSQL 9.1

### Contribute:

I publicly storycarded this app at [Pivotal Tracker](https://www.pivotaltracker.com/projects/201253)

Any issues can be reported to the [Github Issues Tracker](https://github.com/martinisoft/funnies/issues)

Any contributions or stories you'd like to complete should be done off the
master branch.  Both staging *and* production deploy from staging with topic
branches merging back into master.

* Fork this repo
* Make your changes
* Add test coverage (and make sure the current tests pass)
* Send a pull request

Please include tests with your pull request if the patch calls for testing
the code included. Documentation patches are also welcomed.

_Design help would be *awesome*!_

### Special Thanks:

*BIG* Thanks go to [Hashrocket](http://www.hashrocket.com/)

[Mark James](http://famfamfam.com/) aka FamFamFam for the awesome Silk icons.

### Contributors: (Helped patch or paired with me)

* [Joshua Davey](http://joshuadavey.com/) "Paried with me initially to get the project going"
* [Desi McAdam](http://twitter.com/desi) "Doing my acceptance testing on Pivotal"
* [Veezus Kreist](http://veez.us/) "Pairing with me on the comic strip updating"
* [Dave Lyon](http://davelyon.net/) "Pairing and Contributing Patches"
* [Brian Dunn](https://twitter.com/higgaion) "Pairing with me on the comic update code and tests"
* [Robert Pitts](https://github.com/rbxbx) "Pairing with me on RSS feeds"
