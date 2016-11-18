%% Predator-prey relationship script which plots predators vs time and prey vs time
function Predator_Prey_function(time)
close all 
global t;   %Define t as global variable taking input argument time as t
global Slider1; %Define this to be global so subfunction can see slider
global Slider2;

% Make a large figure.
figure('position',[0 0 700 500],'name','Predator vs Prey'...
      ,'NumberTitle','off');

% Make subplot to hold plot.
h = subplot('position',[0.1 0.3 0.8 0.6]);

% Just some descriptive text. 
uicontrol('Style', 'text', 'String', 'Parameter Alpha',...
    'Position', [150 100 90 30]);
uicontrol('Style', 'text', 'String', 'Parameter Beta',...
    'Position', [150 50 90 30]);

% A slider for varying the parameter.
Slider1 = uicontrol('Style', 'slider', 'Min',0,'Max', 100,...
    'Position', [250 100 200 30], 'Callback', @PlotGUI);
Slider2 = uicontrol('Style', 'slider', 'Min',0,'Max', 100,...
    'Position', [250 50 200 30], 'Callback', @PlotGUI);

%% Specify default time value in case no input argument is given
if nargin == 0
    time = 100;
end

%% defining t as input argument time
t = time; 

%% Function to plot the graph of time vs predator and prey populations
function PlotGUI(hObject, eventdata) 
global Slider1;% Slider is a handle to the slider.
global Slider2;
global t;       %Now we can incorporate input variable time into this function

%% Gets the value of the parameter from the slider.
Param_a = get(Slider1, 'Value'); %Initial value for predator population at t=0
Param_b = get(Slider2, 'Value'); %Initial value for prey population at t=0
% Puts the value of the parameter on the GUI.
uicontrol('Style', 'text', 'String', num2str(Param_a),...
    'Position', [460 105 60 20]);
uicontrol('Style', 'text', 'String', num2str(Param_b),...
    'Position', [460 55 60 20]);

%% 
x = (0:1:t); %specify time range for which to run the model

%% Setting Parameters for t=0 for predator and prey to be represented by a vector y0
y0 = [Param_a, Param_b];

%% Diff_eq represents a pair of coupled differential equations; y(1) holds the predator values,
% y(2) holds the prey values, x represents the time
diff_eq = @(x,y) [y(1)*(1-y(2)); y(2)*(y(1)-1)]; 
[x,y] = ode45(diff_eq, x, y0);


plot(x,y(:,1),'r-');
hold on
plot(x, y(:,2), '--');
legend('Predator', 'Prey')
xlabel('Time'); ylabel('Predator and Prey Populations');
hold off