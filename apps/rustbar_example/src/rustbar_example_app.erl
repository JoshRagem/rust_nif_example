%%%-------------------------------------------------------------------
%% @doc rustbar_example public API
%% @end
%%%-------------------------------------------------------------------

-module(rustbar_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    rustbar_example_add:init(rustbar_example),
    io:format("add=~p",[rustbar_example_add:add(2,2)]),
    rustbar_example_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
