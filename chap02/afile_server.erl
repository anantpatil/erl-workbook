-module(afile_server).
%-export([start/1]). % since spawn refers to run as public method from
                     % module, it is needed to be exported.
-export([start/1, run/1]).

start(Dir) -> spawn(afile_server, run, [Dir]).

run(Dir) ->
    receive
        {Client, list_dir} ->
            Client ! {self(), file:list_dir(Dir)};
        {Client, {get_file, FileName}} ->
            Full = filename:join(Dir, FileName),
            Client ! {self(), file:read_file(Full)}
    end,
    run(Dir).
