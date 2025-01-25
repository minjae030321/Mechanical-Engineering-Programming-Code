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
