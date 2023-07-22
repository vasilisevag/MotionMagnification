% scalingVideo(vidFileIN,vidFileOut, startingFrame, endingFrame) 
% 
% Takes input vidFileIN and applying scaling at startingFrame and finish it at endingFrame
%   using resize with 0.5 and lanczos3 to min the size of video file
% 
% 

function scalingVideo(vidFileIn,vidFileOut, startingFrame, endingFrame)
    
    %{
    clc;    % Clear the command window.
    close all;  % Close all figures (except those of imtool.)
    imtool close all;  % Close all imtool figures.
    clear;  % Erase all existing variables.
    workspace;  % Make sure the workspace panel is showing.
    fontSize = 22;
    
    % First get the folder that it lives in.
    
    
    fileName = 'C0061.MP4';
    folder = fileparts(which(fileName));
    
    % Comment out the other one.
    inputFullFileName = fullfile(folder, fileName);
    % Check to see that it exists.
    if ~exist(inputFullFileName, 'file')
      strErrorMessage = sprintf('File not found:\n%s\nYou can choose a new one, or cancel', inputFullFileName);
      response = questdlg(strErrorMessage, 'File not found', 'OK - choose a new movie.', 'Cancel', 'OK - choose a new movie.');
      if strcmpi(response, 'OK - choose a new movie.')
        [baseFileName, folderName, FilterIndex] = uigetfile('*.avi');
        if ~isequal(baseFileName, 0)
          inputFullFileName = fullfile(folderName, baseFileName);
        else
          return;
        end
      else
        return;
      end
    end
    %}
    
    % Open up the VideoReader for reading an input video file.
    inputVideoReaderObject = VideoReader(vidFileIn);
    % Determine how many frames there are.
    numberOfFrames = inputVideoReaderObject.NumFrames;
    inputVideoRows = inputVideoReaderObject.Height;
    inputVideoColumns = inputVideoReaderObject.Width;
    inputVideoFPS= inputVideoReaderObject.FrameRate;
    
    % Create a VideoWriter object to write the video out to a new, different file.
    outputVideoWriterObject = VideoWriter(vidFileOut);
    outputVideoWriterObject.FrameRate = inputVideoFPS;
    open(outputVideoWriterObject);
    
    numberOfFramesWritten = 0;
    
    % Loop through the movie, writing all frames out.
    startFrame = startingFrame;
    endFrame = endingFrame;
    
    for frame = startFrame : endFrame             
      % Extract the frame from the movie structure.
      thisInputFrame = read(inputVideoReaderObject, frame);
        
      % Resize the image.                   
      outputFrame = imresize(thisInputFrame,0.5 ,"lanczos3");
      
      % Write this new, resized frame out to the new video file.
      writeVideo(outputVideoWriterObject, outputFrame);
      
      % Update user with the progress.  Display in the command window.
      progressIndication = sprintf('Processed frame %4d of %d.', frame, endFrame);
      disp(progressIndication);
      numberOfFramesWritten = numberOfFramesWritten + 1;
      
    end
    
    % Close the output video object.  You don't need to close the input video reader..
    close(outputVideoWriterObject);
    disp('ScalingVideo complete!');
