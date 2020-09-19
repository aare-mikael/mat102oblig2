function [PrimeList] = PrimesInInterval(lower, upper)
%Returns the list of primes in the interval from lower to upper
% lower must be greater than the square root of upper
smallPrimes = Eratosthenes(sqrt(upper));
numberOfPrimes = length(smallPrimes);
PrimeList = lower:upper;
for i =1:numberOfPrimes
    currentPrime = smallPrimes(i);
    % j*currentPrime is a non-prime in the interval
    for j = ceil(lower/currentPrime):floor(upper/currentPrime)
        PrimeList(1+currentPrime*j-lower) = 0;
    end
end
PrimeList = PrimeList(PrimeList~=0);
end

