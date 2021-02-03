function [] = show_text(s)
%INPUT string that indicates which text to display
%Displays text based on the input string

%% strings to be displayed
if strcmp(s,'intro')
    txt = {
             'Welcome to this behavioural experiment!'
             'Please indicate the colour that the following words are in'
             'When the colour is yellow press y'
             'When the colour is blue, press b'
             'When the colour is cyan press c'
             'When the colour is red press r'
             ''
             'You will start with some practice runs.'
             'Unlike in the experiment you will know, if you were correct here.'
             ''
             'You will be informed once the experiment starts.'
             ''
             'Whenever there is instructions on the screen,'
             'press any key to continue.'
             };
         
elseif strcmp(s,'experiment')
    txt = {
             'The experiment starts now!'
             'Press any key to continue.'
                        };
elseif strcmp(s,'wrong')
    txt = {
             'You pressed a wrong key, make sure to only press the button'
             'that corresponds to the given color.'
             'Press any key to start the next trial.'
             };
         
elseif strcmp(s,'outro')
    txt = {
             'The experiment has now ended.'
             ''
             'Thank you for your contribution to science :)'
             };
end

%% text display
txt_dsp = text(0,0.6,txt,'FontSize',30,'Color','w'); %text configuration
pause
set(txt_dsp, 'Visible', 'off')
end

