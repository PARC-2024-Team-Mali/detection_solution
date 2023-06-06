function instanceCoordinates = detectWeeds(RGBImage, projectionMatrix)
    % Apply the mask used during the matlab workshop
    % (ColorThresholder's function)
    [Result, ~] = colorMask(RGBImage);
    
    % The below modifications are applied to clear the output (Remove all noise
    % to get only consitent items that can be considered to be weeds)

    % Find connected components in the binary mask
    CC = bwconncomp(Result);
    
    % Calculate the area of each connected component
    areas = cellfun(@numel, CC.PixelIdxList);
    
    % Threshold to remove small noises (adjust the value as needed)
    minAreaThreshold = 40; % Minimum area to consider as a weed
    
    % Initialize a new binary mask for the detected objects
    Result = false(size(Result));
    
    % Filter out small objects and retain only the large ones (detected weeds)
    for i = 1:CC.NumObjects
        if areas(i) >= minAreaThreshold
            Result(CC.PixelIdxList{i}) = true;
        end
    end
    
    % Optionally, remove small holes within the detected objects
    Result = imfill(Result, 'holes');
    
    % After the above code run, weeds are not consistent objects in "Result". 
    % The below code help identifying and locating weeds instance by dilating
    % nearby pixels to get one consistent object
    % Apply morphological dilation to merge nearby white pixels
    se = strel('disk', 5); % Adjust the radius as per your requirements
    Result = imdilate(Result, se);
      
    CC = bwconncomp(Result);
    % Get the number of instances (connected components)
    numInstances = CC.NumObjects;
    % Initialize a cell array to store the (u,v) coordinates for each instance
    instanceCoordinates = cell(1, numInstances);
    
    % Iterate over each instance and calculate its centroid (u,v) coordinates
    for i = 1:numInstances
        % Get the pixel indices for the current instance
        pixelIndices = CC.PixelIdxList{i};
        % Convert linear indices to (u,v) coordinates
        [u, v] = ind2sub(size(Result), pixelIndices);
        % Store the centroid coordinates in the cell array
        u = mean(u);
        v = mean(v);
        % Create homogeneous coordinates
        pointsUV = [u, v, 1];
        % Apply inverse projection to obtain (x,y,z) coordinates
        % This code snippet performs the inverse projection by solving 
        % the linear system projectionMatrix * pointsXYZ = pointsUV
        % Considere using A\B instead of inv(A)*B for numerical efficiency
        % and speed
        pointsXYZ = projectionMatrix\pointsUV';
        % Extract (x,y,z) coordinates
        position = [pointsXYZ(1) pointsXYZ(2) pointsXYZ(3)];
        instanceCoordinates{i} = position;
    end
    % The function returns a cell array containing coordinates of each
    % weeds instances in the images
end