clc;
clear;
dt = 0.1;

bodies(1) = addBody(1.989 * 10^29	,[0 0 0]              , [0 0 0]); %sun
bodies(2) = addBody(3.285 * 10^23   ,[57.91*10^6 0 0]     , [0 480000 0]); % mercury
bodies(3) = addBody(4.870 * 10^24   ,[1.082*10^8 0 0]     , [0 350000 0]); % venus
bodies(4) = addBody(5.976 * 10^24   ,[1.496*10^8 0 0]     , [0 290000 0]); % earth
% bodies(5) = addBody(1.90  * 10^27   ,[7.786*10^8 0 0]   , [0 130000 0]); %jupiter

n = length(bodies);

axis([-1 1 -1 1 -1 1])
xl = [-5*10^8 5*10^8]; yl = [-5*10^8 5*10^8]; zl = [-10 10];
%xl = [-9*10^8 9*10^8]; yl = [-9*10^8 9*10^8]; zl = [-10 10]; % if uncomment jupiter
xlim(xl); ylim(yl); zlim(zl);

grid on; hold on;

n_step = 100000;
spot = plot([],[]);

for i = 0:n_step
    bodies = update_bodies(bodies, dt);
    if mod(i,50)==0
        loc = reshape([bodies.pos],[3,n]);
        drawnow;
        plot3(loc(1,:),loc(2,:),loc(3,:),'.', 'MarkerSize', 5, 'Color', [.9 .69 .64])
        title(sprintf('Time elapsed: %0.5g', i))
        grid on;
        delete(spot);
        spot = plot3(loc(1,:), loc(2,:), loc(3,:), 'b.', 'MarkerSize', 17);
    end    
end
