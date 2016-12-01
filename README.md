rs_compile_example
=====

An OTP application

This project does nothing except use the `rs_compile` rebar3 plugin to build a rust nif that implements `add/2`. The nif is used to add two numbers and the result is printed on application start.

Build
-----

    $ rebar3 compile
