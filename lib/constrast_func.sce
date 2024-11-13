disp('constrast_func');

function toto()
    disp('toto');
endfunction

function [minn, maxx] = get_min_max(image)
    minn = 255;
    maxx = 0;
    for row = image'
        min_tmp = min(row);
        max_tmp = max(row);
        if min_tmp < minn then
            minn = min_tmp;
        end
        if max_tmp > maxx then
            maxx = max_tmp;
        end
    end
endfunction


function contrasted = extention_lineare_dynamique(image)
   [minn, maxx] = get_min_max(image);
   contrasted = (image - minn)*(255/(maxx - minn));
   contrasted = uint8(contrasted);
endfunction



function contrasted = histogram_egalisation(image)
    [rows, cols] = size(image)
    numbre_pixel = rows*cols;
    histo = imhist(image);
    comulated_h = comulated_histogram(histo);
    comulated_h = comulated_h*(255/numbre_pixel);
    contrasted = comulated_h(image + 1);
    contrasted = uint8(contrasted);
   
endfunction

function lunch_contrast(method, image)
    contrasted = method(image);
    displayImage(contrasted);
endfunction

function method1()
    image = download_image();
    contrasted = extention_lineare_dynamique(image)
    display_image_result(image, contrasted)
endfunction

function method2()
    name = "Histogram Egalisation"; 
    image = download_image();
    contrasted = histogram_egalisation(image);
    display_image_result(image, contrasted);
endfunction



function gamma = get_gamma()
    input_str = x_dialog("Value between 0 - 100", "95");  // Demande à l'utilisateur d'entrer un nombre
    gamma = evstr(input_str); 
endfunction


function method3()
    image = download_image();
    gamma = get_gamma();
    print("gamma ", gamma);
    if gamma > 0 && gamma <= 100 then
        gamma = gamma / 100;
        contrasted = (image .^ gamma)/255;
        display_image_result(image, contrasted);
    else
        messagebox("value not correct", "Error", "error", ["Continue"], "modal")
    end
endfunction

function test_contrast_func()
    method3()
endfunction

