# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code/models/user'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    user = User.new name: 'rob'
    assert_equal "<form action='/profile' method='post' class='hexlet-form'>"\
    "<input type='text' name='name' value='rob' class='user-input'>"\
    "<textarea name='job' rows='50' cols='50'></textarea></form>",
                 HexletCode.form_for(user, url: '/profile', class: 'hexlet-form')
  end

  def test_form_for2
    user = User.new name: 'rob'
    assert_equal "<form action='#' method='post' class='hexlet-form'>"\
    "<input type='text' name='name' value='rob' class='user-input'>"\
    "<textarea name='job' rows='50' cols='50'></textarea></form>",
                 HexletCode.form_for(user, class: 'hexlet-form')
  end

  def test_form_for3
    user = User.new name: 'rob'
    assert_equal "<form action='#' method='post'><input type='text' name='name' value='rob' class='user-input'>"\
    "<textarea name='job' rows='50' cols='50'></textarea></form>",
                 HexletCode.form_for(user)
  end

  def test_form_for4
    user = User.new name: 'rob', job: 'kek'
    assert_equal "<form action='/profile' method='post' class='hexlet-form'>"\
    "<input type='text' name='name' value='rob' class='user-input'>"\
    "<textarea name='job' rows='50' cols='50'>kek</textarea></form>",
                 HexletCode.form_for(user, url: '/profile', class: 'hexlet-form')
  end
end
