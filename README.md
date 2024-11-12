![Build](https://github.com/DiscoLord/rails-project-63/actions/workflows/main.yml/badge.svg)
![Hexlet check](https://github.com/DiscoLord/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

**HexletCode** is a flexible form-building library for Ruby, designed to simplify the creation of HTML forms with Ruby objects. It allows you to define forms with various input types and options, customizing elements like text fields, text areas, submit buttons, and more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code', git: 'https://github.com/DiscoLord/rails-project-63.git'
```

Then execute:

```bash
bundle install
```

Or install it directly:

```bash
gem install hexlet_code
```

## Usage

<details>
<summary>Basic Form with Text Input and Text Area</summary>

```ruby
require 'hexlet_code'

# Define your user struct
User = Struct.new(:name, :job, keyword_init: true)

user = User.new(name: 'rob', job: 'developer')

form = HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
  f.input :name, class: 'user-input'
  f.textarea :job, rows: 5, cols: 40
  f.submit 'Save'
end

puts form
```

This will produce:

```html
<form action='/profile' method='post' class='hexlet-form'>
  <label for='name'>Name</label>
  <input type='text' name='name' value='rob' class='user-input'>
  <label for='job'>Job</label>
  <textarea name='job' rows='5' cols='40'>developer</textarea>
  <input type='submit' value='Save'>
</form>
```

</details>

<details>
<summary>Adding Optional Fields and Custom Attributes</summary>

HexletCode handles missing or optional fields gracefully. Here’s an example that includes an optional `gender` field.

```ruby
user = User.new(name: 'alex')

form = HexletCode.form_for user, url: '/profile', class: 'custom-form' do |f|
  f.input :name, placeholder: 'Enter your name'
  f.input :job, placeholder: 'Your profession', class: 'job-input'  # Handles missing job field gracefully
  f.input :gender, placeholder: 'Gender (optional)'
  f.submit 'Register'
end

puts form
```

Produces:

```html
<form action='/profile' method='post' class='custom-form'>
  <label for='name'>Name</label>
  <input type='text' name='name' value='alex' placeholder='Enter your name'>
  <label for='job'>Job</label>
  <input type='text' name='job' placeholder='Your profession' class='job-input'>
  <label for='gender'>Gender</label>
  <input type='text' name='gender' placeholder='Gender (optional)'>
  <input type='submit' value='Register'>
</form>
```

</details>

<details>
<summary>Customizing Form Actions and Button Labels</summary>

You can specify different form actions and customize the button text easily.

```ruby
form = HexletCode.form_for user, url: '/update_profile', method: 'patch', class: 'profile-form' do |f|
  f.input :name, class: 'name-input'
  f.textarea :job, rows: 3, cols: 30
  f.submit 'Update Profile'
end

puts form
```

Produces:

```html
<form action='/update_profile' method='patch' class='profile-form'>
  <label for='name'>Name</label>
  <input type='text' name='name' value='alex' class='name-input'>
  <label for='job'>Job</label>
  <textarea name='job' rows='3' cols='30'></textarea>
  <input type='submit' value='Update Profile'>
</form>
```

</details>

<details>
<summary>Including Hidden Fields and Buttons</summary>

HexletCode can also include hidden fields, radio buttons, or checkboxes with custom attributes.

```ruby
form = HexletCode.form_for user, url: '/settings' do |f|
  f.input :name, type: 'hidden', value: 'alex'
  f.input :newsletter, type: 'checkbox', checked: true
  f.submit 'Save Settings'
end

puts form
```

Produces:

```html
<form action='/settings' method='post'>
  <input type='hidden' name='name' value='alex'>
  <input type='checkbox' name='newsletter' checked>
  <input type='submit' value='Save Settings'>
</form>
```

</details>

## Development

After checking out the repo, run:

```bash
bin/setup
```

This will install dependencies and prepare your environment. To run tests:

```bash
rake test
```

For an interactive console to experiment with the library, run:

```bash
bin/console
```

To install this gem onto your local machine:

```bash
bundle exec rake install
```

### Releasing a New Version

1. Update the version number in `version.rb`.
2. Run:

   ```bash
   bundle exec rake release
   ```

This will create a git tag for the version, push git commits and tags, and upload the `.gem` file to [RubyGems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [HexletCode](https://github.com/DiscoLord/rails-project-63). Follow the [contribution guidelines](https://opensource.guide/how-to-contribute/) for best practices.