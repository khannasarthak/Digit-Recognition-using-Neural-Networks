function [correctlyClassified, classificationErrors] = validation(activation, hiddenWeights, outputWeights, inputValuesTest, labelsTest)


    testSetSize = size(inputValuesTest, 2);
    classificationErrors = 0;
    correctlyClassified = 0;
    
    for n = 1: testSetSize
        inputVector = inputValuesTest(:, n);
        outputVector = calculateNetInPut(activation, hiddenWeights, outputWeights, inputVector);
        
        class = decisionRule(outputVector);
        if class == labelsTest(n) + 1
            correctlyClassified = correctlyClassified + 1;
        else
            classificationErrors = classificationErrors + 1;
        end;
    end;
end

function class = decisionRule(outputVector)


    max = 0;
    class = 1;
    for i = 1: size(outputVector, 1)
        if outputVector(i) > max
            max = outputVector(i);
            class = i;
        end;
    end;
end

function outputVector = calculateNetInPut(activation, hiddenWeights, outputWeights, inputVector)

% 

    outputVector = activation(outputWeights*activation(hiddenWeights*inputVector));
end