# AdventureMap
### Administrative interface and API

### Project Tracker
This project is tracked on https://www.pivotaltracker.com/n/projects/1938829

### Deployed
Development: [Heroku](http://adventuremap-dev.herokuapp.com)

### Libraries used
- [**Godmin**](https://github.com/varvet/godmin) - for administrative interface
- [**DeviseTokenAuth**](https://github.com/lynndylanhurley/devise_token_auth) - for user authentication

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

[SimpleCov](https://github.com/colszowka/simplecov) is configured on this project to measure code test coverage. Everytime we run tests using either `RSpec` or `Cucumber` a coverage report is genarate in the `coverage` directory of the application, in html format that you can open with your favorite browser.

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
