# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code/models/user'

class TestHexletCode < Minitest::Test
  def load_html_fixture(filename)
    File.read(File.join(__dir__, 'fixtures', filename)).strip
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_with_text_input_and_textarea
    user = User.new name: 'rob', job: 'kek'
    form = HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
      f.input_tag :text, :name, user.name, class: 'user-input'
      f.textarea :job, 50, 50, user.job
      f.submit 'Wow'
    end
    assert_equal load_html_fixture('expected_form5.html'), form
  end

  def test_form_with_missing_optional_field
    user = User.new name: 'rob' # Job is missing
    form = HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
      f.input_tag :text, :name, user.name, class: 'user-input'
      f.input_tag :text, :job, user.job || '', class: 'job-input' # Handles missing job field gracefully
      f.submit 'Save'
    end
    assert_equal load_html_fixture('expected_form2.html'), form
  end

  def test_form_without_submit_button
    user = User.new name: 'rob', job: 'kek'
    form = HexletCode.form_for user, url: '/profile' do |f|
      f.input_tag :text, :name, user.name
      f.textarea :job, 5, 30, user.job
    end
    assert_equal load_html_fixture('expected_form3.html'), form
  end

  def test_form_with_custom_attributes
    user = User.new name: 'rob', job: 'kek'
    form = HexletCode.form_for user, url: '/profile', class: 'custom-form', data: { id: 123 } do |f|
      f.input_tag :text, :name, user.name, class: 'user-input', placeholder: 'Enter your name'
      f.textarea :job, 10, 40, user.job, class: 'textarea-input', placeholder: 'Describe your job'
      f.submit 'Submit'
    end
    assert_equal load_html_fixture('expected_form4.html'), form
  end

  def test_for_generic_input
    user = User.new name: 'rob', job: 'kek'
    form = HexletCode.form_for user, url: '/profile', class: 'custom-form', data: { id: 123 } do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal load_html_fixture('expected_form1.html'), form
  end
end
