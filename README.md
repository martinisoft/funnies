Funnies
=======

Discover and share your favorite web comics.

### Why?

I love reading my web comics every week. In real life I have a newspaper
with it all in one section. Why not online? RSS Feeds are useless
because you have to separartely go to each page for updates.

### Donate!

[![Click here to lend your support to: Funnies and make a donation at www.pledgie.com !](http://www.pledgie.com/campaigns/15373.png?skin_name=chrome)](http://www.pledgie.com/campaigns/15373)

Do you use Funnies? Want a better design? I'm raising a budget for a
professional re-design of the application. After the budget is raised,
future donations will go towards server costs.

### Requirements

* Ruby 1.9.3-p327 (I live dangerously on the edge)
* Ruby on Rails 3.2.12
* PostgreSQL Database (this can be changed, see database.example.yml)
* Nokogiri (scrapes all the comic image data)
* Some XPath Skills (this app uses XPath to locate image data)

### Installation

Get up and running quickly with the Bootstrap script by typing:

```
./script/bootstrap
```

### Customization / Configuration

See config/application.yml after running bootstrap

### Updating comics

This app uses the Whenever gem to schedule a rake task to pull all the comics
once a day.  Check out the lib/tasks/comics rake task for some more details.

### Deployment Location & Stack

Production: [www.funniesapp.com](http://www.funniesapp.com)
Location: Chicago, IL ([Steadfast Networks](http://steadfast.net/))
OS: Ubuntu 12.04.2 (64-bit)
App Server: nginx (with Unicorn)
Database: PostgreSQL 9.1

### Contribute:

I publicly storycard this app at [Trello](https://trello.com/board/funnies/508407067ac60d1c4700f4f7)

Any issues can be reported to the [Github Issues Tracker](https://github.com/martinisoft/funnies/issues)

Master is always deployed, any features are started on a branch, then a pull request is opened to
merge it back in to master:

* Fork this repo
* Make your changes
* Add test coverage (and make sure the current tests pass)
* Send a pull request

Please include tests with your pull request if the patch calls for testing
the code included. Documentation patches are also welcomed.

_Any design help or advice would be *awesome*!_

### Special Thanks:

[Hashrocket](http://www.hashrocket.com/)

[Mark James](http://famfamfam.com/) aka Fam^3 for the awesome Silk icons.

### Contributors: (Helped patch or paired with me)

* [Joshua Davey](http://joshuadavey.com/) for pairing with me initially to get the project going
* [Desi McAdam](http://twitter.com/desi) for being my initial stake holder on Pivotal Tracker
* [Veezus Kreist](http://veez.us/) for pairing with me on comic strip updating
* [Dave Lyon](http://davelyon.net/) for pairing and contributing patches
* [Brian Dunn](https://twitter.com/higgaion) for pairing with me on the comic update code and tests
* [Robert Pitts](https://github.com/rbxbx) for pairing with me on RSS feeds

Also see the [Contributors](https://github.com/martinisoft/funnies/contributors) section

### License and Usage

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License in the LICENSE file or at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
