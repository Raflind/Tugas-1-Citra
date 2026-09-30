function filteredImage = MedianFilter(imageArray)

[rows, cols, channels] = size(imageArray);

filteredImage = imageArray;

filterSize = 3;
halfSize = floor(filterSize / 2);

for channel = 1:channels

    for row = 1 + halfSize : rows - halfSize
        for col = 1 + halfSize : cols - halfSize

            window = zeros(1, filterSize * filterSize);

            index = 1;

            for i = -halfSize:halfSize
                for j = -halfSize:halfSize

                    window(index) = ...
                        double(imageArray(row + i, col + j, channel));

                    index = index + 1;

                end
            end

            window = sort(window);

            medianValue = window(ceil(length(window) / 2));

            filteredImage(row, col, channel) = uint8(medianValue);

        end
    end

end

end