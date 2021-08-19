% Secant method
%
% Secant method is used to find the roots of a function. This is used to approximate
% roots by drawing secant lines. We start with two initial guesses for our x-values and
% use the root finding equation to find another x-value. Using this new x-value, we 
% continue this process until we get to a number that is close enough to the actual 
% value. The equation involves the two x-points as well as their respective y-values. 
% Parameters                 
% ==========                 
%    f         represents the respective y-values for the x-guesses
%    x0        initial guess 
%    x1        initial guess
%    eps_step  truncation error. This is calculated between two x-values to help 
% determine when we can stop
%    eps_abs   truncation error using absolute value
%    N_max     The number of iterations the program will do
%
% Return Values              
% =============
%    x2        This is the newest value of x that will be used the next time we iterate 
% through the equation. Every new x2 is a better guess and closer approximation to the 
% actual root

function [x2] = secant( f, x0, x1, eps_step, eps_abs, N_max )
    for i = 1: N_max
    
        x2= x1 - (f(x1))*((x1-x0)/(f(x1)-f(x0))); 
% secant method equation to find the best approximation
        
        if abs( x2 - x1 ) < eps_step && abs(f(x2)) < eps_abs
%checking to see if the error is small enough
            return;
       
            
        end
        
        x0=x1;%replacing old x1 value to be new x2
        x1=x2; %replacing old x2 value to be new x2
    end
    throw (MException('MATLAB:numeric_exception', 'MATLAB:stop')); 
    % error caused if one of the parameters wasn’t met
end

end
