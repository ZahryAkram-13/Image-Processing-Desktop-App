disp('low filter')

close()





function low_filter_view()

    name = "Low Filter";
    position = [window_x, window_y, window_width, window_height];
    f = build_figure(name, position);

    home_button = main_button(f);
    filter_button(f);

    x_col1 = (window_width - 2*(button_width +100))/2;
    y_col1 = (window_height - button_height)/2;

    x = (window_width - button_width)/2;

    title_text = "Low Pass Filters";
    title_text2 = "Your can choose between these filters, click below";
    
    title1(f, title_text, x_col1, 2*third1-new_line);
    title1(f, title_text2, x_col1, 2*third1-2*new_line);

    filter = build_button_size(f, x, y_col1, "Low Pass Filters", "low_filters_figure();", button_width, button_height);


   
  
    test = small_button(f, "test", "test_filter_func();");
    
endfunction

low_filter_view()






function test_lowfilter_func()

endfunction


// // Create a context menu
// hMenu = uicontextmenu();

// // Create the menu items (that may be submenus)
// hItem1 = uimenu("Label", "Item1", "Parent", hMenu, "Callback", "disp(""Item1 clicked!"")");
// hItem2 = uimenu("Label", "Item2", "Parent", hMenu, "Callback", "disp(""Item2 clicked!"")");
// hItem3 = uimenu("Label", "Item3", "Parent", hMenu, "Callback", "disp(""Item3 clicked!"")");
