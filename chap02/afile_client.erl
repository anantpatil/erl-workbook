-module(afile_client).
-export([ls/1, get_file/2]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive
        {Server, FileList} ->
            FileList
    end.

get_file(Server, FileName) ->
    Server ! {self(), {get_file, FileName}},
    receive
        {Server, Contents} ->
            Contents
    end.


