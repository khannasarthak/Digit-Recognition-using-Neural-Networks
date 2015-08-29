%Defining inputs here
x = [1,1;-1,1;1,-1;-1,-1];

%Definig known output
t = [1,-1,-1,-1];

%learning rate
alpha = 1;

% initial weights
w = [0,0];
nw=[0,0];
i=1;
y = 0;
while y~=t(i)    
    net_in = x(i,1)*w(1)+x(i,2)*w(2)
    
    
    y= activationFunction(net_in)
    w(1) = w(1) + alpha*t(i)*x(i,1)
    w(2) = w(2) + alpha*t(i)*x(i,2)
    i=i+1;
end


