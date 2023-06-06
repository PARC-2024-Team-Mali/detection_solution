function [x,y] = finalTransform(orientation, x, y, weedPositionIntoBaseLink)
    x = x + weedPositionIntoBaseLink.X * cos(orientation.X);
    y = y + weedPositionIntoBaseLink.Y * cos(orientation.Y);
end
