function bodies = update_bodies(bodies, dt)
    G = 6.67408*10^(-11);

    for i=1:length(bodies)
        for j=1:length(bodies)
            if i==j
                continue
            end
            r = bodies(i).pos - bodies(j).pos;
            R = norm(r);
            f = -(G*bodies(i).mass*bodies(j).mass)/(R^2);
            bodies(i).force = bodies(i).force + f.*(r./R); 
        end

        bodies(i).acceleration = bodies(i).force./bodies(i).mass;
        bodies(i).velocity = bodies(i).velocity + bodies(i).acceleration.*dt;
        bodies(i).pos = bodies(i).pos + bodies(i).velocity.*dt;

        bodies(i).force = [0,0,0];
    end
end