videoObj = './data/eye.avi' ;%VIDEO IN PATH

%outputVideo = VideoWriter('./data/cutted_eye.avi');%VIDEO OUT PATH thelei diaforetika out ka8e fora

notchFreq = 120; %Hz (Flicker noise from light)
BW = 0.05;
FR = 500; %of Video

startingFrame = 1;  
endingFrame = VideoReader(videoObj).NumFrames;


% Call the CaptureOnlySelectedPlace function
%outputCaptureOnlySelectedPlaceVideo = VideoWriter('./data/CaptureOnlySelectedPlaceVideo_eye.avi');
outputCaptureOnlySelectedPlaceVideo = './data/CaptureOnlySelectedPlaceVideo_eye.avi';
CaptureOnlySelectedPlace(videoObj, outputCaptureOnlySelectedPlaceVideo);

% Call the AppNotchFilter function
%outputAppNotchFilterVideo = VideoWriter('./data/AppNotchFilterVideo_eye.avi');
outputAppNotchFilterVideo = './data/AppNotchFilterVideo_eye.avi';
videoObj = outputCaptureOnlySelectedPlaceVideo;
AppNotchFilter(videoObj, outputAppNotchFilterVideo, notchFreq, BW, FR);

% Call the ScalingVideo function
%outputScalingVideo = VideoWriter('./data/outputScalingVideo_eye.avi');
outputScalingVideo = './data/outputFinal_eye.avi';
videoObj = outputAppNotchFilterVideo;
scalingVideo(videoObj, outputScalingVideo, startingFrame,endingFrame);

disp('All functions have been called.');
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.