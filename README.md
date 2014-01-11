tl;dr
====

Enable unsubscribe links within your emails

# Description

Some of your users don't want to hear from you or your shitty application. You can add unsubscribe links to your mail views so that your users can relieve themselves of the pain you have endured on them.

# Installation

```rb
# Gemfile
gem 'toolong-dontread'
```

```sh
rails g tldr:install

rake db:migrate
```

# Usage

Inside your mailer you can generate an uninstall url.

```rb
class AccountMailer < ActionMailer::Base
  def new_follower_notification(user, follower)
    ...
    token = Tldr::TokenGenerator.new(user, :new_follower_notification).token
    @unsubscribe_url = unsubscribe_url(token)
    ...
  end
end
```

Inside your model to test if someone is subscribed

```rb
  class User < ActiveRecord::Base
    include Tldr::Subscriber
  end

  # elsewhere
  user = User.find params[:id]
  user.subscribed_to? :new_follower_notification
```

Inside your controller if you are using Rails

```rb
class AccountsController < ApplicationController
  def unsubscribe
    subscription = Tldr.unsubscribe params[:token]
    redirect_to dashboard_path(subscription.values[:user]), notice: 'You have successfully been unsubscribed from that stupid ass email'
  end
end
```

# Contributing

1. Clone the repository `git clone https://github.com/brilliantfantastic/tldr`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request `hub pull-request -b brilliantfantastic:master -h brilliantfantastic:my-awesome-feature`
