global images_path;
images_path = project_path + "images\";

global backgrouncolor text_color button_color;
backgrouncolor = [15, 25, 46]/255
text_color = [242, 242, 242]/255;
button_color = [222, 138, 2]/255

global window_x window_y window_width window_height; 
window_x = 50;
window_y = 100;
window_width = 800;
window_height = 500; 

global fragment frame1 frame2;
fragment = window_width/7;
frame1 = 3*fragment;
frame2 = 4*fragment;



global button_width button_height;
button_width = 200;
button_height = 40;

global third1; 
third1 = window_height/3;



global gapv gaph button_start_y;
button_start_y =  third1;
gapv = 50;
gaph = 10;

global new_line;
new_line = 26;



function x_col1 = get_xcol1(width)
    x_col1 = (frame1 - width)/2;
endfunction

function x_col2 = get_xcol2(width)
    x_col2 = frame1 + (frame2 - width)/2;
endfunction


title_width = frame1+200;
title_height = 30;

function print(str, var)
    mprintf(str + "%d\n", var);
endfunction

function f = build_figure(name, position)
    f = figure( ...
    "Name", name, ...
    "MenuBar", "none", ...
    "ToolBar", "none", ...    
    "position", position,...
    "backgroundcolor", backgrouncolor, ...
    "Resize", "off");  

endfunction


function title = title1(parent, message, x, y)                 
    title = uicontrol(parent, ...
    "Style", "text", ...
    "String", message, ...
    "fontsize", 20, ...
    "ForegroundColor", text_color, ...
    "Position", [x, y, title_width, title_height]);
    set(title, "BackgroundColor", backgrouncolor);
    set(title, "HorizontalAlignment", "center");
endfunction

function title = title2(parent, message, x, y)
    title = title1(parent, message, x, y);
    set(title, "fontsize", 13);
endfunction

function button = build_button(parent, x, y, label, callback)
    button = uicontrol(parent, ...
    "style", "pushbutton", ...
    "string", label, ...
    "position", [x, y, button_width, button_height], ...
    "callback", callback);
    set(button, "fontsize", 15);
    set(button, "BackgroundColor", button_color);
    set(button, "ForegroundColor", [0, 0, 0]); 


endfunction

function button = build_button_size(parent, x, y, label, callback, s1, s2)
    button = build_button(parent, x, y, label, callback);
    set(button, "position", [x, y, s1, s2]);

endfunction

function go_main()
    // "C:\Users\zahry\OneDrive\Bureau\scilab\projet_scilab\src\main.sce";   
    main_path = project_path + "src\main.sce";
    execute_file(main_path);
endfunction

function button = main_button(parent)
    button = build_button_size( ...
        parent, ...
        fragment/4, ...
        window_height - 50, ...
        "Home", ...
        "go_main();", ...
        100, ...
        30);
        set(button, "BackgroundColor", [180, 40, 40]/255);
        set(button, "ForegroundColor", [0, 0, 0]); 
endfunction

function go_filter()
    filter_path = project_path + "gui\filter.sce";
    execute_file(filter_path);
endfunction

function button = filter_button(parent)
    button = build_button_size( ...
        parent, ...
        fragment/4 + 100 + gaph, ...
        window_height - 50, ...
        "filter", ...
        "go_filter();", ...
        100, ...
        30);
endfunction

function button = small_button(parent, name, func)
    button = build_button_size( ...
        parent, ...
        fragment/4, ...
        50, ...
        name, ...
        func, ...
        100, ...
        30);
endfunction

function is_in_range = in_range(pixel)
    [i, j] = pixel
    is_in_range = i >= 0 && i <= 255
    is_in_range = is_in_range && j >= 0 && j <= 255
endfunction

function execute_file(path)
    exec(path);
endfunction

function matrix = random_matrix(rows, cols)
    matrix = grand(rows, cols, "uin", 0, 255);
endfunction


function display_notification(parent, message)
    
    notification = uicontrol(parent, ...
        "style", "text", ...
        "string", message, ...
        "position", [10, parent.figure_size(2) - 40, parent.figure_size(1) - 20, 30], ... // En haut de la fenêtre
        "backgroundcolor", [0.9, 0.9, 0.9], ...
        "horizontalalignment", "center", ...
        "fontsize", 12);
    
    // Garder le message affiché pendant 'duration' millisecondes
    sleep(2000);
    
    // Masquer le message après la durée spécifiée
    delete(notification);
endfunction


