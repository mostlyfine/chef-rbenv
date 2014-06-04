rbenv Cookbook
==============

Description
------------
Manages rbenv and its installed ruby.

Requirements
------------
- `build-essential`

Installation
------------
Depending on the situation and use case there are several ways to install this cookbook.
All the methods listed below assume a tagged version release is the target, but omit the tags to get the head of development.
A valid Chef repository structure like the [opscode/chef-repo](https://github.com/opscode/chef-repo) repo is also assumed.

#### Using Berkshelf
[Berkshelf](http://berkshelf.com/) is a cookbook dependency manager and development workflow assistant.

To install Berkshelf:

```shell
gem install berkshelf
berkshelf init .
```

Berkshelfile:

```ruby
source "https://api.berkshelf.com"

cookbook 'rbenv', git: 'git://github.com/mostlyfine/chef-rbenv.git'
```


Attributes
----------

#### rbenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rbenv']['user']</tt></td>
    <td>String</td>
    <td>author user name</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['group']</tt></td>
    <td>String</td>
    <td>author group name</td>
    <td><tt>rbenv</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['members']</tt></td>
    <td>Array</td>
    <td>group members</td>
    <td><tt>['root']</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['rbenv_root']</tt></td>
    <td>String</td>
    <td>rbenv install directory</td>
    <td><tt>/usr/local/rbenv</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['profile_path']</tt></td>
    <td>String</td>
    <td>add `rbenv` init to your shell to enable shims.</td>
    <td><tt>/etc/profile.d</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['build']</tt></td>
    <td>Array</td>
    <td>ruby versions to builded.</td>
    <td><tt>['2.1.2']</tt></td>
  </tr>
  <tr>
    <td><tt>['rbenv']['global']</tt></td>
    <td>String</td>
    <td>set global this ruby version.</td>
    <td><tt>'2.1.2'</tt></td>
  </tr>
</table>

Usage
----------
#### rbenv::default
Create user, group and checkout for repository.
Just include `rbenv` in your node's `run_list`:
```json
{
  "run_list": [
    "recipe[rbenv]"
  ]
}
```

#### rbenv::install
Build node.js and set default version.
```json
{
  "run_list": [
    "recipe[rbenv::install]"
  ]
}
```

```json
{
  "rbenv": {
    "user": "taro",
    "rbenv_root": "/home/taro/.rbenv",
    "profile_path": "/home/taro/.rbenv"
  },
  "run_list": [
    "recipe[rbenv::default]"
    "recipe[rbenv::install]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
MIT, Authors: mostlyfine
