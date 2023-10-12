% This function plots the marks on the board

% It takes in the row and column number as well as whose turn it is and
% corresponding info and outputs the updated board matrix and tictactoe
% board

function [row, column, mark, color, board, turn] = boardplot_YZ(row, column, mark, color, board, turn)
    % draw the board lines
    line([1, 1], [0, 3])
    line([2, 2], [0, 3])
    line([0, 3], [1, 1])
    line([0, 3], [2, 2])
    
    % set marks to a specific size
    sz = 10000;

    % plot the mark in the right spot, with the right mark and color based
    % on whose turn it is
    if row == 1 && column == 1
        scatter(0.5, 0.5, sz, mark, color)
        board(1,1) = turn;
    elseif row == 1 && column == 2
        scatter(1.5, 0.5, sz, mark, color)
        board(1,2) = turn;
    elseif row == 1 && column == 3
        scatter(2.5, 0.5, sz, mark, color)
        board(1,3) = turn;
    elseif row == 2 && column == 1
        scatter(0.5, 1.5, sz, mark, color)
        board(2,1) = turn;
    elseif row == 2 && column == 2
        scatter(1.5, 1.5, sz, mark, color)
        board(2,2) = turn;
    elseif row == 2 && column == 3
        scatter(2.5, 1.5, sz, mark, color)
        board(2,3) = turn;
    elseif row == 3 && column == 1
        scatter(0.5, 2.5, sz, mark, color)
        board(3,1) = turn;
    elseif row == 3 && column == 2
        scatter(1.5, 2.5, sz, mark, color)
        board(3,2) = turn;
    elseif row == 3 && column == 3
        scatter(2.5, 2.5, sz, mark, color)
        board(3,3) = turn;
    end
end