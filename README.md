# Smart Pension logs parser
![ci](https://travis-ci.org/wh1le/smart-pension.svg?branch=master)
## Description
This program accepts server logs and provides analitycs from it.
## Instalation
Clone the repository.
```
$ git clone https://github.com/wh1le/smart-pension-logs.git
```
First make sure you have ruby-2.6.2 installed. If you have it
```
$ bundle install
```
## Usage
Implemented strategies: **popularity**, **popularity_uniquness**

```
$ ./bin/log_parser ./tmp/webserver.log popularity
```
## Testing
```
rspec
```
## Possible improvements
- [ ] Strategies
  - [ ] Add Parent class with common functionality
  - [ ] Add shared examples in RSpec
- [ ] Better Terminal User Interface
- [ ] Handle very large files
- [ ] Implement errors module, add messages to errors 

## License
MIT
