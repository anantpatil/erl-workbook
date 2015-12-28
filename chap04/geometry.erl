-module(geometry).
-export([area/1, test/0]).

test() ->
    %% Following will just test using pattern matching.
    %% If the pattern matching itself fails, the tests fail.
    12 = area({rectangle, 3, 4}),  % , ends stmt in a function
    64 = area({square, 8}),
    test_worked.

%% The following method overloadings are clauses of a function defined
%% in the module. In general the clause order matters, they are evaluted
%% in the order in which they are defined; but here, the clauses are
%% matched with pattern (type of object for which area is calculated).
%% Here the order doesn't matter.

%% Semi colons separate the clauses and . + while space (\n in general)
%% will end the function.
area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;  % ; ends clauses
area({circle, Radius}) -> 3.14159 * Radius * Radius.


%% No clause for no pattern match (default clause). This way we will get
%% an error when something unintented is called.
