%%%-------------------------------------------------------------------
%% @doc hello_world_http_server public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_world_http_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([{'_', [{"/", hello_handler, []}]}]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{env => #{dispatch => Dispatch}}),
    hello_world_http_server_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(http).

%% internal functions
