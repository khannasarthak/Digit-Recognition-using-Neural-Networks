function y = readNew(imageFile)

imshow(imageFile);
hiddenWeights = dlmread('hiddenW.txt');
outputWeights = dlmread('outputW.txt');


k = imread(imageFile) %28x28 matrix
x  = reshape(k,784,1) %converting to 784x1
inputVector = 1-double(x)/255 % reducing values to 0-1 range, 0- white, 1- black



outputVector = sigmoid(outputWeights*sigmoid(hiddenWeights*inputVector));
max = 0;
pos = 0;
for i = 1:size(outputVector,1)
    if outputVector(i)>max
        max = outputVector(i);
        pos = i;
    end;
end;

outputVector

y = pos-1

    

end
