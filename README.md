# Implemesh

Simple gem for digital signal processing.

## Installation

```
gem build implemesh.gemspec
gem install implemesh-0.0.1.gem
```

## Usage

Inside ```irb```:

```ruby
require 'implemesh'
first_signal = Implemesh::Generators::Sine.generate
second_signal = Implemesh::Generators::GaussianNoise.generate
third_signal = Implemesh::Operations::Addition.perform(first_signal, second_signal)
Implemesh::Comparators::MeanSquaredError.compare(first_signal, third_signal)
first_signal.variance
```

## Tests

```
rake
```
