function HistogramImage(imageArray)
    edges = 0:256;
    count = zeros(1, length(edges) - 1);

    for i = 1:numel(imageArray)
        pixel = imageArray(i);

        count(pixel + 1) = count(pixel + 1) + 1;
    end
    bar(0:255, count);
    title("Histogram Image")
    xlabel("Grey Level");
    ylabel("Pixels")
end
