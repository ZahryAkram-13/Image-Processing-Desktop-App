disp('high filter')

close()





function high_filter_view()

    name = "High Filter";
    position = [window_x, window_y, window_width, window_height];
    f = build_figure(name, position);

    home_button = main_button(f);
    filter_button(f);


    x_col1 = (window_width - 2*(button_width +100))/2;
    y_col1 = (window_height - button_height)/2;

    x = (window_width - button_width)/2;

    title_text = "High Pass Filter";
    title_text2 = "Your can choose between these filters";

    title1(f, title_text, x_col1, 2*third1-new_line);
    title1(f, title_text2, x_col1, 2*third1-2*new_line);
   
    filter = build_button_size(f, x, y_col1, "High Pass Filter", "high_filters_figure();", button_width, button_height);
      
    show = small_button(f, "show", "test_highfilter_func();");
    
endfunction

high_filter_view()


function test_highfilter_func()
    // filter = get_filter();
    // filter = string(filter);
    // disp(filters(filter));
    //filters_figure(filters);
endfunction

//test_highfilter_func()
