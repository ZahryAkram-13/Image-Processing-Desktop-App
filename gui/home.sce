close()


contrast_file = "contrast.sce";
function call_contrast()
    execute_file(contrast_file);
endfunction

transformation_file = "transformation.sce";
function call_transformation()
    execute_file(transformation_file);
endfunction

filter_file = "filter.sce";
function call_filter()
    execute_file(filter_file);
endfunction


function test()
    disp("test function here");
    filters_figure(filters);
endfunction




function homeGUI()
    // Créer une figure principale
    f = figure(...
    "Position", [window_x, window_y, window_width, window_height], ...
    "Name", "window", ...
    "MenuBar", "none", ...
    "ToolBar", "none", ...    
    "BackgroundColor", backgrouncolor, ...
    "Resize", "off");

    
    title_text = "SAMANTHA studio";
    subtitle_text = "You can edit and tranform your images here";

    title1(f, title_text, get_xcol1(title_width), 2*third1 + ((third1 - title_height)/2));
    title2(f, subtitle_text, get_xcol1(title_width), 2*third1 + ((third1 - title_height)/2) -new_line);

    parag1 = "The application offers simple controls for quick "
    parag2 = "edits and enhancements, making image and videos "
    parag3 = "processing accessible for everyone."

    title2(f, parag1, get_xcol1(title_width), third1);
    title2(f, parag2, get_xcol1(title_width), third1 -new_line);
    title2(f, parag3, get_xcol1(title_width), third1 -2*new_line);

    y_button = window_height - button_start_y;

    contrast = build_button(f, get_xcol2(2*button_width), y_button, "Contrast", "call_contrast();");
    transformation = build_button(f, get_xcol2(2*button_width) + button_width , y_button-gapv, "transformation", "call_transformation();"); 
    filter = build_button(f, get_xcol2(2*button_width) + button_width, y_button-2*gapv, "Filter", "call_filter();");
    test = build_button(f, get_xcol2(button_width), y_button - 3*gapv, "test", "test();");
    
   
endfunction


