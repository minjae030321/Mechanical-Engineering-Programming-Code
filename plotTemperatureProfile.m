function plotTemperatureProfile(x, T, t)
    figure;
    hold on;
    for i = 1:length(t)
        plot(x, T(i, :));
    end
    hold off;
    title('Temperature Profile over Time');
    xlabel('Position (m)');
    ylabel('Temperature (℃)');
    legend(cellstr(num2str(t', 'Time = %.1f s')));
end
