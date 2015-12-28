-module(total).
-export([total/1]).

total([{What, N}|T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.

%% Buy = [{oranges,4}, {newspaper,1}, {apples,10}, {pears,6}, {milk,3}].
%% total:total(Buy). % prints 123
