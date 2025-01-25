% 파일 불러오기
data = load('ttt.txt');
disp(data);

% 읽어온 데이터를 변수로 할당
L = data(1);            % 막의 길이 m)
T0 = data(2);           % 초기 온도 (℃)
k = data(3);            % 열전도율 (W/m·K)
alpha = data(4);        % 열 확산계수 (m^2/s)
t = linspace(0, 100, 100); % 시간 (s)

x = linspace(0, L, 100); % 막의 길이에 대한 구간을 생성합니다.

% 온도 계산 함수 호출
T = calculateTemperature(L, T0, alpha, t, x);

% 그래프 출력 함수 호출
plotTemperatureProfile(x, T, t);
plotTemperatureSurface(x, t, T);

% 온도 계산 함수
function T = calculateTemperature(L, T0, alpha, t, x)
    T = zeros(length(t), length(x)); % 온도를 저장할 행렬을 초기화합니다.

    for i = 1:length(t)
        if mod(i, 10) == 0
            T(i, :) = T0 * exp(-alpha * pi^2 * t(i) / L^2) * sin(pi * x / L);
        else
            T(i, :) = T0 * exp(-alpha * pi^2 * t(i) / L^2) * cos(pi * x / L);
        end
    end
end

% 그래프 출력 함수
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
function plotTemperatureSurface(x, t, T)
    figure;
    X = repmat(x, numel(t), 1);
    Y = repmat(t', 1, numel(x));
    surf(X, Y, T');
    title('Temperature Surface over Time');
    xlabel('Position (m)');
    ylabel('Time (s)');
    zlabel('Temperature (℃)');
    colormap jet;
    colorbar;
end
