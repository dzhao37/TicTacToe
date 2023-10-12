% MATLAB Lab #3
% TTT_ZhaoYang
% D. Zhao
% partner E. Yang

% 2/13/23
% GE 1501/1502
% MWH

% This program is an interactive tictactoe game



% closes all open figures
close all;

% clears the history of commands entered in the Command Window
clc;



% Introduction
disp('Welcome to Tic Tac Toe!')
pause(2);
fprintf('This game is brought to you by Edwin Yang and Daniel Zhao \n \n')
pause(3);

% Set names of the players
player1 = input('Player 1, please enter your name: ', 's');
pause(1);
player2 = input('Player 2, please enter your name: ', 's');
pause(1);

fprintf('\n ...Flipping coin to see who goes first... \n \n');
pause(3);



% Random coin toss to determine who goes first
first = randi(2);

% note: player1/2 is not the same thing as first/second player
% player1/2 is just the order of names inputted
% first/second player is based on who's assigned to go first

% if the random number is a 1 make player1 first
if first == 1
    firstplayer = player1;
    secondplayer = player2;
    fprintf('%s, you are first! \n', player1)
% otherwise the random number is a 2, so make player2 first
else
    firstplayer = player2;
    secondplayer = player1;
    fprintf('%s, you are first! \n', player2)
end

% firstplayer is always default x and secondplayer is always default o
fprintf('%s, you are x and %s, you are o \n \n', firstplayer, secondplayer)
pause(4);



% Introduce the rules
fprintf('********************************************************************************************* \n \n')
fprintf('Please take a moment to read the rules: \n \n')
pause(3);

fprintf('Get 3 in a row to win! \n')
fprintf('Coordinates in this game work just like they do in math \n \n')
fprintf('Example: (1, 1) would be the bottom left box whereas (2, 2) would \n')
fprintf('be the middle box. \n \n')
pause(8);
fprintf('********************************************************************************************* \n \n')



% ensure that the scatter plot points stack
hold on

% show players empty board
boardplot_YZ(0, 0, 'x', 'r', 0, 0);
% create a 3x3 matrix of 0s to store who goes where
board = zeros(3,3);
% initialize result to no-win-yet state
result = 0;
% initialize variable moves to determine when the board is filled
moves = 0;




% keep playing until someone wins or if there is no room left on the board
while result == 0 && moves < 9
    
    % firstplayer's turn
    
    % ask where they want to go
    r = input(sprintf('%s, choose what row you want: ', firstplayer));
    c = input(sprintf('%s, choose what column you want: ', firstplayer));
    fprintf('\n')



    % if statement guardrail to prevent indexing error
    if r >= 1 && r <= 3 && c>= 1 && c <= 3
        % check if the spot is taken
        [taken] = checktaken_YZ(board, r, c);
    end

    % ensures spot is in bounds and is open
    % if the position is out of bounds, keep asking for a new spot
    % or if the spot is taken, keep asking for a new spot
    while r < 1 || r > 3 || c < 1 || c > 3 || taken == 1
        if taken == 1
            fprintf('That spot is taken, please choose a new spot \n \n')
        else
            fprintf('Invalid position, please choose a new spot \n \n')
        end
        pause(2)
        
        r = input(sprintf('%s, choose what row you want: ', firstplayer));
        c = input(sprintf('%s, choose what column you want: ', firstplayer));
        fprintf('\n')
        
        % reset taken
        taken = 0;
        
        % if statement guardrail to prevent indexing error
        if r >= 1 && r <= 3 && c>= 1 && c <= 3
            % check if taken
            [taken] = checktaken_YZ(board, r, c);
        end
    end



    % firstplayer has red x marks
    mark = 'x';
    color = 'r';
    turn = 1;
    
    % plot the mark
    [r, c, mark, color, board, turn] = boardplot_YZ(r, c, mark, color, board, turn);
    % increment moves by 1
    moves = moves + 1;
    % update result to see if 1st player has won
    result = checkwin_YZ(board);
    
    % if 1st player won, display the win message
    if result == 1
        fprintf('Congratulations %s, you won! \n \n', firstplayer)
        pause(30);
        hold off
        break
    end
    
    % if there are no more spots left on the board and no one has won,
    % it's a tie
    if moves == 9
        fprintf('It''s a tie :/ \n \n')
        pause(30);
        hold off
        break
    end


    %**********************************************************************


    % second player's turn

    % ask where they want to go
    r = input(sprintf('%s, choose what row you want: ', secondplayer));
    c = input(sprintf('%s, choose what column you want: ', secondplayer));
    fprintf('\n')



    % if statement guardrail to prevent indexing error
    if r >= 1 && r <= 3 && c>= 1 && c <= 3
        % check if taken
        [taken] = checktaken_YZ(board, r, c);
    end

    % ensures spot is in bounds and is open
    % if the position is out of bounds, keep asking for a new spot
    % or if the spot is taken, keep asking for a new spot
    while (r < 1 || r > 3) || (c < 1 || c > 3) || taken == 1
        if taken == 1
            fprintf('That spot is taken, please choose a new spot \n \n')
        else
            fprintf('Invalid position, please choose a new spot \n \n')
        end
        pause(2)
        
        r = input(sprintf('%s, choose what row you want: ', secondplayer));
        c = input(sprintf('%s, choose what column you want: ', secondplayer));
        fprintf('\n')

        % reset taken
        taken = 0;

        % if statement guardrail to prevent indexing error
        if r >= 1 && r <= 3 && c>= 1 && c <= 3
            %check if taken
            [taken] = checktaken_YZ(board, r, c);
        end
    end



    % secondplayer has blue o marks
    mark = 'o';
    color = 'b';
    turn = 2;
    
    % plot the mark
    [r, c, mark, color, board, turn] = boardplot_YZ(r, c, mark, color, board, turn);
    % increment moves by 
    moves = moves + 1;
    % update result to see if 2nd player has won
    result = checkwin_YZ(board);

    % if 2nd player won, display the win message
    if result == 2
        fprintf('Congratulations %s, you won! \n', secondplayer)
        pause(30);
        hold off
        break
    end 
end