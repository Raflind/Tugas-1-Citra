function stretchedImage = ContrastStretching(imageArray)

[rows, cols, channels] = size(imageArray);

stretchedImage = imageArray;

for channel = 1:channels

    minPixel = prctile(double(imageArray(:,:,channel)), 1, "all");
    maxPixel = prctile(double(imageArray(:,:,channel)), 99, "all");
    for row = 1:rows
        for col = 1:cols

            pixel = double(imageArray(row, col, channel));

            if maxPixel ~= minPixel
                newPixel = ((pixel - minPixel) / ...
                    (maxPixel - minPixel)) * 255;
            else
                newPixel = pixel;
            end

            stretchedImage(row, col, channel) = newPixel;

        end
    end
end

end