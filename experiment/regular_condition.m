function [colour, colour_word] = regular_condition(congruent)
%INPUT boolean alligned
%OUTPUT colour, word alligned or unalligned depending on INPUT
%% input check
if ~ismember(congruent,[0,1]) 
   error('Invalid input: %d', congruent)
end

%% configuration
colours = {'r','y','b','c'};
colour_words = {'RED','YELLOW','BLUE','CYAN'};

rnd_col = randi(4);
rnd_colword = rnd_col;

%% incongruent condition
if congruent == 0
    %random ineger for rnd_colword until unequal to rnd_col
    while rnd_col == rnd_colword 
        rnd_colword = randi(4);
    end
end

%% output
colour = colours{rnd_col};
colour_word = colour_words{rnd_colword};
end