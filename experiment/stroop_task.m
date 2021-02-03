% this script runs an experiment consisting of a regular stroop task and an
% emotional stroop task (stroop task with a twist)

%% clean workspace
clear
close

%% enter subject id
subject_id = input('Subject number: ','s');

%% input check
if ~ismember(subject_id,['1','2'])
    error('You entred %d, the subject id should be 1 or 2',subject_id)
end

%% experimental configuration
% determine number of trials for each experimental condition
practice_trials = 20;
required_correct_trials = 6;
regular_trials = 30;
priming_trials = 20;
emotional_trials = 30;

%% figure configuration
fig = figure('Name','STROOP TASK','NumberTitle','off'); %name figure, remove numbering
set(gca,'visible','off'); % turn off grid
set(gcf,'Color','k') %background black
set(fig,'units','normalized','outerposition',[0 0 1 1],'MenuBar', 'none','ToolBar', 'none') 

%% structure configuration
%predetermine structure size
data_size = 80;
data(data_size) = struct();

%% regular stroop
%Phase 1: Practice Trials
congruence_vector = ones_and_zeros(practice_trials);
twist = 0;
practice = 1;
correct_counter = zeros(1,2); %set empty vector for counting correct practice trials for different conditions
show_text('intro');
%while loop sets break-condition for practice session, nested for loop is
%one round of practice
while min(correct_counter) < required_correct_trials %break-condition for practice trials
    for congruent = congruence_vector %iterates through items in congruation vector
        [reactionTime, correct, button] = do_the_experiment(congruent,twist,practice);
        if correct == 1
            text_correct = text(0.5,0.5,'CORRECT','FontSize',50,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle');
            correct_counter(congruent + 1) = correct_counter(congruent + 1) + 1; %adds to correct_counter
        else
            text_correct = text(0.5,0.5,'INCORRECT','FontSize',50,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle');
        end
        pause(1)
        set(text_correct, 'Visible', 'off')
    end
end

%Phase 2: Experiment
congruence_vector = ones_and_zeros(regular_trials);
practice = 0;
vector_position = 1;
total_trials = regular_trials + priming_trials + emotional_trials; %trials for all conditions
show_text('experiment');

%loop through conditions and save data in struct
for nTrial = 1:total_trials
    congruent = congruence_vector(vector_position);
    [reactionTime, correct, answer, fixationTime] = do_the_experiment(congruent,twist,practice);
    data(nTrial).subject_id = subject_id;
    data(nTrial).trial_id = nTrial;
    data(nTrial).twist = twist;
    data(nTrial).practice_or_priming = practice;
    data(nTrial).congruent = congruent;
    data(nTrial).answer = answer;
    data(nTrial).correct = correct;
    data(nTrial).reactionTime = reactionTime;
    data(nTrial).fixationTime = fixationTime;
%Increase index integer for the vector which decides congruency condition for
%next trial
    vector_position = vector_position + 1;
%if-statement determines, if trial threshhold for next condition is met   
    if nTrial == regular_trials
        twist = 1;
        practice = 1;
        congruence_vector = ones_and_zeros(priming_trials);
        vector_position = 1;
    elseif nTrial == regular_trials + priming_trials
        practice = 0;
        congruence_vector = ones_and_zeros(emotional_trials);
        vector_position = 1;
    end
end 

%% Save
file_name = strcat('subject_',subject_id, '_.mat');
save (file_name, 'data')
show_text('outro')
close