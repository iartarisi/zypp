# Copyright (c) 2013 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

action :add do
  execute "zypper addrepo #{new_resource.url} #{new_resource.alias}" do
    # check if the alias matches an installed repo exactly
    not_if { `zypper repos | cut -d '|' -f 2`.lines.find {
        |l| l.strip == new_resource.alias}
    }
    command "zypper addrepo #{new_resource.url} #{new_resource.alias}"

    Chef::Log.info "Adding #{new_resource.alias} repository from "+
      "#{new_resource.url}"
  end
end

action :create do
  Chef::Log.info "Adding #{new_resource.alias} repository from "+
    "#{new_resource.url}"

  execute "zypper addrepo #{new_resource.url} #{new_resource.alias}"
end

action :refresh do
  Chef::Log.info "Refreshing #{new_resource.alias} repository"
  execute "zypper refresh #{new_resource.alias}"
end
