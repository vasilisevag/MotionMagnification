vid1 = VideoReader('PATH1');
vid2 = VideoReader('PATH2');
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
