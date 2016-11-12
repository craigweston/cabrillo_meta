# CabrilloMeta

Parses Cabrillo QSO templates into json meta data.


#### QSO Template Example:

```
                          --------info sent------- -------info rcvd--------
QSO: freq  mo date       time call          rst exch   call          rst exch   t
QSO: ***** ** yyyy-mm-dd nnnn ************* nnn ****** ************* nnn ****** n
QSO:  3799 PH 2000-11-26 0711 N6TW          59  03     JT1Z          59  23     0

000000000111111111122222222223333333333444444444455555555556666666666777777777788
123456789012345678901234567890123456789012345678901234567890123456789012345678901
```

#### Produces:

```javascript
{
  "common": {
    "freq": {
      "length": 5,
      "type": "string"
    },
    "mo": {
      "length": 2,
      "type": "string"
    },
    "date": {
      "length": 10,
      "type": "date"
    },
    "time": {
      "length": 4,
      "type": "string"
    }
  },
  "sent": {
    "call": {
      "length": 13,
      "type": "string"
    },
    "rst": {
      "length": 3,
      "type": "string"
    },
    "exch": {
      "length": 6,
      "type": "string"
    }
  },
  "recv": {
    "call": {
      "length": 13,
      "type": "string"
    },
    "rst": {
      "length": 3,
      "type": "string"
    },
    "exch": {
      "length": 6,
      "type": "string"
    },
    "t": {
      "length": 1,
      "type": "string"
    }
  }
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cabrillo_meta'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cabrillo_meta

## Usage

Parse a qso template from STDIN:

```bash
cat template.txt | bundle exec rake parse
```

Parse multiple qso templates contests from html ```<pre/>``` tags:

```bash
cat template.html | bundle exec rake parse_html
```

## Contributing

1. Fork it ( https://github.com/craigweston/cabrillo_meta/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
