function equalizedImage = HistogramEqualization(imageArray)

[rows, cols, channels] = size(imageArray);

equalizedImage = imageArray;
for channel = 1:channels

    count = zeros(1, 256);

    for row = 1:rows
        for col = 1:cols

            pixel = imageArray(row, col, channel);
            count(double(pixel) + 1) = ...
                count(double(pixel) + 1) + 1;

        end
    end

    totalPixels = rows * cols;
    cdf = zeros(1, 256);

    cdf(1) = count(1);

    for i = 2:256
        cdf(i) = cdf(i - 1) + count(i);
    end

    cdf = cdf / totalPixels;

    mapping = zeros(1, 256);

    for i = 1:256
        mapping(i) = round(255 * cdf(i));
    end

    for row = 1:rows
        for col = 1:cols

            pixel = double(imageArray(row, col, channel));

            equalizedImage(row, col, channel) = ...
                mapping(pixel + 1);

        end
    end

end

end