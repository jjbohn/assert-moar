# assert-moar

[![Gem Version](https://badge.fury.io/rb/assert-moar.png)](http://badge.fury.io/rb/assert-moar)
[![Build Status](https://travis-ci.org/jjbohn/assert-moar.png?branch=master)](https://travis-ci.org/jjbohn/assert-moar)
[![Coverage Status](https://coveralls.io/repos/jjbohn/assert-moar/badge.png?branch=master)](https://coveralls.io/r/jjbohn/assert-moar?branch=master)
[![Code Climate](https://codeclimate.com/github/jjbohn/assert-moar.png)](https://codeclimate.com/github/jjbohn/assert-moar)

## Installation

Add this line to your application's Gemfile:

    gem 'assert-moar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assert-moar

## Usage

Available methods:
```
  #assert_valid
  #refute_valid
  #assert_validates_absence_of
  #refute_validates_absence_of
  #assert_validates_acceptance_of
  #refute_validates_acceptance_of
  #assert_validates_presence_of
  #refute_validates_presence_of
  #assert_validates_uniqueness_of
  #refute_validates_uniqueness_of
  #assert_validates_with_callback
  #refute_validates_with_callback
  #assert_memoizes_method_result
  #refute_memoizes_method_result
```

## Contributing

1. Fork it ( http://github.com/jjbohn/assert-moar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
