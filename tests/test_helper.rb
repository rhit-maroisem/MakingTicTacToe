# frozen_string_literal: true
# test/test_helper.rb

require 'minitest/autorun'
require 'mutant/minitest/coverage'

# Add lib directory to load path if you're testing code in lib/
$LOAD_PATH.unshift File.expand_path("../lib", __dir__)




