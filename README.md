# Detection_solution

# Task2-team1

1) Weeds Detection <br>
    For weed detection we used a color based Mask operating in the L*a*b color space to isolate weeds in the images.
    Then we used the "bwconncomp" that performs connected component analysis to remove noise from the masked images (connected component that are to small to be weed)
    We merged reminding pixels that are near enough to do so in order to get consistent objet that will be connsidered as weeds (otherwise all leaf of the weed would have been considered as one weed).
    Then and after converting weeds linear pixels indices to pixels coordinates we found weeds (u,v) coordinates by calculating centroid of those coordinates lists
    This process will be repeated for each image accepted by the task2_solution.m node

2) From image to camera frame (Perspective transformation)<br>
    We did camera calibration with the camera_calibrator node from the camera_calibration ROS package and obtained the camera, rectification and projection matices.
    For this, we created a .sdf file simulating a chessboard in the gazebo.
    Then we used made perspective projection using the obtained projection matrix by implementing this relation
    [u, v, 1]' = A * [R|t] * [X, Y, Z, 1]'
    Considering the projection matrix to be the combination of camera matrix (A), Rotation|Translation matrix (R|t)

3) From Camera frame to base_link frame<br>
    We just used matlab rostf structure and existing transforms between cameras and base_link to transform weeds coordinates from Camera frame to base_link frame

4) From Base_link to world Frame <br>
    Since there is no transform between base_link and world_frame available we created a transformation matrix mapping the rotation matrix and translation vector of the robot in world_frame at the time of taking the photo.
    Then we just multiply this matrix by the homogeneous coordinates of weeds in base_link frame to get their coordinates in world_frame 
# Task2-team2

1) Weeds Detection<br>
    For weed detection we used a color based Mask operating in the HSV color space to isolate weeds in the images.
    Then we used the "bwconncomp" that performs connected component analysis to remove noise from the masked images (connected component that are to small to be weed)
    We merged reminding pixels that are near enough to do so in order to get consistent objet that will be connsidered as weeds (otherwise all leaf of the weed would have been considered as one weed).
    Then and after converting weeds linear pixels indices to pixels coordinates we found weeds (u,v) coordinates by calculating centroid of those coordinates lists
    This process will be repeated for each image accepted by the task2_solution.m node

2) From image to camera frame (Perspective transformation)<br>
    We did camera calibration with the camera_calibrator node from the camera_calibration ROS package and obtained the camera, rectification and projection matices.
    For this, we created a .sdf file simulating a chessboard in the gazebo.
    Then we used made perspective projection using the obtained projection matrix by implementing this relation
    [u, v, 1]' = A * [R|t] * [X, Y, Z, 1]'
    Considering the projection matrix to be the combination of camera matrix (A), Rotation|Translation matrix (R|t)

3) From Camera frame to base_link frame<br>
    We just used matlab rostf structure and existing transforms between cameras and base_link to transform weeds coordinates from Camera frame to base_link frame

4) From Base_link to world Frame<br>
    We just did a vector translation by adding the robot coordinates into world frame to weeds coordinates in base_link frame. 
