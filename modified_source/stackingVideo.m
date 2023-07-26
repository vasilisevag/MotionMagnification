% Replace these filenames with the names of your input videos
video1File = 'C0080-FIRWindowBP-band0.10-0.50-sr250-alpha5-mp1-sigma4-scale1.00-frames1-1776-halfOctave.avi'; %icp 7
video2File = 'C0075-FIRWindowBP-band0.10-0.50-sr250-alpha5-mp1-sigma4-scale1.00-frames1-1776-halfOctave.avi'; % icp 22

% Read the input videos
video1 = VideoReader(video1File);
video2 = VideoReader(video2File);

% Check if the dimensions of both videos match
if video1.Height ~= video2.Height || video1.Width ~= video2.Width
    error('Video dimensions do not match. Both videos should have the same height and width.');
end

% Create the output video with combined width
outputWidth = video1.Width;
outputVideo = VideoWriter('output_stacked_video.avi');
outputVideo.FrameRate = video1.FrameRate;
open(outputVideo);

% Process each frame of the videos and stack them side by side
while hasFrame(video1) && hasFrame(video2)
    frame1 = readFrame(video1);
    frame2 = readFrame(video2);
    frame2_gray = rgb2gray(frame2);

    % Create a new frame with the appropriate size to accommodate both videos
    stackedFrame = uint8(zeros(video1.Height, outputWidth, 3));
    % Place the color frame (frame1) on the left side of the stacked frame
    stackedFrame(:, 1:video1.Width, :) = frame1;
    % Place the grayscale frame (frame2_gray) on the right side of the stacked frame
    alpha = 0.2;
    stackedFrame(:, 1:video1.Width, :) = uint8(frame2_gray * (1 - alpha) + frame1(:, video1.Width, :) * alpha);
    %stackedFrame(:, 1:video1.Width, :) = cat(3, frame2_gray , frame2_gray, frame2_gray);
    %uint8(frame2_gray * (1 - alpha) + frame1(:, video1.Width, :) * alpha);

   %frame2 (video1.Height , video1.Width, :) = frame1;
   %stackedFrame = frame1;
   % stackedFrame(video1.Height , video1.Width, :) = frame2_gray

   % Stack frames vertically  (one on top of the other)
   %stackedFrame = cat(1, frame1, frame2);
   %stackedFrame = cat(1, frame1, frame2_gray);
    
    % Write the stacked frame to the output video
    writeVideo(outputVideo, stackedFrame);
end

% Close the output video file
close(outputVideo);

disp('Video stacking complete!');
