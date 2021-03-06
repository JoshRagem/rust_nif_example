%%%-------------------------------------------------------------------
%% @doc rs_compile_example public API
%% @end
%%%-------------------------------------------------------------------

-module(rs_compile_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    rs_compile_example_add:init(rs_compile_example),
    io:format("add=~p",[rs_compile_example_add:add(2,2)]),
    try rs_compile_example_add:panic() of
        _ ->
            io:format("unreachable",[])
    catch error:nif_panic ->
            io:format("type=error reason=nif_panic rust error",[])
    end,
    rs_compile_example_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
