% %19.06.2018
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


clear all;
close all;
clc;
%---------------------------------------------------------------------------
i = imread('test3.bmp');
img=imresize(i,1);
figure; imshow(img);

tic

% STEP 1:Finding gravitational force images
%------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------
img1=im2double(img);

h=size(img1,1); 
w=size(img1,2);
med_f=zeros(h,w,3);
sum_f=zeros(h,w,3);
g=zeros(h,w,3);


   for i=2: (h-2);
        for j=2: (w-2);
        %  //First assignment for RGB values before each loop
        maskRed=zeros(1,9) ;
        maskGreen=zeros(1,9) ;
        maskBlue=zeros(1,9) ;
       
     
          for b=1:9;
          [x]=ikomsu(b,i);
          [y]=jkomsu(b,j);
         
                            red = img1(x,y,1); 
                            green = img1(x,y,2);
                             blue = img1(x,y,3); 
                        maskRed (b) =red;
                        maskGreen (b) =green;
                        maskBlue (b) =blue;
                         
          end
           med_f(i,j,1)=median(maskRed);
           med_f(i,j,2)=median(maskGreen);
           med_f(i,j,3)=median(maskBlue);
           mean_f(i,j,1)=mean(maskRed);
           mean_f(i,j,2)=mean(maskGreen);
           mean_f(i,j,3)=mean(maskBlue);
           sum_f(i,j,1)=sum(maskRed);
           sum_f(i,j,2)=sum(maskGreen);
           sum_f(i,j,3)=sum(maskBlue);
force=zeros(1,3);
force_sum=zeros(1,3);
final=zeros(1,3);
              for k=1:8
                    [force]=gravitationalforce(maskRed(9),maskGreen(9),maskBlue(9),maskRed(k),maskGreen(k),maskBlue(k));
                    
                   force_sum=force_sum+force;
                   
               end
final=((force_sum));
k1(i,j)=final(1,1);   
k2(i,j)=final(1,2); 
k3(i,j)=final(1,3); 
     end
end

 
% figure; imshow(k1); title('Red summary force');
% figure; imshow(k2); title('Green summary force');
% figure; imshow(k3); title('Blue summary force');
%-----------------------------------------------------------------
%------------------------------------------------------------------
% STEP 2:Image Enhancement
%------------------------------------------------------------------------------------------
%------------------------------------------------------------------------
T1=0.01;
T2=0.7;

  for i=2: (h-2);
        for j=2: (w-2);
            if (k1(i,j)<T1 )
            g(i,j,1)=mean_f(i,j,1);
            elseif (k2(i,j)<T1 )
            g(i,j,2)=mean_f(i,j,2);
            elseif ( k3(i,j)<T1)
            g(i,j,3)=mean_f(i,j,3);
            elseif((k1(i,j)>T1 & k1(i,j)<T2)) 
            g(i,j,1)=med_f(i,j,1)-(1.425*sum_f(i,j,1));
            elseif((k2(i,j)>T1 & k2(i,j)<T2)) 
            g(i,j,2)=med_f(i,j,2)-(1.425*sum_f(i,j,2));
            elseif((k3(i,j)>T1 & k3(i,j)<T2)) 
            g(i,j,3)=med_f(i,j,3)-(1.425*sum_f(i,j,3));  
            else
            g(i,j,1)=med_f(i,j,1)*(0.35*sum_f(i,j,1));
            g(i,j,2)=med_f(i,j,2)*(0.35*sum_f(i,j,2));
            g(i,j,3)=med_f(i,j,3)*(0.35*sum_f(i,j,3)); 
            end
        end
  end

  figure; imshow(g); title('Enhancement Image');
  %HISTOGRAMS OF INPUT AND OUTPUT IMAGES
  %------------------------------------------------------------------------------------------
  figure;
  rgbhist(img1,g);

%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%FUNCTIONS
function [x] = ikomsu( komsuno, i)


 if(komsuno ==1)
     x=i-1;
 elseif(komsuno ==2)
    x= i;
 elseif(komsuno ==3)
    x= i+1;
 elseif(komsuno ==4)
    x= i-1;
 elseif(komsuno ==5)
    x= i+1;
 elseif(komsuno ==6)
   x= i-1;
 elseif(komsuno ==7)
   x= i;
 elseif(komsuno ==8)
   x= i+1;
 else
    x=i;
 
 end


end

function [y] = jkomsu( komsuno, j )

 if(komsuno ==1)
    y= j-1;
 elseif(komsuno ==2)
    y= j-1;
 elseif(komsuno ==3)
   y= j-1;
 elseif(komsuno ==4)
   y= j;
 elseif(komsuno ==5)
   y= j;
 elseif(komsuno ==6)
   y= j+1;
 elseif(komsuno ==7)
   y= j+1;
 elseif(komsuno ==8)
   y= j+1;
 else
    y= j;
 
 end




end

