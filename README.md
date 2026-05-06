# Run Length Encoder

A simple Ruby utility for run-length encoding and decoding of strings.

## Usage

```sh
ruby run_length_encoder.rb -e 'aaaabbbcc'
# => 4_a3_b2_c

ruby run_length_encoder.rb -d '4_a3_b2_c'
# => aaaabbbcc
```

## Testing

```sh
rspec run_length_encoder_spec.rb
```
