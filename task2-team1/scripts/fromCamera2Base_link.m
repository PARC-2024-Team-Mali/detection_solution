function weed_into_Base_link = fromCamera2Base_link(tftree, weed_into_CameraFrame, cameraFrame)
    % Wait for the transform to be available
    waitForTransform(tftree, 'base_link' , cameraFrame );
    % Create the point to translate with weeds coordinates
    point = rosmessage( 'geometry_msgs/PointStamped' );
    point.Header.FrameId = cameraFrame ;
    point.Point.X = weed_into_CameraFrame(1) ;
    point.Point.Y = weed_into_CameraFrame(2);
    point.Point.Z = weed_into_CameraFrame(3) ;
    % Transform the coordinates to base_link frame
    PStamped = transform(tftree, 'base_link' , point);
    weed_into_Base_link = PStamped.Point;
end 