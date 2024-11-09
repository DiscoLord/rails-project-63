# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code/models/user'

class TestHexletCode < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    user = User.new name: 'rob'
    assert_equal HexletCode.form_for(user, url: '/profile', class: 'hexlet-form'), '<form action="/profile" method="post" class="hexlet-form"></form>'
  end

  def test_form_for2
    user = User.new name: 'rob'
    assert_equal HexletCode.form_for(user, class: 'hexlet-form'), '<form action="#" method="post" class="hexlet-form"></form>'
  end

  def test_form_for3
    user = User.new name: 'rob'
    assert_equal HexletCode.form_for(user), '<form action="#" method="post"></form>'
  end
end
