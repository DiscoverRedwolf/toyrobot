Toy Robot
=========

A solution to this programming test.

Installation
------------

Make sure you have RVM, and then:

```
> rvm @global do gem install bundler
> bundle install
> bundle exec ./bin/toyrobot
```

You can use `rspec` to run the tests.

If you don't like the interactive mode, you can pipe or redirect a file instead.
For example:

```
> bundle exec ./bin/toyrobot < commands.txt
```

Known Limitations
-----------------

I decided not to use the `treetop` gem to implement the parser, which means that
commands need to be specified one at a time. A proper parser implementation
would have allowed commands like `"place2,3,eastmovemoveleftmovereport"`.

Copyright
---------

Copyright (c) 2016 Jason Hutchens. See UNLICENSE for further details.
