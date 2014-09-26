# Intro

This module enables ZFS on Ubuntu based machines, it enables:

* Setting up PPA and package installation.
* ZFS module customizations (mainly ARC size).
* Adding zfs user that allows any user to perform ZFS operations (without sudo).
* Adding support for send/recieve over netcat.

# Usage

Add to your Puppetfile

```ruby
mod 'strings/zfs',
   :git => 'git://github.com/pulling-strings/puppet-zfs.git'
```

Within your puppet code:

```puppet
  include zfs
```

# Copyright and license

Copyright [2013] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

