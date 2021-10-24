function phase_plot_1_interactive(f, range, simtime, figtitle, resolution, scale)
% Interactive phase portrait plot for a SECOND order ODE
% f is the system function that will besolve using ode45, it must return 
%     a column vector (2x1).
%
% range is the limit for the x-axis ([xmin xmax])
%
% simtime is the simulation time
%
% resolution is used to define how many arrwos will be drawn
%     (horizontal resolution (the time) x vertical resolution (the x-axis))
%
% scale is used to adjust the dimension of the arrows
%     this corresponds to the AutoScale property of the quiver function
%
% References:
%     http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/

if nargin < 6
    scale = 0.2;
end

if nargin < 5
    scale = 0.2;
    resolution = [simtime*2 20];
end

if nargin < 4
    scale = 0.2;
    resolution = [simtime*2 20];
    figtitle = '';
end

set(0,'defaulttextInterpreter','latex') %latex axis labels

%% Vector field
    t = linspace(0, simtime, resolution(1));
    x = linspace(range(1), range(2), resolution(2));

    dt = t(2) - t(1);

    [T, X] = meshgrid(t, x);
    u = zeros(size(T));
    v = zeros(size(X));

    t = 0; 
    for i = 1:numel(X)
        X_DOT = f(T(i), X(i));
        theta = atan(X_DOT);        
        u(i) = cos(theta);
        v(i) = sin(theta);
    end

    % Drawing
    h = figure;
    hq = quiver(T, X, u, v, 'r'); 
    hq.AutoScaleFactor = scale;
    hold on;
    xlabel('Time', 'interpreter', 'latex')
    ylabel('$x$', 'interpreter', 'latex')
    axis tight equal;
    xlim([0 simtime]);
    ylim(range);
    title(figtitle, 'interpreter', 'latex');

%%  For current initial values
    while ishandle(h)
        try
            x0 = ginput(1);
        catch
            break;
        end
        
        [t, x] = ode45(f, x0(1):0.01:simtime, x0(2)); % ode45 at 1 khz
        plot(t, x, 'b', 'LineWidth', 2);
        plot(t(1), x(1), 'om');

        if x0(1) > 0
            [t, x] = ode45(f, x0(1):-0.01:0, x0(2)); % ode45 at 1 khz
            plot(t, x, 'r', 'LineWidth', 2);
        end
    end
end

