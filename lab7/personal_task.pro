max(X, Y, Max) :- (X >= Y -> Max = X ; Max = Y).

tree_height(empty, 0, []).
tree_height(node(Value, Left, Right), Height, LongestPath) :-
    tree_height(Left, LeftHeight, LeftPath),
    tree_height(Right, RightHeight, RightPath),
    (
        LeftHeight > RightHeight ->
            LongestPath = [Value|LeftPath];
            LongestPath = [Value|RightPath]
    ),
    max(LeftHeight, RightHeight, MaxHeight),
    Height is MaxHeight + 1.


main :-
    Tree = node(5,
        node(3,
            node(1, empty, empty),
            node(4, empty, empty)
        ),
        node(8,
            node(7, node(7, 
                    empty, 
                    node(1, empty, empty)
                ), 
                empty
            ),
            node(9, empty, empty)
        )
    ),
        
    tree_height(Tree, Height, LongestPath),
    write(Height), nl,
    write(LongestPath), nl.
    