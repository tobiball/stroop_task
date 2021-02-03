function [reactionTime, correct, button, fixationTime] = do_the_experiment(congruent, twist, practice)
%this function shows a word in a specific color and lets the participant give a response to the 
% question what colour they are seeing. Measures the reaction time and checks whether response was correct. 
%INPUT:
% aligned = 0 or 1
% twist = 0 or 1
% practice = 0 or 1

%% input check 
if ~ismember(twist,[0,1]) || ~ismember(congruent,[0,1]) || ~ismember(practice,[0,1])
   error('Invalid input: twist = %d, aligned = %d, practice = %d',  twist, congruent, practice)
end

%% call function 
%call previously made function to create the text figure
txt = text(0.5,0.5,'+');
txt = text(0.5,0.5,'+','FontSize',50,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle');
tic
pause(rand()+0.5)
fixationTime = toc;
pause(1)
set(txt,'Visible','off')
colour = words(congruent, twist, practice);
 
%start measuring the reaction time
tic
pause
 
% RT is computed from question to reaction whatever answer is correct or
%incorrect
reactionTime = toc;
cla %clear axes 
 
% save the button that was pressed
correct = 0;
button = lower(get(gcf, 'CurrentCharacter'));

%% determine correctness 
if ~ismember(button,{'r','y', 'b', 'c'})
    show_text('wrong')
elseif strcmp(button, colour) 
    correct = 1;
end

end

