disp('filter')

close()

// lowfilter_file = "low_filter.sce";
// function call_low_filter()
//     execute_file(lowfilter_file);
// endfunction

// highfilter_file = "high_filter.sce";
// function call_high_filter()
//     execute_file(highfilter_file);
// endfunction



function filter_view()

    name = "Filter";
    position = [window_x, window_y, window_width, window_height];
    f = build_figure(name, position);

    home_button = main_button(f);

    x_col1 = (window_width - 2*(button_width +100))/2;
    y_col1 = (window_height - button_height)/2;

    title_text = "Filter Your Imgae Using Deffrent Operators"
    title1(f, title_text, x_col1, 2*third1-new_line);
    // title2(f, title_text, x_col1, 2*third1-new_line);
   
    build_button_size(f, x_col1, y_col1, "Low Pass Filter", "call_low_filter();", button_width +100, button_height);
    build_button_size(f, x_col1 + button_width +100 + gaph, y_col1, "High Pass Filter", "call_high_filter();", button_width +100, button_height);
    
    test = small_button(f, "test", "call_high_filter();");
    
endfunction

filter_view();






function test_filter()
    call_high_filter();
endfunction


//test_filter()

// // Create a context menu
// hMenu = uicontextmenu();

// // Create the menu items (that may be submenus)
// hItem1 = uimenu("Label", "Item1", "Parent", hMenu, "Callback", "disp(""Item1 clicked!"")");
// hItem2 = uimenu("Label", "Item2", "Parent", hMenu, "Callback", "disp(""Item2 clicked!"")");
// hItem3 = uimenu("Label", "Item3", "Parent", hMenu, "Callback", "disp(""Item3 clicked!"")");
