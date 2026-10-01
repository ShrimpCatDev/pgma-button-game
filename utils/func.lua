function math.round(n)
    return math.floor(n+0.5)
end

function math.lerp(a,b,t,dt)
    return a+(b-a)*t*dt
end