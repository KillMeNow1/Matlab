function PredatorPreyGUI2()
    close all;

    % Make a large figure.
    window = figure('position',[0 0 800 400],'name','SimpleGUI With Button'...
          ,'NumberTitle','off');
    set(window, ...
        'DefaultUIPanelBackGroundColor', [0.95 0.95 0.95], ...
        'DefaultUIControlUnits', 'normalized', ...
        'DefaultAxesLooseInset', [0.00, 0, 0, 0], ... 
        'DefaultAxesUnits', 'normalized');
      
    % Set units to be normalized
    set(window, 'units','normalized');
    
    % Make subplot for prey
    plotTime = subplot('position',[0.05 0.35 0.4 0.6]);    
    set(get(plotTime,'XLabel'), 'String', 't' );    
    set(get(plotTime,'Title'), 'String', 'N(t) and P(t)' );    
    
    % Make subplot for predator
    plotNP = subplot('position',[0.55 0.35 0.4 0.6]);      
    set(get(plotNP,'XLabel'), 'String', 'P' );
    set(get(plotNP,'YLabel'), 'String', 'N' );        
    set(get(plotNP,'Title'), 'String', 'N(P)' );      
    
    % Text for initial prey
    TextSliderN = uicontrol('Style', 'text', 'String', 'N(0)',...
        'Position', [0 0.15 0.5 0.05]);
    % Text for initial predator
    TextSliderP = uicontrol('Style', 'text', 'String', 'P(0)',...
        'Position', [0.5 0.15 0.5 0.05]);

    % A slider for varying initial prey.
    SliderN = uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
        'Position', [0.05 0.05 0.4 0.1],...
        'Callback', @updateN);
    % A slider for varying initial predator.
    SliderP = uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
        'Position', [0.55 0.05 0.4 0.1],...
        'Callback', @updateP);
    
    % A button to run the sims.
    Button = uicontrol('Style', 'pushbutton', 'String', 'Run',...
        'Position', [0.45 0.05 0.1 0.1],'Callback', @PlotNP);

    % Called by SimpeGUIWithButton to do the plotting 
    % hObject is the button and eventdata is unused.
    function PlotNP(hObject, eventdata) 
        % Get the value of the parameter from the slider.
        alpha = get(SliderN, 'Value');
        beta = get(SliderP, 'Value');
               
        % Solve ODEs
        xspan = [0 10];
        y0 = [alpha beta];
        dydx = @(x,y) [y(1)*(1-y(2)); y(2)*(y(1)-1)];
        [x,y] = ode45(dydx, xspan, y0);

        % Plot results
        plot(plotTime,x,y(:,1), 'bo-');
        hold(plotTime,'on')
        plot(plotTime,x,y(:,2), 'ro-');
        hold(plotTime,'off')
        legend(plotTime,'N','P');
        plot(plotNP,y(:,2),y(:,1));
        
        % Update the plot title
        set(get(plotTime,'Title'), 'String', ['N(t) and P(t). N(0) = ' num2str(alpha) ', P(0) = ' num2str(beta)]);      
        set(get(plotNP,'Title'), 'String', ['N(P). N(0) = ' num2str(alpha) ', P(0) = ' num2str(beta)]);      
        
        % Label plot axis
        set(get(plotTime,'XLabel'), 'String', 't' );    
        set(get(plotNP,'XLabel'), 'String', 't' );        
    end

    function updateN(hObject, eventdata)
        newVal = get(SliderN, 'Value');
        set(TextSliderN, 'String', ['N(0) = ' num2str(newVal)]);
    end

    function updateP(hObject, eventdata)
        newVal = get(SliderP, 'Value');
        set(TextSliderP, 'String', ['P(0) = ' num2str(newVal)]);
    end
end