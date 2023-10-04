max(X, Y, Max) :- (X >= Y -> Max = X ; Max = Y).

tree_height(empty, 0).
tree_height(node(_, Left, Right), Height) :-
    tree_height(Left, LeftHeight),
    tree_height(Right, RightHeight),
    max(LeftHeight, RightHeight, MaxHeight),
    Height is MaxHeight + 1.


main :-
    Tree = node(5,
        node(3,
            node(1, empty, empty),
            node(4, empty, empty)
        ),
        node(8,
            node(7, empty, empty),
            node(9, empty, empty)
        )
    ),
        
    tree_height(Tree, Height),
    write(Height).
    