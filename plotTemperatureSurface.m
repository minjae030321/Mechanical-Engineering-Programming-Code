function plotTemperatureSurface(x, t, T)
    figure;
    [X, Y] = meshgrid(x, t);
    surf(X, Y, T');
    title('Temperature Surface over Time');
    xlabel('Position (m)');
    ylabel('Time (s)');
    zlabel('Temperature (℃)');
    colormap jet;
    colorbar;
end
