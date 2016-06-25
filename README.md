# kemalblog

THis is simple blog that made by [Kemal](https://github.com/sdogruyol/kemal)

## Installation

### Create Database

```
createdb kemalblog_dev -O your_owner
psql -U postgres -d kemalblog_dev -f create_articles.sql
```

### Build and Run

```
crystal build --release ./src/kemalblog.cr
./kemalblog
```

## Contributing

1. Fork it ( https://github.com/ucmsky/kemalblog/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [ucmsky](https://github.com/ucmsky) ucmsky - creator, maintainer
