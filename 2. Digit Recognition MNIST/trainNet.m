function [hiddenWeights,outputWeights,error] = trainNet(activation,dactivation,inputValues,targetValues,batchSize,hiddenUnits,epochs,alpha)

trainSetSize = size(inputValues,2);

inputVectorSize = size(inputValues,1);

outputVectorSize = size(targetValues,1);


hiddenWeights = rand(hiddenUnits,inputVectorSize);
outputWeights = rand(outputVectorSize,hiddenUnits);

  hiddenWeights = hiddenWeights./size(hiddenWeights, 2);
    outputWeights = outputWeights./size(outputWeights, 2);

n = zeros(batchSize);

figure; hold on;


for i=1:epochs
    for j=1:batchSize
        
        
        n(j) = floor(rand(1)*trainSetSize + 1); % choosing inputVector
        %n(j) = j;
        
            inputVector = inputValues(:, n(j));
            hiddenActualInput = hiddenWeights*inputVector; % zin
            hiddenOutputVector = activation(hiddenActualInput); %f(zin)
            
            outputActualInput = outputWeights*hiddenOutputVector; %yin
            outputVector = activation(outputActualInput); %f(yin)
            
            targetVector = targetValues(:, n(j));
            
            % Backpropagating the errors.
            outputDelta = dactivation(outputActualInput).*(outputVector - targetVector) % (tk-yk)*f'(yin)
            hiddenDelta = dactivation(hiddenActualInput).*(outputWeights'*outputDelta)  % del*w*f'(zin)
            
            %updating weights:
            outputWeights = outputWeights - alpha.*outputDelta*hiddenOutputVector'; % alpla*del*xi
            hiddenWeights = hiddenWeights - alpha.*hiddenDelta*inputVector'; % alpha*del*zi
             
        
    end;
    
    error = 0;
    for j = 1:batchSize
          inputVector = inputValues(:, n(j));
          targetVector = targetValues(:, n(j));
          
          error = error + norm (activation(outputWeights*activation(hiddenWeights*inputVector))-targetVector,2); % error = error + f(w*f(h*x)-y)^2 ; MSE
    end;
    error = error/batchSize;
    plot(i,error,'*');

    
end;
        
        

end
