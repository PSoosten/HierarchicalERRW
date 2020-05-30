clear all; close all; clc;

% Settings
C = 0.8;              % Dimension parameter D = 2/C
C_2 = 1.2;            % Give a new C after transversal (reinforcement parameter)
N = 12;               % Run on 2^N Sites
TotalSteps = 10000;   % Number of steps to take


% Compute the layer coefficients according to dimension
P = 2.^(-(1+C) .* (1:(N+1)) );


% Initialize layers of hierarchical transition matrix to all have weight 1
Layers = zeros(N+1, 2^N, 2^N);
for R = 1:N+1
    for Lower = 1:2^(R-1):2^N
        Upper = Lower + 2^(R-1) - 1;
        Layers(R,Lower:Upper,Lower:Upper) = ones(2^(R-1), 2^(R-1));
    end
end


% Perform the walk
Walk = ones(1, TotalSteps);
for Step = 2:TotalSteps
    % Compute the transition probabilities at Walk(Step)
    Dist = P * squeeze(Layers(:, Walk(Step-1), :));
    Dist = Dist/sum(Dist);

    % Sample the next step of the walk
    CDF = cumsum(Dist);
    U = rand();
    Walk(Step) = find(CDF >= U, 1, 'first');
    
    % Find the smallest layer coupling Walk(Step-1) and Walk(Step)
    R = find(Layers(:, Walk(Step-1), Walk(Step)), 1, 'first');
    
    % And update it if we have not traversed the layer
    if Layers(R, Walk(Step-1), Walk(Step)) == 1
        % Find the indices of the block in layer R that contains 
        % Walk(Step) and Walk(Step-1)
        Lower = Walk(Step) - mod(Walk(Step) - 1, 2^(R-1));
        Upper = Lower + 2^(R-1) - 1;
        % Increase the prefactor linearly
        % Layers(R, Lower:Upper, Lower:Upper) = (1 + A)*ones(2^(R-1), 2^(R-1));
        % Decrease the C parameter
        Layers(R, Lower:Upper, Lower:Upper) = (2^((C_2 - C)*R))*ones(2^(R-1), 2^(R-1));
    end
    
    % Display the time here and there
    if mod(Step, 1000) == 0
        fprintf('Step = %d\n', Step);
    end
end


% Plot the trajectory and the local times and the running maximum
figure; plot(Walk);
xlabel('Step'); ylabel('Position'); title('Trajectory');
figure; histogram(Walk, 100);
xlabel('Position'); ylabel('Local Time'); title('Local Times');
figure; plot(cummax(Walk));
xlabel('Step'); ylabel('Running Maximum'); title('Running Maximum');
