function [x,y] = finalTransform(x, y, weedPositionIntoBaseLink)
    x = x + weedPositionIntoBaseLink.X;
    y = y + weedPositionIntoBaseLink.Y;
end