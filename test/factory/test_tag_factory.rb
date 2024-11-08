# frozen_string_literal: true

require 'test_helper'
require_relative '../../lib/hexlet_code/factory/tag_factory'

class HtmlTagMethodsTest < Minitest::Test
  include TagFactory

  def setup
    # Any setup code you may need for tests can go here
  end

  def test_paragraph_tag
    assert_equal '<p>Hello, World!</p>', p('Hello, World!')
  end

  def test_anchor_tag
    assert_equal "<a href='https://example.com'>Example</a>", a('https://example.com', 'Example')
  end

  def test_image_tag
    assert_equal "<img src='/images/example.jpg' alt='Example Image'>", img('/images/example.jpg', 'Example Image')
  end

  def test_input_tag
    assert_equal "<input type='text' name='username' value=''>", input('text', 'username')
  end

  def test_label_tag
    assert_equal "<label for='username'>Username:</label>", label('username', 'Username:')
  end

  def test_button_tag
    assert_equal '<button>Submit</button>', button('Submit')
  end
end
