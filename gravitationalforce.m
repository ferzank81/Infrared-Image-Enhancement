function [force] = gravitationalforce( k, l, m, o, p, r)
% All rights reserved.
% This work should only be used for nonprofit purposes.
% Please cite the paper when you use this code:
% Katýrcýoðlu, F., Çay, Y., & Cingiz, Z. (2019). Infrared image enhancement model 
%  based on gravitational force and lateral inhibition networks. Infrared Physics & Technology, 100, 15-27.

%
% AUTHOR:
%     Ferzan Katýrcýoðlu,Duzce University, TURKEY.
%     email:katirciogluferzan@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 a=0;b=0;c=0;
 e=0.01;
 a=(abs(k-(o+e)))^2;
 b=(abs(l-(p+e)))^2;
 c=(abs(m-(r+e)))^2;
%  //Distance calculation according to the Euclidean relation
 dist1=sqrt(a);
 dist2=sqrt(b);
 dist3=sqrt(c);

%  //Calculation of similarity based on Exponential function

 force(1,1)=10*[(k+e)*(o+e)]/dist1;
 force(1,2)=10*[(l+e)*(p+e)]/dist2;
 force(1,3)=10*[(m+e)*(r+e)]/dist3;




end

