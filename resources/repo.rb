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

actions :add, :create, :refresh

attribute :alias, :kind_of => String, :name_attribute => true
attribute :url, :kind_of => String
attribute :key, :kind_of => String
attribute :keyserver, :kind_of => String

default_action :add
