function weed_into_Base_link = fromCamera2Base_link(tftree, weed_into_CameraFrame, cameraFrame)
    % Transform weeds coordinates from camera frame to base_link frame
    waitForTransform(tftree, 'base_link' , cameraFrame );
    point = rosmessage( 'geometry_msgs/PointStamped' );
    point.Header.FrameId = cameraFrame ;
    point.Point.X = weed_into_CameraFrame(1) ;
    point.Point.Y = weed_into_CameraFrame(2);
    point.Point.Z = weed_into_CameraFrame(3) ;
    PStamped = transform(tftree, 'base_link' , point);
    weed_into_Base_link = PStamped.Point;
end 