function [x,y] = baseLink2WorldFrame(x, y, weedPositionIntoBaseLink)
    x = x + weedPositionIntoBaseLink.X;
    y = y + weedPositionIntoBaseLink.Y;
end
