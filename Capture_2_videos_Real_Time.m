%% Should Clear all variables first
clear all 
clc

%% Assigning the two webcams or cameras to vid1 and vid2 variables
vid1 = videoinput('winvideo', 1, 'YUY2_640x480');
vid2 = videoinput('winvideo', 2, 'YUY2_640x480');

src2 = getselectedsource(vid2);
src1 = getselectedsource(vid1);

%% Frames Per Trigger means how many seconds can you record 
% For example : The processor can read or display 30 images(frames) per second one after one.
% So if we devide 200/30 it will be 7 seconds approximately
vid2.FramesPerTrigger = 200;
vid1.FramesPerTrigger = 200;

%% Choising RGB color
vid2.ReturnedColorspace = 'rgb';
vid1.ReturnedColorspace = 'rgb';

%% Register the videos  into hard disk
vid2.LoggingMode = 'disk';
vid1.LoggingMode = 'disk';

%% Save them into a directory
diskLogger2 = VideoWriter('C:\Users\Jayef\Documents\MATLAB\AhouziProject\Cam2_0001.avi', 'Uncompressed AVI');
diskLogger1 = VideoWriter('C:\Users\Jayef\Documents\MATLAB\AhouziProject\Cam1_0001.avi', 'Uncompressed AVI');

vid2.DiskLogger = diskLogger2;
vid1.DiskLogger = diskLogger1;

%% Preview the two videos 
preview(vid2);
preview(vid1);

%% Start recording
start(vid2);
start(vid1);

clear all
clc

