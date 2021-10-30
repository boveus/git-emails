### Git Emails

This is a simple Ruby script using the GitHub API.  It will iterate through a user's public GitHub repositories and retrieve all of the emails and associated display names from each of the commits within them.

This currently does not involve API authentication, so it is subject to rate limits.  This is still useful for scanning one or two users before the rate limit is reached.

To use the script, you will need to have Ruby installed.  From the root directory, run the following:
```shell
ruby git-emails.rb <GitHub username>
```

This should return something like this:
```ruby
{"foo@bar.com"=>"Foo Bar",
 "foobar@gmail.com"=>"Foo Bar",
}
```
