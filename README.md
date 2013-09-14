### [Unofficial Github API](https://github.com/mac-r/unofficial-github-api.git)

Unofficial Github API with unlimited requests and no authentication needed.

### Installation

Install gem through terminal

```
gem install unofficial-github-api
```

or add to the Gemfile

```ruby
gem 'unofficial-github-api'
```

Then require the package in a file

```ruby
require 'unofficial-github-api'
```

### Features

No more features yet. Only those, which are listed below.

#### List of Followers

Returns a list of all followers for a specified user. Multiple threads are used.

```ruby
github_user = GithubApi::User.new('mac-r')

github_user.followers # => ['s0ber', 'targence', 'kossnocorp', 'Pistol92', 'denova', 'Virakocha', 'drinkius']
```

#### Join Date

Returns time, when a specified profile was created.

```ruby
github_user = GithubApi::User.new('igrigorik')

github_user.created_at # => 2008-05-17 12:00:00 +0400
```

#### Number of Followers

Returns number of followers for a specified user.

```ruby
github_user = GithubApi::User.new('torvalds')

github_user.followers_size # => 12 567
```

#### Number of Commits

Returns number of public commits for a specified user.

```ruby
github_user = GithubApi::User.new('dhh')

github_user.commits_size # => 394
```

### License

The MIT License

Copyright (c) 2013 Max Makarochkin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
