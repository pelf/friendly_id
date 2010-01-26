#!/usr/bin/env ruby -KU
require File.dirname(__FILE__) + '/../test/test_helper'
require 'ffaker'

TIMES = (ENV['N'] || 100).to_i
FACTOR = 20
POSTS     = []
DISTRICTS = []
USERS     = []

User.delete_all
Post.delete_all
District.delete_all
($slug_class or Slug).delete_all

100.times do
  name = Faker::Name.name
  USERS     << (User.create! :name     => name).friendly_id
  POSTS     << (Post.create! :name     => name).friendly_id
  DISTRICTS << (District.create! :name => name).friendly_id
end

def get_id
  rand(99) + 1
end

class Array
  def rand
    self[Kernel.rand(length)]
  end
end