function [x, y] = finalTransform(orientation, x, y, weedPositionIntoBaseLink)
    % Create a transformation Matrix to map the transform between base_link
    % and world_frame. Since there is no transform between base_link and
    % world frame we will use this matrix as our transformation medium
    
    % Convert the quaternion orientation to a rotation matrix
    rotationMatrix = quat2rotm([orientation.X, orientation.Y, orientation.Z, orientation.W]);
    
    % Construct the transformation matrix
    transformationMatrix = eye(4);
    transformationMatrix(1:3, 1:3) = rotationMatrix;
    transformationMatrix(1:3, 4) = [x, y, 0.284786]; % This value for "z" come from gazebo
    
    % Homogeneous weeds coordinates in base_link frame.
    WeedIntoWorldFrame = transformationMatrix * [weedPositionIntoBaseLink.X; weedPositionIntoBaseLink.Y; weedPositionIntoBaseLink.Z; 1];
    x = WeedIntoWorldFrame(1);
    y = WeedIntoWorldFrame(2);
    
end
