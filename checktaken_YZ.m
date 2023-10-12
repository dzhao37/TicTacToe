% This function ensures that marks do not overlap

% It takes in the board matrix and row and column numbers and outputs 1 if
% the spot is already taken or 0 if the spot is open

function [taken, r, c] = checktaken_YZ(board, r, c)
    % if the board matrix has a 1 or 2 in the spot requested, it's taken
    if board(r, c) == 1 || board(r, c) == 2
        taken = 1;
    else
        taken = 0;
    end
