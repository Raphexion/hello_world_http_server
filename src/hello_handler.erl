%%%-------------------------------------------------------------------
%% @doc hello_world_http_server public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_handler).

-export([init/2]).

init(Req0, Opts) ->
  Headers = #{<<"content-type">> => <<"text/plain">>},
  Body = <<"Hello from Erlang!">>,

  Req = cowboy_req:reply(200, Headers, Body, Req0),

  {ok, Req, Opts}.
