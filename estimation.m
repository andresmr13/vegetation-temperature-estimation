% Auto-generated by cameraCalibrator app on 01-Mar-2021
%-------------------------------------------------------


% Define images to process
imageFileNames = {'D:\26_02calib\Boson_thermal_jpg\Boson13.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson7.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson8.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson9.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson10.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson11.jpg',...
    'D:\26_02calib\Boson_thermal_jpg\Boson12.jpg',...
    };
% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates of the corners of the squares
squareSize = 21;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', true, ...
    'NumRadialDistortionCoefficients', 3, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% % For example, you can use the calibration data to remove effects of lens distortion.
% image_ex = imread('Boson5.jpg');
% undistortedImage = undistortImage(image_ex, cameraParams);
% figure(4)
% imagesc(undistortedImage)
% figure(5)
% imagesc(image_ex)
% % See additional examples of how to use the calibration data.  At the prompt type:
% % showdemo('MeasuringPlanarObjectsExample')
% % showdemo('StructureFromMotionExample')
