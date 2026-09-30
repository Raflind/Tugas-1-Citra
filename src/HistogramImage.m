function HistogramImage(imageArray)

[rows, cols, channels] = size(imageArray);

% Jika gambar terdeteksi hanya memiliki 1 warna, akan menampilkan histogram
% untuk greyscale
if channels == 1

    count = zeros(1, 256);

    for row = 1:rows
        for col = 1:cols

            pixel = imageArray(row, col);

            count(double(pixel) + 1) = ...
                count(double(pixel) + 1) + 1;

        end
    end

    bar(0:255, count);
    title("Grayscale Histogram");
    xlabel("Gray Level");
    ylabel("Pixels");


elseif channels == 3

    % Pengecekan untuk gambar greyscale yang memiliki 3 channel warna
    isGrayscale = isequal(imageArray(:,:,1), imageArray(:,:,2)) && ...
                  isequal(imageArray(:,:,2), imageArray(:,:,3));

    if isGrayscale

        count = zeros(1, 256);

        for row = 1:rows
            for col = 1:cols

                pixel = imageArray(row, col, 1);

                count(double(pixel) + 1) = ...
                    count(double(pixel) + 1) + 1;

            end
        end

        bar(0:255, count);
        title("Grayscale Histogram");
        xlabel("Gray Level");
        ylabel("Pixels");


    % Gambar Berwarna akan menampilkan 3 histogram dengan channel warna R,
    % G, dan B
    else

        redCount = zeros(1, 256);
        greenCount = zeros(1, 256);
        blueCount = zeros(1, 256);

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

        figure;

        subplot(3,1,1);
        bar(0:255, redCount);
        title("Red Channel");
        xlabel("Pixel Value");
        ylabel("Pixels");

        subplot(3,1,2);
        bar(0:255, greenCount);
        title("Green Channel");
        xlabel("Pixel Value");
        ylabel("Pixels");

        subplot(3,1,3);
        bar(0:255, blueCount);
        title("Blue Channel");
        xlabel("Pixel Value");
        ylabel("Pixels");

    end

end

end