function brightImage = ImageBrightening(imageArray, s)

[rows, cols, channels] = size(imageArray);

brightImage = imageArray;

for row = 1:rows
    for col = 1:cols

        for channel = 1:channels

            pixel = double(imageArray(row, col, channel));

            newPixel = pixel + s;

            if newPixel > 255
                newPixel = 255;
            elseif newPixel < 0
                newPixel = 0;
            end

            brightImage(row, col, channel) = newPixel;

        end
    end
end

end