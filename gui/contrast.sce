disp('contrast')

close()







function contrast_view()

    f = build_figure("Contrast", [window_x, window_y, window_width, window_height])

    // f = figure( ...
    // "Position", [window_x, window_y, window_width, window_height], ...
    // "Name", "Contrast", ...
    // "MenuBar", "none", ...
    // "ToolBar", "none", ...    
    // "BackgroundColor", backgrouncolor, ...
    // "Resize", "off");

    home_button = main_button(f);

    x_col1 = (window_width - 2*(button_width +100))/2;
    y_col1 = (window_height - button_height)/2;

    title_text = "Augmente le contraste d une image avec trois méthodes."
    title1(f, title_text, x_col1, 2*third1-new_line);
    //title2(f, title_text, x_col1, 2*third1-new_line);
   
    build_button_size(f, x_col1, y_col1, "Egalisation d’histogramme", "method1();", button_width +100, button_height);
    build_button_size(f, x_col1 + button_width +100 + gaph, y_col1, "Extension linéaire de dynamique", "method2()", button_width +100, button_height);
    
    build_button_size(f, x_col1, y_col1 - 2*new_line, "ajustement gamma", "method3()", button_width +100, button_height);

    
    test = small_button(f, "test", "method3();")
    
endfunction

contrast_view()






