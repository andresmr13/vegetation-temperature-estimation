# Thermal-imaging-workflow-code
Scripts required to compute calibrated thermal imagery with the Boson 640.

--capture_image.py is a script that runs inside the Raspberry Pi in order to detect the trigger signal from the autopilot. At a trigger event, the Raspberry get a frame from the video output of the Boson 640.

--undistort.py is a script that corrects the imagery, using the distortion coefficients and intrinsic matrix of the camera. This script performs the correction process over a set of images inside a specified folder.

--estimation.m is the matlab code to perform the estimation of the distortion coefficients & the intrinsic camera matrix. The code requires the 7 images in "Boson_thermal_jpg.rar".

--calibration_cwsi.m is the matlab code to perform the temperature calibration over the thermal orthomosaic, and also to perform the CWSI computation. Note that the code requires the image "parque1_undist.tif".

--to generate the orthomosaic from the aerial imagery we use WebODM from https://www.opendronemap.org/webodm/

More info: <br />
Andres Montes de Oca <br />
Bio and Ag department, UC Davis<br />
amoreb@ucdavis.edu

🍀
