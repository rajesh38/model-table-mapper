# ModelTableMapper

This gem allows you to list all **models** with the corresponding **tables** in the database.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'model_table_mapper'
```

And then execute:

    $ bundle

## Usage
__steps:__
1. Open rails console.
2. execute `ModelTableMapper list` to display the list of models with tables.
3. You can also provide a filename to output the list as a **csv**. Execute `ModelTableMapper list "model-table-list.csv"`. This will generate a csv file with teh given name containing the models with the corresponding tables.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/rajesh38/model_table_mapper](https://github.com/rajesh38/model_table_mapper). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

