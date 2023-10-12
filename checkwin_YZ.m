% This function checks to see if anyone has won yet

% It takes in the board matrix and outputs 1 if firstplayer wins, 2 if
% secondplayer wins, or 0 for no win yet

function [result] = checkwin_YZ(board)
    % initialize result as default no win
    result = 0;
    
    % loop 1-3
    for i = 1:3
        % Check for horizontal wins
        % if all the numbers in a row are a 1, firstplayer wins
        if board(i, :) == 1
            result = 1;
        % if all the numbers in a row are a 2, secondplayer wins
        elseif board(i, :) == 2
            result = 2;
        end

        % Check for vertical wins
        % if all the numbers in a column are a 1, firstplayer wins
        if board(:, i) == 1 
            result = 1;
        % if all the numbers in the column are a 2, secondplayer wins
        elseif board(:, i) == 2
            result = 2;
        end
    end
    
    % Check for diagonal wins
    % bottom left to top right win check
    if board(1, 1) == 1 && board(2, 2) == 1 && board(3, 3) == 1
        result = 1;
    elseif board(1, 1) == 2 && board(2, 2) == 2 && board(3, 3) == 2
        result = 2;
    end
    
    % top left to bottom right check
    if board(3, 1) == 1 && board(2, 2) == 1 && board(1, 3) == 1
        result = 1;
    elseif board(3, 1) == 2 && board(2, 2) == 2 && board(1, 3) == 2
        result = 2;
    end
end