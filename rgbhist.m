function varargout = rgbhist(I,Iout)
%RGBHIST   Histogram of RGB values.

if (size(I, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end
if (size(Iout, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end
nBins = 256;

rHist = imhist(I(:,:,1), nBins);
gHist = imhist(I(:,:,2), nBins);
bHist = imhist(I(:,:,3), nBins);

rHist_out = imhist(Iout(:,:,1), nBins);
gHist_out = imhist(Iout(:,:,2), nBins);
bHist_out = imhist(Iout(:,:,3), nBins);

%Input image curves
subplot(3,2,1);
h(1) = stem(1:256, rHist);
axis ([0 256 0 10000])
ylabel('\fontsize{12} RED');
title(['\fontsize{10} Original Image Histograms']);
subplot(3,2,3)
h(2) = stem(1:256, gHist);
axis ([0 256 0 10000])
ylabel('\fontsize{12} GREEN');
subplot(3,2,5)
h(3) = stem(1:256, bHist);
axis ([0 256 0 10000])
ylabel('\fontsize{12} BLUE');

set(h(1),'Color','r','LineWidth',1)

set(h(2),'Color','g','LineWidth',1)

set(h(3),'Color','b','LineWidth',1)

%Output image curves
subplot(3,2,2);
h(4) = stem(1:256, rHist_out);
axis ([0 256 0 10000])
title(['\fontsize{10} GF&LIN Image Histograms']);
subplot(3,2,4)
h(5) = stem(1:256, gHist_out);
axis ([0 256 0 10000])

subplot(3,2,6)
h(6) = stem(1:256, bHist_out);
axis ([0 256 0 10000])

set(h(4),'Color','r','LineWidth',1)

set(h(5),'Color','g','LineWidth',1)

set(h(6),'Color','b','LineWidth',1)

