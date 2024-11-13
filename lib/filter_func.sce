
lowfilter_file = "low_filter.sce";
function call_low_filter()
    execute_file(lowfilter_file);
endfunction

highfilter_file = "high_filter.sce";
function call_high_filter()
    execute_file(highfilter_file);
endfunction





global fig_filters;
global laplacien4 laplacien8 perwitt_h perwitt_v sobel_v sobel_h;

laplacien4 = [
    0 -1 0,
    -1 4 -1,
    0 -1 0
]
laplacien8 = [
    1 1 1,
    1 -8 1,
    1 1 1
]
perwitt_v = [
    -1 0 1,
    -1 0 1,
    -1 0 1
]
perwitt_h = perwitt_v';

sobel_v= [
    -1 0 1,
    -2 0 2,
    -1 0 1
]    
sobel_h = sobel_v';

global filter;

filters = struct();

filters("laplacien4") = laplacien4
filters("laplacien8") = laplacien8

filters("sobel v") = sobel_v
filters("sobel h") = sobel_h

filters("perwitt v") = perwitt_v
filters("perwitt h") = perwitt_h




function apply_high_filter(filter)
    //filter = string(filter);
    disp(filter);
    if typeof(filter) == "string" then
        image = download_image();
        transformed = filter2(image, filters(filter));
        display_image_result(image, transformed);
    else
        messagebox("filter not found, please try again", "Error", "error", ["Continue"], "modal")

    end
   

endfunction

function close_figure_filters()
    global fig_filters;
    close(fig_filters);
endfunction


function apply_laplacien4()
    close_figure_filters()
    apply_high_filter('laplacien4');
endfunction

function apply_laplacien8()
    close_figure_filters()
    apply_high_filter('laplacien8');
endfunction
function apply_perwitt_h()
    close_figure_filters()
    apply_high_filter('perwitt h');
endfunction

function apply_perwitt_v()
    close_figure_filters()
    apply_high_filter('perwitt v');
endfunction

function apply_sobel_h()
    close_figure_filters()
    apply_high_filter('sobel h');
endfunction

function apply_sobel_v()
    close_figure_filters()
    apply_high_filter('sobel v');
endfunction



function apply_magnitude()

    image = download_image();
    image = double(image)
    
    dx = conv2(sobel_v, image);
    dy = conv2(sobel_h, image);

    magnitude = uint8(sqrt(dx.^2 + dy.^2))
    direction = uint8(atan(dy ./ dx));

    transformed = filter2(image, sobel_v);
    display_image_result(uint8(image), magnitude);


endfunction




function filter = get_filter()
    filter = x_choose_modeless(...
    ['laplacien8';'laplacien4';...
    'sobel vertical';'sobel horizontal';...
    'perwitt vertical';'perwit horizontal'],...
    ['choose one filter and press ok']);
    apply_high_filter(filter);
endfunction



function high_filters_figure()
  
    x_win = window_x + window_width+50
    y_win = window_y

    f_width = window_width/2 -170;
    f_hight = window_height; 

    name = "Filters"; 
    position = [x_win, y_win, f_width, f_hight];
    global fig_filters;
    fig_filters = build_figure(name, position);

    y_start = 6*button_height + 5*gapv;

    x = (f_width - button_width)/2;
    y = (f_hight - y_start)/2;
    
    build_button_size(fig_filters, x, f_hight - y - 50, "laplacien 4", "apply_laplacien4();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 2*y - 2*50, "laplacien 8", "apply_laplacien8();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 3*y - 3*50, "sobel v", "apply_sobel_v();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 4*y - 4*50, "sobel h", "apply_sobel_h();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 5*y - 5*50, "perwitt v", "apply_perwitt_v();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 6*y - 6*50, "perwitt h", "apply_perwitt_h();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 7*y - 7*50, "magnitude", "apply_magnitude();", button_width, button_height);


endfunction

//-------------------------low pass----------------------------------------
moyenneur = ones(3, 3)*1/9;

function noised = gussian_niose(image)
    noised = imnoise(image, 'gussian');
endfunction

function noised = saltpaper_noise(image)
    noised = imnoise(image, 'salt & pepper');
endfunction
 
function result = mean_filter(image)
    result = uint8(filter2(image, moyenneur));
endfunction 

function result = sobel_filter(image)
    filter = fspecial('sobel');
    result = imfilter(image, filter);
endfunction 


function apply_sobel_noise()
    image = download_image();
    result = sobel_filter(image);
    display_image_result(image, result);
    close_figure_filters();
endfunction

function apply_gaussien_noise()
    image = download_image();
    noised = gussian_niose(image);
    display_image_result(image, noised);
    close_figure_filters();

endfunction

function apply_satlpapper_noise()
    image = download_image();
    noised = saltpaper_noise(image);
    display_image_result(image, noised);
    close_figure_filters();

endfunction

function apply_mean_filter()
    image = download_image();
    noised = mean_filter(image);
    display_image_result(image, noised);
    close_figure_filters();

endfunction

function low_filters_figure()
    x_win = window_x + window_width+50
    y_win = window_y

    f_width = window_width/2 -170;
    f_hight = window_height; 

    name = "Filters"; 
    position = [x_win, y_win, f_width, f_hight];
    global fig_filters;
    fig_filters = build_figure(name, position);

    y_start = 6*button_height + 5*gapv;

    x = (f_width - button_width)/2;
    y = (f_hight - y_start)/2;
    
    build_button_size(fig_filters, x,  f_hight - y - 50, "Gussian Noise", "apply_gaussien_noise();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 2*y - 2*50, "Salt & Papper noise", "apply_satlpapper_noise();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 3*y - 3*50, "Mean Filter", "apply_mean_filter();", button_width, button_height);
    build_button_size(fig_filters, x, f_hight - 4*y - 4*50, "Sobel Filter", "apply_sobel_noise();", button_width, button_height);


endfunction



function test_filter_func()
    image = get_image(images_path + "house.png");

   
    image = double(image)
    dx = conv2(sobel_v, image);
    dy = conv2(sobel_h, image);

    magnitude = uint8(sqrt(dx.^2 + dy.^2))
    direction = uint8(atan(dy ./ dx));

 
    

    transformed = filter2(image, sobel_v);
    display_image_result(magnitude, direction);

endfunction