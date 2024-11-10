# frozen_string_literal: true

require 'test_helper'
require_relative '../../lib/hexlet_code/factory/tag_factory'

class HtmlTagMethodsTest < Minitest::Test
  def setup
    user = User.new(name: 'rob', job: 'kek', gender: 'male')
    @factory = TagFactory.new(user)
  end

  def test_paragraph_tag
    assert_equal '<p>Hello, World!</p>', @factory.p('Hello, World!')
  end

  def test_anchor_tag
    assert_equal "<a href='https://example.com'>Example</a>", @factory.a('https://example.com', 'Example')
  end

  def test_image_tag
    assert_equal "<img src='/images/example.jpg' alt='Example Image'>",
                 @factory.img('/images/example.jpg', 'Example Image')
  end

  def test_input_tag
    assert_equal "<label for='name'>Name</label><input type='text' name='name' value=''>",
                 @factory.input_tag('text', :name)
  end

  def test_input_with_nil_value
    assert_equal "<label for='name'>Name</label><input type='text' name='name' value=''>",
                 @factory.input_tag('text', :name, nil)
  end

  def test_textarea_with_nil_value
    assert_equal "<label for='name'>Name</label><textarea name='name' rows='4' cols='40'></textarea>",
                 @factory.textarea(:name, 4, 40, nil)
  end

  def test_input_with_additional_attributes
    assert_equal "<label for='name'>Name</label>"\
      "<input type='text' name='name' value='rob' class='user-input' required='true'>",
                 @factory.input_tag('text', :name, 'rob', class: 'user-input', required: 'true')
  end

  def test_textarea_tag
    assert_equal "<label for='job'>Job</label><textarea name='job' rows='50' cols='50'>jobbest job</textarea>",
                 @factory.textarea(:job, 50, 50, 'jobbest job')
  end

  def test_textarea_with_additional_attributes
    assert_equal "<label for='job'>Job</label>"\
      "<textarea name='job' rows='10' cols='30' placeholder='Enter job description'>Best Job</textarea>",
                 @factory.textarea(:job, 10, 30, 'Best Job', placeholder: 'Enter job description')
  end

  def test_label_tag
    assert_equal "<label for='username'>Username:</label>", @factory.label('username', 'Username:')
  end

  def test_button_tag
    assert_equal '<button>Submit</button>', @factory.button('Submit')
  end

  def test_raises_no_method_error_for_invalid_field
    assert_raises(NoMethodError) do
      @factory.input_tag(:text, :non_existent_field, 'value')
    end
  end

  def test_raises_no_method_error_for_invalid_field_in_textarea
    assert_raises(NoMethodError) do
      @factory.textarea(:non_existent_field, 4, 40, 'value')
    end
  end

  def test_generic_input_as_text
    @factory.input(:name, as: :text, value: 'rob', class: 'user-input')
    expected_html = "<label for='name'>Name</label><input type='text' name='name' value='rob' class='user-input'>"
    assert_equal expected_html, @factory.form_string
  end

  def test_generic_input_as_textarea
    @factory.input(:job, as: :textarea, rows: 5, cols: 30, value: 'developer', class: 'textarea-input')
    expected_html = "<label for='job'>Job</label>"\
      "<textarea name='job' rows='5' cols='30' class='textarea-input'>developer</textarea>"
    assert_equal expected_html, @factory.form_string
  end

  def test_generic_input_as_submit
    @factory.input(:submit_button, as: :submit, value: 'Save')
    expected_html = "<input type='submit' value='Save'>"
    assert_equal expected_html, @factory.form_string
  end

  def test_generic_input_with_no_as
    initial_form_string = @factory.form_string.dup
    @factory.input(:name)
    assert_equal initial_form_string, @factory.form_string
  end
end
