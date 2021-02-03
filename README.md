# stroop_task
Stroop experiment with an emotional component

The mainscript to run the program is stroop_task.m

The program consists of 6 functions and one script to run the experiment and create the dataset.

The regular_condition.m and emotional_condition.m functions represent the two parts of the experiment. Through this design, we not only achieve an easy overview of the conditions, but we can also alter them in isolation or add new conditions. Each of the two functions contains the respective words for their part and randomly passes them to the words.m function. 

The words.m function is responsible for displaying the coloured words of the experiment to the user. The do_the_experiment.m function captures the key user measurements of the experiment. The words and do_the_Experiment.m are therefore complementary in displaying the experimental stimuli and then capturing the measurements.

The script determines which conditions are run by the core experimental functions and saves the data into a structure. The ones_and_zeros.m function is important in ensuring that there is a 50% probability of congruent trials over the given amount of trials per condition. The show_text.m function serves the purpose of keeping long strings to be displayed to the user concisely and in one place, while also not crowding the script.
