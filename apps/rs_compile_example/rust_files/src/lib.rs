#![feature(plugin)]
#![plugin(rustler_codegen)]

#[macro_use]
extern crate rustler;
use rustler::{ NifEnv, NifTerm, NifResult, NifEncoder };

rustler_export_nifs!(
    "rs_compile_example_add",
    [("add", 2, add), ("panic", 0, panic)],
    None
);

fn add<'a>(env: &'a NifEnv, args: &Vec<NifTerm>) -> NifResult<NifTerm<'a>> {
    let num1: i64 = args[0].decode()?;
    let num2: i64 = args[1].decode()?;
    Ok((num1 + num2).encode(env))
}

fn panic<'a>(env: &'a NifEnv, args: &Vec<NifTerm>) -> NifResult<NifTerm<'a>> {
    panic!("this is a rust panic")
}
