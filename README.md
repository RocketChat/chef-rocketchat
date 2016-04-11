# Rocket.Chat
[![Build Status](https://travis-ci.org/gregf/chef-rocketchat.svg?branch=master)](https://travis-ci.org/gregf/chef-rocketchat)
[![Cookbook Version](https://img.shields.io/cookbook/v/rocketchat.svg)](https://supermarket.chef.io/cookbooks/rocketchat)

## Description

Installs and configures a [Rocket.Chat](https://rocket.chat/) server. This is
intended only to install the Rocket.Chat server. You'll want to use a wrapper
cookbook to setup nginx as a proxy with ssl enabled.

* Opscode Community Site: http://community.opscode.com/cookbooks/rocketchat
* Source Code: http://github.com/gregf/chef-rocketchat

## Requirements

### Chef

Tested on chef 12

### Platforms

* Debian 7+
* Ubuntu 14.04+

## Recipes

### default

The default recipe ensures a Rocket.Chat server is installed, and configured based
on attributes you have specified.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Author: Greg Fitzgerald <greg@gregf.org>

Copyright 2016, Greg Fitzgerald.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
