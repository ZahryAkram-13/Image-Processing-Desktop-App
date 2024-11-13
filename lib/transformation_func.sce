disp('transformation_func');





function flipped = flip_horizontaly()
    image = download_image()
    flipped = image($:-1:1, :, :);
    display_image_result(image, flipped)

endfunction

function flipped = flip_verticaly()
    image = download_image()
    flipped = image(:, $:-1:1, :);
    display_image_result(image, flipped)
endfunction

function flipped = flip_mixte()
    image = download_image()
    flipped = image($:-1:1, $:-1:1, :);
    display_image_result(image, flipped)

endfunction


function [ok, theta] = create_box_window()
    theta = 30;
    labels=["theta"];

    [ok, theta] = getvalue("Angle de rotaion", ...
    labels,...
    list("intvec", 1), ...
    [string(theta)]);

    if ok == %t then
        if theta > 0 && theta < 360 then
            disp("Angle de rotation saisi : " + string(theta));
        else
            messagebox("Theta must be between 0 - 360", "Error", "error", ["Continue" "Stop"], "modal")
        end
    else
        disp("Action Canceled");
        messagebox("Action Canceled", "Error", "error", ["Continue" "Stop"], "modal")

        
    end

endfunction


function rotate()
    image = download_image();
    [ok, theta] = create_box_window();
    print("typ of theta ", theta);
    print("typ of ok ", ok);
    if ok == %t then
        image_rotated = imrotate(image, theta);
        display_image_result(image, image_rotated);
    else
        disp('can t rotate');
    end
    

endfunction


function test_transformation_func()
    rotate();
endfunction
