-module(my_app_handler).
-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
        {ok, Req, undefined}.

handle(Req, State) ->
        {Method, Req2} = cowboy_req:method(Req),
        io:format("Metodo ~p", [Method]),
        {ok, Req3} = handle_request(Method, Req2),
        {ok, Req3, State}.

handle_request(<<"GET">>, Req) ->
    {MyVar, Req2} = cowboy_req:binding(myvar, Req),
    {ok, Req3} = cowboy_req:reply(200, [], MyVar, Req2),
    {ok, Req3}.

terminate(_Reason, _Req, _State) ->
        ok.

