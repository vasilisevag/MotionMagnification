vid1 = VideoReader('C:\Users\Vasilis\Desktop\thesis\Release\data\C0075.MP4');
vid2 = VideoReader('E:\11MATLABTHESIS\C0075-FIRWindowBP-band0.50-2.00-sr100-alpha15-mp0-sigma2-scale1.00-frames1-251-halfOctave.avi');

% new video
outputVideo = VideoWriter('videoOne.avi');
outputVideo.FrameRate = vid1.FrameRate;
open(outputVideo);
while hasFrame(vid1) && hasFrame(vid2)
    img1 = readFrame(vid1);
    img2 = readFrame(vid2);
    img1(250:750, 500:1500, :) = img2;
    
    % record new video
    writeVideo(outputVideo, img1);
end

close(outputVideo);