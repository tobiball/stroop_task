%this script plots the data from the emotional stroop task experiment
%for each dataset it will will create two plots:
%experimental analysis & trend analysis
%after every plot is created, the script will pause unitl button press

%% load data
clear
close

data_sets = {'subject_1_.mat','subject_2_.mat'}; % specify data sets

for ds = 1:2 %iterate through datasets (indexes)
    load(data_sets{ds})


    %% Extract data from structure
    RT = [data(:).reactionTime];
    congruency_data = [data(:).congruent];
    condition_data = [data(:).twist];
    priming = [data(:).practice_or_priming]; %priming information


    %% Filter and sort data
    condition_vec = [0, 1]; %emotional and regular condition
    congruency_vec = [0, 1]; %congruency
    reaction_times_matrix = zeros(15,4);
    means_vector = zeros(1:4);
    count = 0;
    for condition = condition_vec %iterating through regular (0) and emotional (1) condition
        for congrueny = congruency_vec  %iterating through congruent (1) and incongruent (0)
            rtcn = RT(condition_data == condition & congruency_data == congrueny & priming == 0); %apply logical indexing, exclude priming trials
            count = count + 1;
            means_vector(count) = mean(rtcn);
            reaction_times_matrix(:,count) = rtcn;
        end
    end

    %% Plot main analysis
    hold on
    plot(1,means_vector(1),'-b.',2,means_vector(2),'-r.',3,means_vector(3),'-c.',4,means_vector(4),'-m.','MarkerSize',40) %plot means
    plot(1,reaction_times_matrix(:,1),'bo',2,reaction_times_matrix(:,2),'ro',3,reaction_times_matrix(:,3),'go',4,reaction_times_matrix(:,4),'mo','MarkerSize',8) %plot reaction times
    set(gca,'xtick',[])
    xlim([0.5,4.5])
    ylim([0,6])
    xlabel('Conditions')
    ylabel('Reaction time in seconds')
    legend('Regular-Incongruent','Regular-Congruent','Neutral','Emotional-Congruent')
    title(strcat('Emotional Stroop Experiment Subject-',num2str(ds)))
    pause
    clf
    
    %% Plot trend analysis
    plot(1:15,reaction_times_matrix(:,1),'--b.',1:15,reaction_times_matrix(:,2),'--r.',1:15,reaction_times_matrix(:,3),'-c.',1:15,reaction_times_matrix(:,4),'-m.','MarkerSize',12) %plot trend
    xlim([1,15])
    ylim([0,6])
    xlabel('Trial Nr.')
    ylabel('Reaction time in seconds')
    legend('Regular-Incongruent','Regular-Congruent','Neutral','Emotional-Congruent')
    title(strcat('Emotional Stroop Trend Subject-',num2str(ds)))
    pause
    clf
end