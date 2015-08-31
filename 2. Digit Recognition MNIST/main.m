% Load MNIST dataset.
inputValues = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
    
% Transform the labels to correct target values.
targetValues = 0.*ones(10, size(labels, 1));
for n = 1: size(labels, 1)
    targetValues(labels(n) + 1, n) = 1;
end;

%HiddenUnits
hiddenUnits = 100;

batchSize = 100;

epochs = 500;

alpha = 0.1;

activation = @sigmoid;
dactivation = @dsigmoid;

[hiddenWeights,outputWeights,error]=trainNet(activation,dactivation,inputValues,targetValues,batchSize,hiddenUnits,epochs,alpha);

dlmwrite('hiddenW.txt',hiddenWeights)
dlmwrite('outputW.txt',outputWeights)


inputValuesTest = loadMNISTImages('t10k-images.idx3-ubyte');
labelsTest = loadMNISTLabels('t10k-labels.idx1-ubyte');

[correctlyClassified, classificationErrors] = validation(activation, hiddenWeights, outputWeights, inputValuesTest, labelsTest)

fprintf('Classification errors: %d\n', classificationErrors);
fprintf('Correctly classified: %d\n', correctlyClassified);



