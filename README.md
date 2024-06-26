# Backpedal

This gem provides developers a simple way to capture a users navigational path across multiple routes in their app. So for example, if a user is looking at a specific order(orders_controller), and they click on a product description(products_controller), the back link on this page would take them back to the order they were looking at. If the user arrived at the product view from the index action on the products controller the same back link would take them back to the index view they were on previously.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'backpedal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backpedal

## Usage

Usage is simple:

```ruby
class ApplicationController < ActionController::Base
  before_action :capture_path, if: :current_user
end
```

This will append the referring path to the navigation stack used by Backpedal to create a back link.

```erb
<%# app/users/show.html.erb %>
<%= back_link %>
<h1>Users#show</h1>
<p> Here is where your users would appear be if you had some </p>
```

Have a specific path in mind? Try this:

```erb
<%# app/users/show.html.erb %>
<%= back_link(users_path) %>
<h1>Users#show</h1>
<p> Here is where your users would appear be if you had some </p>
```

Wish to backpedal from the controller? Use the `stepback` method in your controller

```ruby
Class PagesController
  def create
    @page = Page.new(pages_params)
    if @page.save
      flash[:success] = "Yahoo! now to step back one level"
      stepback
    else
      "something else"
    end
  end
end
```

Using `stepback` on a multi-step form or wizard, and want to redirect back to before it all began? Tell stepback how many pages you want to stepback with an optional argument: `stepback(3)`

What if you want a specific controller action to wipe out the navigation stack and restart at the current action? Then set a before_action filter to dissolve the navigation stack.

```ruby
class SomeController < ActionController.base
  before_action :dissolve, only: [:index]
end
```

This will dissolve the navigation stack and set the current controller action as the base or starting point

Ok so wait, what if I have some controller actions I don't want appended to backpedal stack? Check this out:

```ruby
#config/initializers/backpedal.rb
Backpedal.configure do |config|
  config.skipped_verbs = %w[new edit destroy suspend resend_invitation etc]
end
```

If you add the initializer, it will overwrite the default skipped http verbs(new, edit, destroy). So make sure you include those if you want to skip those controller actions.

## I18N

The gem contains 4 simple locales for English, Spanish, French and German. If you want to add your own, use

```yaml
backpedal:
  back: <your equivalent of "back" here>
```

## Debugging

Are you finding it difficult to keep track of the navigation stack? Use the `stack` helper to print the navigation into any view.

```erb
  <%# app/layouts/application.html.erb %>
  <body>
    <%= stack %>
    <%= yield %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/greyoxide/backpedal.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
