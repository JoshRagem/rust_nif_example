-module(rs_compile_example_add).
-export([init/1, add/2, panic/0]).

-define(LIBNAME, "librs_compile_example_nif").

init(App) ->
    SoName = case code:priv_dir(App) of
                 {error, bad_name} ->
                     case filelib:is_dir(filename:join(["..", priv])) of
                         true ->
                             filename:join(["..", priv, ?LIBNAME]);
                         _ ->
                             filename:join([priv, ?LIBNAME])
                     end;
                 Dir ->
                     filename:join(Dir, ?LIBNAME)
             end,
    ok = erlang:load_nif(SoName, 0).


add(N,N) ->
    erlang:error(not_implemented).

panic() ->
    erlang:error(not_implemented).
