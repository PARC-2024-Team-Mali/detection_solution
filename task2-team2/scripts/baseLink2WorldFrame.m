function [x,y] = baseLink2WorldFrame(x, y, weedPositionIntoBaseLink)
    % Just doing a nave vector translation should give weeds position into
    % world frame
    x = x + weedPositionIntoBaseLink.X;
    y = y + weedPositionIntoBaseLink.Y;
end
