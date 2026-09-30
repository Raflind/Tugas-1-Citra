function [redCount, greenCount, blueCount] = HistogramImage(imageArray)

[rows, cols, channels] = size(imageArray);

% Inisialisasi histogram
redCount = zeros(1, 256);
greenCount = zeros(1, 256);
blueCount = zeros(1, 256);

% Perhitungan histogram untuk graysacle image
if channels == 1

    for row = 1:rows
        for col = 1:cols

            pixel = imageArray(row, col);

            redCount(double(pixel) + 1) = ...
                redCount(double(pixel) + 1) + 1;

        end
    end

% Perhitungan Histogram imgae dengan 3 channel warna
elseif channels == 3

    % Pengecekan untuk image grayscale dengan 3 channel warna
    isGrayscale = isequal( ...
        imageArray(:,:,1), ...
        imageArray(:,:,2)) && ...
        isequal( ...
        imageArray(:,:,2), ...
        imageArray(:,:,3));


    % pemrosesan histogram image greyscale
    if isGrayscale

        for row = 1:rows
            for col = 1:cols

                pixel = imageArray(row, col, 1);

                redCount(double(pixel) + 1) = ...
                    redCount(double(pixel) + 1) + 1;

            end
        end


    % Pemrosesan histogram image RGB
    else

        for row = 1:rows
            for col = 1:cols

                redPixel = imageArray(row, col, 1);
                greenPixel = imageArray(row, col, 2);
                bluePixel = imageArray(row, col, 3);


                redCount(double(redPixel) + 1) = ...
                    redCount(double(redPixel) + 1) + 1;


                greenCount(double(greenPixel) + 1) = ...
                    greenCount(double(greenPixel) + 1) + 1;


                blueCount(double(bluePixel) + 1) = ...
                    blueCount(double(bluePixel) + 1) + 1;

            end
        end

    end

end

end