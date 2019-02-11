%% Clear all variables
clear all;
clc;

%% Associate the two recorded videos to vidLeft and vidRight
vidLeft = VideoReader('Cam1_0001.avi');
vidRight = VideoReader('Cam2_0001.avi');

%% Create a 3D video 
writerObj = VideoWriter('Video_IN_3D.avi');
open(writerObj);
nFrames = vidLeft.NumberOfFrames;
vidHeight = vidLeft.Height;
vidWidth = vidLeft.Width;
movie3d(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

for k = 1 : nFrames
leftI3chan = read(vidLeft, k);
leftI = rgb2gray(leftI3chan);
RightI3chan = read(vidRight, k);
rightI = rgb2gray(RightI3chan);
movie3d(k).cdata = cat(3,rightI,leftI,leftI); % Line#: The main logic behind 3D video
writeVideo(writerObj,movie3d(k).cdata);
end

hf = figure;
set(hf, 'position', [150 150 vidWidth vidHeight]);
movie(hf, movie3d, 1, 30);
close(writerObj);

clear all;
clc;