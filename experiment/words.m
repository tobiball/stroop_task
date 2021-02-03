function [colour] = words(congruent, twist, practice)
%Stroop Task words 
%   This function randomly displays different words in different colours
%   If congruent then congruent = 1 , otherwise = 0, equally distributed
%   If twist then twist = 1, otherwise = 0
%   If practice trial then practice = 1, otherwise = 0

%% input check 
if ~ismember(twist,[0,1]) || ~ismember(congruent,[0,1]) || ~ismember(practice,[0,1]) 
   error('Invalid input: twist = %d, congruent = %d, practice = %d',  twist, congruent, practice)
end

%% create condition for figure
if twist == 0 
    [colour, word] = regular_condition(congruent);
else 
    [colour, word] = emotional_condition(congruent, practice);
end

%% word display
text(0.5,0.5,word,'FontSize',50,'Color',colour,'HorizontalAlignment','center','VerticalAlignment','middle');


end

