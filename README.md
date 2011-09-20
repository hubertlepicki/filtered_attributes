# filtered\_attributes

## Alternative way to filter mass-assignment attributes

attr_protected/attr_accessible are great tools, but in practive, rarely
used properly. I strongly believe that this is because we are trying to
squeeze too much into model layer, while controllers layer is underused.
Access control, authentication and authorization should be all done
inside controllers. At least this is what my intuition says.

## Instalation

This gem was tested with Rails 3.1 and Ruby 1.9.3. I see no reason why
it can't work with earlier versions - <a
href="mailto:hubert.lepicki@amberbit.com">let me know if it works for
you</a>. However, this library will not work with Ruby versions prior to
1.9.

### Step1: Add the gem to Gemfile:

```ruby
    gem 'filtered_attributes', '~> 0.1.0'
```

```bash
    bundle
```

### Step2: Amend your ApplicationController (or any other controller you subclass from)

```ruby
    class ApplicationController < ActionController::Base
      include FilteredAttributes::Filters
      ....
    end
```
### Step3: Restart your application if it was running!

# Usage

## Basics

```ruby
    class UsersController < ApplicationController
      filter_attributes_for :user, allow: [:email, :password, :password_confirmation]
      def create
        User.create! user_attributes
      end
    end
```

## Advanced

filter\_attributes takes parameters:

- **resource_name** prefix of method name, which returns filtered
  attributes. ```:user``` will generate user_attributes method on
controller.
  - **options** (Hash), with keys
  - **:allow** (Array) list of allowed attributes, defaults to ```[]```
  - **:as** (Symbol) key in ```params``` hash, from where attributes are
    taken, defaults to resource_name, for example ```filter_attributes_for :user, as: :account```
will seek for attributes in ```params[:account]```, but create helper method
user_attributes in your controller
  - **:only** (Array) - list of actions that parameters will be filtered
    for
  - **:except** (Array) - opposite of **only**, can't be used together
  - **:attributes_hash** (Lambda) - pass your procedure if you want to
    find your model attributes somewhere deeper in ```params``` hash. Params
hash will be passed to this lambda as it's only parameter.

# Legal
Copyright 2011 Hubert Łępicki <hubert.lepicki@amberbit.com>. Released
under the terms of MIT License (see file MIT-LICENSE in current
directory).
