# encoding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))
require 'data_objects/spec/typecast/string_spec'

describe 'DataObjects::Sqlite3 with String' do
  behaves_like 'supporting String'
end
