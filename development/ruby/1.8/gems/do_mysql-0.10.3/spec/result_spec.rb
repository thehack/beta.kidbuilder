# encoding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))
require 'data_objects/spec/result_spec'

# splitting the descibe into two separate declaration avoids
# concurrent execution of the "behaves_like ....."
# needed by some databases (sqlite3)

describe DataObjects::Mysql::Result do
  behaves_like 'a Result'
end

describe DataObjects::Mysql::Result do
  behaves_like 'a Result which returns inserted key with sequences'
  behaves_like 'a Result which returns nil without sequences'
end
