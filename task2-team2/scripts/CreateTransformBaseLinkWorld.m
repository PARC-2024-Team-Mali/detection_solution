% We also tried to create a transformation between base_link and
% world_frame for the final transform but we have never been able to use it
% always getting the Error 'Frames *world_frame* and *base_link* are not connected'
function [x, y] = CreateTransformBaseLinkWorld(tftree, orientation, robotX, robotY, weedIntoBaseLink)

    % Create a TransformStamped message
    tfMsg = rosmessage('geometry_msgs/TransformStamped');
    tfMsg.ChildFrameId = 'world_frame';
    tfMsg.Header.FrameId = 'base_link';
    
    % Position of the base link frame relative to the world frame
    tfMsg.Transform.Translation.X = robotX;
    tfMsg.Transform.Translation.Y = robotY;
    tfMsg.Transform.Translation.Z = 0.284786;
    
    % Orientation of the base link frame relative to the world frame
    tfMsg.Transform.Rotation = orientation;
    
    % Publish the transformation
    sendTransform(tftree, tfMsg);
    %waitForTransform(tftree, 'world_frame', 'base_link');
    pause(1);

    % Create a PointStamped message with the weed locations
    pointMsg = rosmessage('geometry_msgs/PointStamped');
    pointMsg.Header.FrameId = 'base_link';
    pointMsg.Point = weedIntoBaseLink;
    
    % Transform the point to the world frame
    transformedPointMsg = transform(tftree, 'world_frame', pointMsg);
    x = transformedPointMsg.Point.X;
    y = transformedPointMsg.Point.Y;
end