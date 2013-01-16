%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @doc Resolve session-siblings by merging their states.
%%% Note that we do NOT merge engines, i.e. we assume that the merged session
%%% is resumed at a specific label.
%%% @copyright 2012 Klarna AB
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%%   Copyright 2011-2013 Klarna AB
%%%
%%%   Licensed under the Apache License, Version 2.0 (the "License");
%%%   you may not use this file except in compliance with the License.
%%%   You may obtain a copy of the License at
%%%
%%%       http://www.apache.org/licenses/LICENSE-2.0
%%%
%%%   Unless required by applicable law or agreed to in writing, software
%%%   distributed under the License is distributed on an "AS IS" BASIS,
%%%   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%%   See the License for the specific language governing permissions and
%%%   limitations under the License.
%%%

%%%_* Module declaration ===============================================
-module(rimu_resolver_session).
-behaviour(meshup_resolver).

%%%_* Exports ==========================================================
-export([ resolve/2
        ]).

%%%_* Includes =========================================================
-include_lib("tulib/include/logging.hrl").
-include_lib("tulib/include/prelude.hrl").

%%%_* Code =============================================================
resolve(Session1, Session2) ->
  case ?lift(meshup_sessions:merge(Session1, Session2)) of
    {ok, _} = Ok -> Ok;
    {error, Rsn} -> {error, {session, Rsn}}
  end.

%%%_* Tests ============================================================
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-endif.

%%%_* Emacs ============================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End:
