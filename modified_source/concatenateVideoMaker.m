vid1 = VideoReader('D:\diploma_thesis\Non Invasive Estimation of Intracranial Pressure\phaseBased\Release\data\rafaela clips\cutted_C0044.avi');
vid2 = VideoReader('D:\diploma_thesis\Non Invasive Estimation of Intracranial Pressure\phaseBased\Release\ResultsSIGGRAPH2013\cutted_C0044-differenceOfIIR-band35.00-50.00-sr1000-alpha100-mp0-sigma4-scale1.00-frames1-1092-quarterOctave.avi');
videoPlayer = vision.VideoPlayer;
% new video
outputVideo = VideoWriter('CompareVideo.avi');
outputVideo.FrameRate = vid1.FrameRate;
open(outputVideo);
while hasFrame(vid1) && hasFrame(vid2)
    img1 = readFrame(vid1);
    img2 = readFrame(vid2);
    imgt = horzcat(img1, img2);
    % play video
    step(videoPlayer, imgt);
    % record new video
    writeVideo(outputVideo, imgt);
end
release(videoPlayer);
close(outputVideo);