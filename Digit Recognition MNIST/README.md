# Neural-Network to recognize digits
###Training a net to recognize handwritten digits using MNIST training date
Version 1 ( 31st August 2015) [ training done on a batch of 100 with 500 epochs]

## This code is free to use. If you are using this code kindly cite my [github](https://github.com/khannasarthak) and [linkedin](https://www.linkedin.com/in/sarthakkhanna) profiles in the references.


###Shortcomings in this version:

- 7 is always displayed 2
- 9 is some times displayed as 2 or 3

Correctly recognizes 1,2,3,4,5,6,8,0. This can be imporved by increaing batchSize and the number of Epochs

 THe results are better if we increase the batchSIze and the number of epochs, which resulted in only the number 7 not being recognised correctly.

  ##Functions explained:

  ###main.m

  The main function, does the following:
  - loads the MNIST training images and labels ( using helper functions)
  - initialises the number of hidden Units, batch size and learning rate alpha
  - calls the function to train the net [trainNet]
  - writes the hidden and output variables to a text file as CSV's
  - loads the MNIST validation images and labels
  - compares the output from our training set and the validation set
  - tells the number of correctly classified images and the errors

  ###sigmoid.m

  Returns the logistic sigmoid of the input, done element by element

  ###dsigmoid.m

  Returns the derivative of logistic sigmoid to use in Back Propagation

  ###trainNet.m

  Trains our neural net using Back Propogation and also using Batch training.

  In batch training the weights are updated batchSize times where random input vectors are chosen and the weights are decided.
  Epochs are the number of times the above procedure is repeated, generally, the more the number of epochs the lower the error rate.

  Function does the following:
  - implement batchwise backpropogation and generates weights
  - plots the Mean Square Error rate with respect to number of epochs

  ###validation.m

  It validates on the MNIST validation set. Does the folloing:
  - using the weights learned in trainNet.m, it predicts the validation set
  - gives the output as the class ( i.e the number that is written)

  ###readNew.m

  Takes in a 28x28 pixel grayscale image and classifies it as which number it is. Does the following:
  - reads image
  - read hidden weights written in CSV's earlier in trainNet.m
  - convert the image to a 784x1 input vector
  - using hidden and output weights, feeds forward the input to get the final output neuron values
  - gives the value that the net has recognised



 References : ([http://davidstutz.de/recognizing-handwritten-digits-mnist-dataset-twolayer-perceptron/](http://davidstutz.de/recognizing-handwritten-digits-mnist-dataset-twolayer-perceptron/))
