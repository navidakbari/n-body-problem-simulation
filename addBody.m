function [newbody] = addBody(m, p, v)

    newbody.mass = m;
    newbody.pos = p;
    newbody.velocity = v; 
    newbody.acceleration = [0 0 0];
    newbody.force = [0 0 0];
    
end