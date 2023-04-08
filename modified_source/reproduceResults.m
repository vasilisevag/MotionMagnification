clear;
resultsDir = 'ReproduceResultsEVM';
mkdir(resultsDir);
dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n for EVM method', inFile);

%%EVM method
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,10,50,0.3,1,240, 0)

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
%r1 > r2
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 20, 26, 0.2, 0.05, 0);

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,35,0.33,2,240, 0)

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,10,250,0.1,2,240, 0)

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,10,400,0.1,2,240, 0)

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,10,290,0.1,2,240, 0)

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,250,0.1,4,240, 0)


%PhaseBased Method

clear;
resultsDir = 'ReproduceResultsPhaseBased';
mkdir(resultsDir);
dataDir = './data/';
inFile = fullfile(dataDir,'cutted_120fps_clip2.avi');
fprintf('Processing %s\n for Phase method', inFile);


												                                             % 0.4 for 4 GB ram
phaseAmplify(inFile, 100, 0.33, 50, 120, resultsDir,'sigma', 20,'pyrType', 'octave','scaleVideo', 1);



dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
phaseAmplify(inFile, 10, 0.01, 50, 240, resultsDir,'sigma', 13,'pyrType', 'octave','scaleVideo', 1);


dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
phaseAmplify(inFile, 10, 0.01, 50, 240, resultsDir,'sigma', 13,'pyrType', 'octave','scaleVideo', 1);

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
phaseAmplify(inFile, 75, 0.1, 4, 240, resultsDir,'sigma', 20,'pyrType', 'octave','scaleVideo', 1);


dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
phaseAmplify(inFile, 10, 0.1, 4, 240, resultsDir,'sigma', 20,'pyrType', 'octave','scaleVideo', 1);


dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
phaseAmplify(inFile, 10, 0.1, 50, 240, resultsDir,'sigma', 20,'pyrType', 'octave','scaleVideo', 1);

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
temporalFilter = @differenceOfButterworths;
phaseAmplify(inFile, 150, 10, 50, 240, resultsDir,'sigma', 20,'pyrType', 'octave','temporalFilter', temporalFilter ,'scaleVideo', 1);

dataDir = './data/';
inFile = fullfile(dataDir,'cutted_240fps_clip2.avi');
temporalFilter = @differenceOfButterworths;
phaseAmplify(inFile, 150, 10, 50, 240, resultsDir,'sigma', 10,'pyrType', 'octave','temporalFilter', temporalFilter ,'scaleVideo', 1);