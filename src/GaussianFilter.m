function filteredImage = GaussianFilter(imageArray, filterSize, sigma)

if mod(filterSize, 2) == 0
    error('Filter size must be an odd number.');
end
if sigma <= 0
    error('Sigma must be greater than 0.');
end

[rows, cols, channels] = size(imageArray);

filteredImage = imageArray;

halfSize = floor(filterSize / 2);
kernel = zeros(filterSize, filterSize);

for i = -halfSize:halfSize
    for j = -halfSize:halfSize

        kernel(i + halfSize + 1, j + halfSize + 1) = ...
            exp(-(i^2 + j^2) / (2 * sigma^2));

    end
end

kernel = kernel / sum(kernel, 'all');

for channel = 1:channels

    for row = 1 + halfSize : rows - halfSize
        for col = 1 + halfSize : cols - halfSize

            value = 0;

            for i = -halfSize:halfSize
                for j = -halfSize:halfSize

                    pixel = double( ...
                        imageArray(row + i, col + j, channel));

                    kernelValue = ...
                        kernel(i + halfSize + 1, ...
                        j + halfSize + 1);

                    value = value + pixel * kernelValue;

                end
            end
            value = max(0, min(255, value));

            filteredImage(row, col, channel) = uint8(value);

        end
    end

end

end