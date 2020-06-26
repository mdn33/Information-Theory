Implementation of algorithms for the course Information Theory and Applications, Politecnico di Torino, 2020

## Information Theory section
1. Implement a GUI accepting as inputs:
- a variable name
- an unnormalized pdf function of the previous variable name
- the parameters a, b specifying the variable range(a, b) outside of which the pdf is identically equal to 0
The output shall report
- the normalization factor of the pdf (i.e., the integral of the unnormalized pdf fromatob)
- the differential entropy corresponding to the normalized pdf
- the Gaussian upper bound.

2. Implement a GUI interface with the following characteristics:
- Consider three independent random variablesX, Y, Z
- The GUI accepts three ranges in Matlab notation, one for each random variable
- The GUI accepts the three unnormalized probability distribution and checks for the consistence of the input data after the normalization
- The GUI accepts a function f(X, Y, Z) in symbolic form 
- The GUI calculates and reports the entropies of the random variables and of the specifiedfunctionf(X, Y, Z)
- The GUI checks all the possible inequalities relevant to the calculated entropies and reports the results.

3. Implement a GUI interface with the following characteristics:
- It accepts a character range such asabcdefas an input alphabet
- It accepts a probability distribution for the input alphabet above, possibly unnormalized and,in that case, it normalizes it
- It accepts an arbitrary input string such asabba
- It outputs the corresponding binary string obtained by applying an arithmetic code to the input string

## Applications section
1. Viterbi. Write a Matlab program which plots the Bit Error Rate curve for Eb/N0 ranging from 0 to 5 d Bobtained by applying the Viterbi algorithm to a convolutional code

2. Belief Propagation. Write a Matlab program that:
    1. Accepts as inputs:
        - The error probability value p
        - The received vector c= (y1y2y3y4) 
    2. Computes the probabilities p(ci|y) i=1,2,3,4 by using:
        - A brute-force approach working on the entire codebook.
        - A factor graph approach
  
3. Decision Tree. Write a Matlab program that:
        - Builds a tree classifierbased on the information gain ratio.
        - Givena vector x = (x1,x2,x3) computes the corresponding class.
  
