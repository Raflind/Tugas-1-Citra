function correctedImage = GammaCorrection(imageArray, gamma)

[rows, cols, channels] = size(imageArray);

correctedImage = imageArray;

for channel = 1:channels

    for row = 1:rows
        for col = 1:cols

            pixel = double(imageArray(row, col, channel));

            % Normalize pixel to 0-1
            normalizedPixel = pixel / 255;

            % Gamma correction
            newPixel = 255 * (normalizedPixel ^ gamma);

            % Store result
            correctedImage(row, col, channel) = newPixel;

        end
    end

end

end