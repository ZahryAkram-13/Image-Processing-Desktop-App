


function image = get_image(path)
    image = imread(path);
endfunction

function image = download_image()
    [filename, path] = uigetfile("*.*", "Get Image")
    if filename <> 0 then
        fullpath = path + "\" + filename
        disp("image: " + fullpath)
        image = get_image(fullpath)
        disp("Image downloaded");
    else
        disp("Image Not Found");
    end
endfunction



function display_image(image)
    position = [window_x + window_width+100, window_y, window_width-100, window_height];
    build_figure("Image", position); 
    imshow(image);
endfunction

function display_image_result(image, result)
    name = "Image";
    position = [window_x + window_width+50, window_y, window_width-50, window_height];
    f = build_figure(name, position);

    subplot(1,2,1), imshow(image),title('Orginal Image');
    subplot(1,2,2), imshow(result), title("Transformed Image");
endfunction





function histo = histogram(image)
    [rows, cols] = size(image);
    histo = zeros(1, 256);
    for i = 1:rows
        for j = 1:cols
            pixel = image(i, j);
            if pixel >= 0 && pixel < 256 then
                histo(pixel + 1) = histo(pixel + 1) + 1;
            else
                mprintf("(%d, %d)\n", i, j);            
            end      
        end
    end
endfunction

function comulated_h = comulated_histogram(histogram)
    cols = length(histogram);
    comulated_h = zeros(cols, 1);
    summ = 0;
    for i = 1:cols
        summ = summ + histogram(i);  
        comulated_h(i) = summ;       
    end
endfunction