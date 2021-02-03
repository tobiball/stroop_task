function [colour, colour_word] = emotional_condition(congruent,priming)
%INPUT boolean congruent
%OUTPUT colour, word congruent or not congruent depending on INPUT

%% input check
if ~ismember(congruent,[0,1]) || ~ismember(priming,[0,1]) 
   error('Invalid input: %d,%d', congruent, priming)
end

%% configuration
colours = {'r','y','b','c'};
priming_words = {'ANGER','JOY','RELIEF','PLEASURE'};
emotional_words = {'RAGE','HAPPINESS','REASSURANCE','FULFILLMENT'};
neutral_words = {'ARMCHAIR','STOOL','HAMMOCK','BENCH'};

rnd_col = randi(4);
rnd_colword = rnd_col;

%% incongruent condition
if congruent == 0
    %random ineger for rnd_colword unitl unequal to rnd_col
    while rnd_col == rnd_colword 
        rnd_colword = randi(4);
    end
    priming_words = neutral_words;
    emotional_words = neutral_words;
end

%% output
colour = colours{rnd_col};
% choose priming words or emotional words ddepending on condition
if priming
    colour_word = priming_words{rnd_colword};
else
    colour_word = emotional_words{rnd_colword};
end