[![CircleCI](https://circleci.com/gh/CraftAcademyLabs/adventure_map_back_end.svg?style=svg&circle-token=2ed7f64b11a17957dcc552801fe0229c7f97562c)](https://circleci.com/gh/CraftAcademyLabs/adventure_map_back_end)
# AdventureMap
### Administrative interface and API

### Project Tracker
This project is tracked on https://www.pivotaltracker.com/n/projects/1938829

### Deployed
Development: [Heroku](http://adventuremap-dev.herokuapp.com)
Stagind: [Heroku](http://adventuremap-staging.herokuapp.com)

### Libraries used
- [**Godmin**](https://github.com/varvet/godmin) - for administrative interface
- [**DeviseTokenAuth**](https://github.com/lynndylanhurley/devise_token_auth) - for user authentication

### Adding an AdminUser
For manual testing you need to add an `AdminUser`. In `$rails c` execute the following command.

```ruby
AdminUser.create(email: 'admin@admin.com', password: 'password', first_name: 'Thomas', last_name: 'Ochman')
```

### Policies for Admin

Godmins authorization modules are turned on in the `ApplicationController`

```ruby
class ApplicationController < ActionController::Base
  include Godmin::ApplicationController
  include Godmin::Authentication
  include Godmin::Authorization
  ...
end
```

The main Policy is created in `ApplicationPolicy` that inherits from `Godmin::Authorization::Policy`
It allows an `AdminUser` to perform all CRUD actions on a `resource`. Policies for specific resources inherit from that class and there's no
 need to add specific authorization rules unless the **diviate** from the settings in `ApplicationPolicy`
 (see `app/policies/application_policy.rb` for details).

##### Example
For the `User` resource, we want prevent Admins to be able to perform `:destroy`. This means that the spec for the policy can look something like this:


```ruby
RSpec.describe UserPolicy do
  let(:admin) { create(:admin_user) }
  let(:resource) { create(:user, email: 'another_admin@admin.com') }

  describe 'For Admin' do
    subject { described_class.new(admin, resource) }

    it { is_expected.to forbid_action :destroy }

    %w(index show update create).each do |action|
      it { is_expected.to permit_action action.to_sym }
    end


    describe 'For non Admin' do
      subject { described_class.new(nil, resource) }

      %w(index show update destroy create).each do |action|
        it { is_expected.to forbid_action action.to_sym }
      end
    end
  end
end
```

And the policy class, like this:

```ruby
class UserPolicy < ApplicationPolicy
  def destroy?
    false
  end
end
```

The rest of the rules are set in `ApplicationPolicy`. Also, as an extra measure of security, we choose **not** to generate a route for that resource

```ruby
# config/routes.rb

resources :users, except: [:destroy]
```

### Code coverage

[SimpleCov](https://github.com/colszowka/simplecov) is configured on this project to measure code test coverage. Everytime we run tests using either `RSpec` or `Cucumber` a coverage report is genarated in the `coverage` directory of the application, in html format that you can open with your favorite browser.

```shell
# Run your test suite. e.g: `RSpec`
$ bundle exec rspec

# if you're on a macOS the following command will open the coverage report in your browser
$ open coverage/index.html
```

To get merged coverage report of `RSpec` & `Cucumber` run either one of the following commands:

```shell
$ bundle exec rake

# or

$ bundle exec rails ci:tests
```

### API Documentation
API docs are located at `/apidocs`

### Deployment

This application can be deployed to `production` or `staging` using Capistrano. Get the `.env` with configuration variables from a someone in the team and run the following command to deployed

```shell
$ bundle exec cap <environment> deploy
```

Replace `<environment>` with either `production` or `staging` depending on what server you're deploying to.

### Database Seed

If you have a fresh DB to seed with data run the following command

```shell
$ bundle exec rails db:seed
```

The following command will reset the DB and re-seed

```shell
$ DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:reset
```

### Other
Users "like" an activity by "following" it. This is the code for a user to follow another:
```ruby
user.follow user2
```
For a user to "like" an activity, it is:
```ruby
user.follow activity
```

#### Brought to you by Craft Academy Labs
