function y = activationFunction(net_in)
if net_in>0
    y = 1;
elseif net_in==0
    y = 0;
elseif net_in<0
    y = -1;
end
end

        