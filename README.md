![Build](https://github.com/DiscoLord/rails-project-63/actions/workflows/main.yml/badge.svg)
![Hexlet check](https://github.com/DiscoLord/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

## Usage

```ruby
user = User.new name: 'rob', job: 'kek'
    form = HexletCode.form_for user, '/profile', class: 'hexlet-form' do |f|
      f.input :text, :name, user.name, class: 'user-input'
      f.textarea :job, 50, 50, user.job
      f.submit 'Wow'
    end
```

will net you
```html
<form action='/profile' method='post' class='hexlet-form'>
    <label for='name'>Name</label>
    <input type='text' name='name' value='rob' class='user-input'>
    <label for='job'>Job</label>
    <textarea name='job' rows='50' cols='50'>kek</textarea>
    <input type='submit' value='Wow'>
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.
