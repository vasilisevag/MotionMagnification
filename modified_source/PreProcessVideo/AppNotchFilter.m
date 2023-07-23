% AppNotchFilter(vidFileIN,vidFileOut, notchFreq, BW, FR) 
% 
% Takes input vidFileIN and applying notch filter to get out the flicker
% noise from light giving by notchFreq, BW,FR
% 
% 

function AppNotchFilter(vidFileIn,vidFileOut, notchFreq, BW, FR)
    
    % Read the input video
    %inputVideo = VideoReader('./data/cutted_eye.avi');
    inputVideo = VideoReader(vidFileIn);

    % Video parameters
    frameRate = inputVideo.FrameRate;
    numFrames = inputVideo.NumFrames;
    height = inputVideo.Height;
    width = inputVideo.Width;
    
    % Define the notch frequency in Hz
    %notchFreq = 120; % Hz
    notchFreq1 = notchFreq; % Hz
    
    % Normalize the notch frequency between 0 and 1
    %normalizedNotchFreq = notchFreq / 500;
    if FR < notchFreq1
        normalizedNotchFreq = 0.24; %notchFreq1 / FR;
    elseif FR > notchFreq1
        normalizedNotchFreq = notchFreq1 / FR;
    end
    
    
    % Design the notch filter with a narrow bandwidth
    %BW = 0.05;
    BW1 = BW;
    [b, a] = iirnotch(normalizedNotchFreq, BW1);
   
    %uncoment this to see the filter plot 
    % fvtool(b,a)
    
    % Create the output video
    %outputVideo = VideoWriter('./data/output_filtered_video_eye_befoar_scaling.avi');
    outputVideo = VideoWriter(vidFileOut);
    outputVideo.FrameRate = frameRate;
    open(outputVideo);
    
    % Process each frame of the video
    for frameIndex = 1:numFrames
        % Read the current frame from the input video
        frame = read(inputVideo, frameIndex);
        
        % Apply the notch filter to the frame (in color)
        filteredFrame = zeros(size(frame), 'like', frame);
        for colorChannel = 1:size(frame, 3)
            filteredFrame(:,:,colorChannel) = filter(b, a, double(frame(:,:,colorChannel)));
        end
        
        % Normalize the filtered frame to the range [0, 1]
        filteredFrame = mat2gray(filteredFrame);
        
        % Convert the filtered frame to uint8 (8-bit) data type
        filteredFrame = im2uint8(filteredFrame);
        
        % Write the filtered frame to the output video
        writeVideo(outputVideo, filteredFrame);
    end
    
    % Close the output video file
    close(outputVideo);
    
    disp('AppNotchFilter complete!');
