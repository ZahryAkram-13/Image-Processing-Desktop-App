disp('transformation')

close()






function transformation_view()


    f = figure( ...
    "Position", [window_x, window_y, window_width, window_height], ...
    "Name", "window", ...
    "MenuBar", "none", ...
    "ToolBar", "none", ...    
    "BackgroundColor", backgrouncolor, ...
    "Resize", "off");

    home_button = main_button(f);
    //display_notification(f, "hhhhhh");


    x_col1 = (window_width - 2*(button_width +100))/2;
    y_col1 = (window_height - button_height)/2;

    parag1 = "You can transform your images and applie ."
    parag2 = "geometrical transformations"
    title1(f, parag1, x_col1, 2*third1);
    title1(f, parag2, x_col1, 2*third1-new_line);


    build_button_size(f, x_col1, y_col1, "Flip Horizontal", "flip_horizontaly();", button_width +100, button_height);
    build_button_size(f, x_col1 + button_width +100 + gaph, y_col1, "Flip Horizontal", "flip_verticaly();", button_width +100, button_height);
    build_button_size(f, x_col1, y_col1 - 2*new_line, "Flip Mixte", "flip_mixte()", button_width +100, button_height);
    build_button_size(f, x_col1 + button_width +100 + gaph, y_col1 - 2*new_line, "Rotate", "rotate();", button_width +100, button_height);

    test = small_button(f, "test", "test_transformation_func();")    

    
endfunction

transformation_view()






