rs_compile_example_nif
============================

An example rust nif that implements `add/2`

The Cargo.toml value `lib.name` is the name of the nif to load in the erlang module. The first arg in `rustler_export_nifs!` must match the name of the erlang module that loads the nif.

## Toml Woes

Currently the `rs_complile` rebar3 plugin uses a non-super toml parser that does not due inline tables.

### TL;DR

put this in your `Cargo.toml`

```
[dependencies.rustler]
git = "https://github.com/hansihe/rustler"
[dependencies.rustler_codegen]
git = "https://github.com/hansihe/rustler"
```
