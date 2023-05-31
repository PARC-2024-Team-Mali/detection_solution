% Loading a threshold values used the limit the amount of images to process
load threshold.mat;
% Loading the projection matrix obtained after camera calibration
load projectionMatrix.mat;

% Initialize ROS node
rosshutdown;
rosinit;

tftree = rostf ;   
pause(2); % set quick pause

% Create Subscriber for revelant topics
leftCameraSub = rossubscriber('/left_camera/image_raw', 'sensor_msgs/Image');
rightCameraSub = rossubscriber('/right_camera/image_raw', 'sensor_msgs/Image');
statusChecker = rossubscriber("/parc_robot/robot_status", "std_msgs/String");
gps_sub = rossubscriber('/gps/fix',"sensor_msgs/NavSatFix");

% Considering cell array to store the images
imageStore = {};
% To store robot position at the time of capturing images
positions = {};
% Initialize some variables
prevLeftImage = [];  % Store the previous left image
prevRightImage = []; % Store the previous right image
moveStopped = false;

while ~moveStopped
    % Receive images from the left and right cameras
    rightImageMsg = receive(rightCameraSub);
    leftImageMsg = receive(leftCameraSub);
    % Convert ROS image messages to MATLAB images
    leftImage = readImage(leftImageMsg);
    rightImage = readImage(rightImageMsg);

    % Calculate the difference between the current and previous images
    if ~isempty(prevLeftImage) && ~isempty(prevRightImage)
        leftDiff = sum(abs(double(leftImage(:)) - double(prevLeftImage(:))));
        rightDiff = sum(abs(double(rightImage(:)) - double(prevRightImage(:))));
    else
        leftDiff = Inf; % Set initial difference to maximum
        rightDiff = Inf; % Set initial difference to maximum
    end
    
    % Store images in the cell array if they have significant changes
    % We implemented this to speed up the process limitting the number of
    % images to process, this will also prevent us from detecting more
    % weeds than there is in the field.
    % A threshold values as been calculated for each route and we choose
    % the mean of those values as the global threshold
    if leftDiff >= threshold || rightDiff >= threshold
        disp("images accepted");
        imageStore = [imageStore, leftImage, rightImage];
        robot_position = receive(gps_sub);
        positions = [positions, robot_position];
        % Update the previous images
        prevLeftImage = leftImage;
        prevRightImage = rightImage;
    end

    % Check if move is ended
    if ~isempty(statusChecker.LatestMessage) && strcmp(statusChecker.LatestMessage.Data, "finished")
        moveStopped = true;
        disp("****** The robot stopped ******");
    end
end
% To store all detected weeds coordinates
allWeedsCoordinates = [];
% Loop over registered images and detect weeds
disp("Starting images processing");
for image = 1:numel(imageStore)
    instanceCoordinates = detectWeeds(imageStore{image}, projectionMatrix);
    % Cause the way we store images will always store right_camera images
    % with pair indices.
    if mod(image, 2) == 0  
        for instance = 1:numel(instanceCoordinates)
            weedPoint_into_baseLink = fromCamera2Base_link(tftree, instanceCoordinates{instance}, "right_camera");
            [x, y] = gps_to_cartesian(positions(image/2).Latitude, positions(image/2).Longitude);
            [x, y] = finalTransform(x, y, weedPoint_into_baseLink);
            allWeedsCoordinates = [allWeedsCoordinates; [x, y]];
        end
    else
        for instance = 1:numel(instanceCoordinates)
            weedPoint_into_baseLink = fromCamera2Base_link(tftree, instanceCoordinates{instance}, "left_camera");
            % The fix function is equivalent to the // python operator
            % (Integer division)
            [x, y] = gps_to_cartesian(positions(fix(image/2) + 1).Latitude, positions(fix(image/2) + 1).Longitude);
            [x, y] = finalTransform(x, y, weedPoint_into_baseLink);
            allWeedsCoordinates = [allWeedsCoordinates; [x, y]];
        end
    end
end

disp("Finished images processing");

% Create a publisher to publish weeds positions
pub = rospublisher('/parc_robot/weed_detection', 'std_msgs/String');

% Convert the weed locations to a JSON array string
json_str = jsonencode(allWeedsCoordinates);

% Create a String message
msg = rosmessage('std_msgs/String');

% Set the message data to the JSON array string
msg.Data = json_str;

% Publish the message
send(pub, msg);

% Display published data
disp(json_str);
disp("****** Shuting down ******");

rosshutdown;