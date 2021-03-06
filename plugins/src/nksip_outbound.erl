%% -------------------------------------------------------------------
%%
%% Copyright (c) 2013 Carlos Gonzalez Florido.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc NkSIP Outbound Plugin
-module(nksip_outbound).
-author('Carlos Gonzalez <carlosj.gf@gmail.com>').

-include("../include/nksip.hrl").

-export([version/0, deps/0, parse_config/1]).


%% ===================================================================
%% Plugin specific
%% ===================================================================

%% @doc Version
-spec version() ->
    string().

version() ->
    "0.1".


%% @doc Dependant plugins
-spec deps() ->
    [{atom(), string()}].
    
deps() ->
    [].


%% @doc Parses this plugin specific configuration
-spec parse_config(nksip:optslist()) ->
    {ok, nksip:optslist()} | {error, term()}.

parse_config(Opts) ->
    Supported = nksip_lib:get_value(supported, Opts),
    Opts1 = case lists:member(<<"outbound">>, Supported) of
        true -> Opts;
        false -> nksip_lib:store_value(supported, Supported++[<<"outbound">>], Opts)
    end,
    {ok, Opts1}.



%% ===================================================================
%% Public
%% ===================================================================


