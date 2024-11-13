// path = "C:\Users\zahry\OneDrive\Bureau\scilab\projet_scilab\src\main.sce"

// src/main.sci
global project_path test_path;
project_path = "C:\Users\zahry\OneDrive\Bureau\scilab\projet_scilab\";
test_path = project_path + "src/test.sce"
close();



cd(project_path + "lib\");
exec('util.sce');
exec('constrast_func.sce');
exec('transformation_func.sce');
exec('filter_func.sce');

exec('image_processing.sce');

cd(project_path + "gui\");
exec('home.sce');
//exec('filter.sce');
//disp("got it");


function lunch_tests(test_path)
    execute_file(test_path);
endfunction


// Lancer l'interface graphique
homeGUI();


//test part
//lunch_tests(test_path);

//clear variables


