function phase_plot_2_interactive(f, range, simtime, figtitle, resolution, scale)
% Interactive phase portrait plot for a SECOND order ODE
% f is the system function that will besolve using ode45, it must return 
%     a column vector (2x1).
%
% range is the limits for the axes ([xmin xmax; ymin ymax])
%
% simtime is the simulation time
%
% resolution is used to define how many arrwos will be drawn
%     (horizontal resolution (the x-axis) x vertical resolution (the y-axis))
%
% scale is used to adjust the dimension of the arrows
%     this corresponds to the AutoScale property of the quiver function
%
% References:
%     http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/

if nargin < 6
    scale = 0.5;
end

if nargin < 5
    scale = 0.5;
    resolution = [20 20];
end

if nargin < 4
    scale = 0.5;
    resolution = [20 20];
    figtitle = '';
end

set(0,'defaulttextInterpreter','latex') %latex axis labels

%% Vector field
    x1 = linspace(range(1, 1), range(1, 2), resolution(1));
    x2 = linspace(range(2, 1), range(2, 2), resolution(2));

    [X1, X2] = meshgrid(x1, x2);
    u = zeros(size(X1));
    v = zeros(size(X2));

    t = 0; 
    for i = 1:numel(X1)
        X_DOT = f(t,[X1(i); X2(i)]);
        Vmod = sqrt(X_DOT(1)^2 + X_DOT(2)^2);
        u(i) = X_DOT(1)/Vmod;
        v(i) = X_DOT(2)/Vmod;
    end

    % Drawing
    h = figure;
    hq = quiver(X1, X2, u, v, 'r'); 
    hq.AutoScaleFactor = scale;
    hold on;
    xlabel('$x$', 'interpreter', 'latex')
    ylabel('$y$', 'interpreter', 'latex')
    axis tight equal;
    xlim(range(1,:));
    ylim(range(2,:));
    title(figtitle, 'interpreter', 'latex');

%%  For current initial values
    while ishandle(h)
        try
            x0 = ginput(1);
        catch
            break;
        end
        
        [~, x] = ode45(f, 0:0.01:simtime, x0); % ode45 at 1 khz
        plot(x(:,1), x(:,2), 'b', 'LineWidth', 2);
        plot(x(1,1), x(1,2), 'om')
    end
end

