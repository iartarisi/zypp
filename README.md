zypp Chef LWRP
==============
Chef Lightweight Resource Proivder for managing zypp repositories and repository keys.


Requirements
------------

Any recent version of openSUSE/SLES with zypper installed.


Usage
-----
#### zypp::default

Just include `zypp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[zypp]"
  ]
}
```

### Actions

All of the actions use the name attribute as the zypper repository name/alias/number.


- `:add` (default action) - adds a new zypper repository (won't do anything if a repository with the same ID is already installed)

params:
  - `url` - the url of the repository to be added
  - `key` - gpg key fingerprint or gpg key URL/file for this repository
  - `key_server` - gpg keyserver from which to download the gpg key identified by a gpg `key` fingerprint above

```ruby
zypp_repo "cloud" do
  url "http://download.opensuse.org/repositories/Cloud:/OpenStack:/Folsom/openSUSE_12.3/"
end
```

- `:create` adds a new zypper repository - this will fail if a repository with the same ID is already installed

params:
  - `url` - the url of the repository to be added
  - `key` - gpg key fingerprint or gpg key URL/file for this repository
  - `key_server` - gpg keyserver from which to download the gpg key identified by a gpg `key` fingerprint above

```ruby
zypp_repo "cloud" do
  url "http://download.opensuse.org/repositories/Cloud:/OpenStack:/Folsom/openSUSE_12.3/"
  action :create
end
```

- `:refresh` - refreshes the given repository

```ruby
# assuming a repository with the "cloud" alias was already added
zypp_repo "cloud" do
  action :refresh
end
```



Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

MIT License

Authors: Ionuț Arțăriși <iartarisi@suse.cz>
