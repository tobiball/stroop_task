function [vector] = ones_and_zeros(vector_length)
%INPUT length of desired vector of zeros and ones
%OUTPUT vector of 50% ones and 50% zeros in random order

%% input check
if mod(vector_length,1) ~= 0
       error('Invalid input: %d', vector_length)
end

%% create random vector of zeros and ones
vec = zeros(1,vector_length);
vec(1:vector_length/2) = 1;
vector = vec(randperm(vector_length));