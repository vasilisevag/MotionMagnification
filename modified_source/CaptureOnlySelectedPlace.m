% Step 1: Import the video file
videoObj = VideoReader('/data/eye.avi');  

% Step 2: Create a figure and display the first frame
figure;
imshow(readFrame(videoObj));
title('Draw a freehand ROI around the area to crop');

% Step 3: Use imfreehand to draw a freehand ROI
h = imfreehand;

% Step 4: Get the binary mask of the ROI
binaryMask = h.createMask();

% Step 5: Crop the video using the binary mask
videoObj = VideoReader('/data/eye.avi');  % Reopen the video
outputVideo = VideoWriter('cutted_eye.avi');
outputVideo.FrameRate = videoObj.FrameRate;
open(outputVideo);

while hasFrame(videoObj)
    frame = readFrame(videoObj);
    croppedFrame = bsxfun(@times, frame, cast(binaryMask, 'like', frame));
    writeVideo(outputVideo, croppedFrame);
end

close(outputVideo);

disp('Cropping complete!');

% Step 6: Save the cropped frames to a new video file
