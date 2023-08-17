# CS293-MandelbrotZoom

-----------------------------------------------------
CS293 (Autumn 2021) Course Project Submission
Molina Dhembla (200050076)
-----------------------------------------------------

Demo video Link:
    https://drive.google.com/drive/folders/1dNRT58yRXImeGchjOBAzje1Sa1IubwDV?usp=sharing

Submission directory structure:

    *
    |- Mandelbrot_plot.cpp
    |- Makefile
    |- README.txt
    |- Iteration_vs_renderTime plot.png
    |- iteration_vs_renderTime data.csv
    |- sample_run.png



To run the code:

    Compiling via Makefile--
    simply type make in terminal (in same directory as code) and then executable via: ./mandelbrot

    OR

    Commands to compile and run the code on terminal--
    g++ -std=c++17 Mandelbrot_plot.cpp -I"include" -L"lib" -Wall -lSDL2main -lSDL2 -lSDL2_image -o mandelbrot
    ./mandelbrot


Once executed:

    A new SDL window will open up, initially it will be completely black
    Click any button on your mouse or keyboard to generate the first render
    Once rendered, it will respond to mouse clicks for zoom in and keyboard button presses for zoom out
    The x and y limits along with the MAX_ITERATIONS and time to render frame will be printed on the termial as you zoom in/out
    The second and subsequent times that you render a layer, the time will decrease substantially due to stored data

    FIRST RENDER: CLICK/PRES ANY BUTTON
    SUBSEQUENT--
        MOUSE CLICK: ZOOM IN 
        ANY KEYBOARD BUTTON PRESS: ZOOM OUT 

GRAPHICS LIBRARY:
	used SDL (Simple DirectMedia Layer) for the plot and event- response handling

--------------------------------------------------------

Idea implemented:

    Escape Time Algorithm:

        follows the basic definition of Mandelbrot set which defines the mapping of 'stability' as the
        numnber of repeated application of function z^2 + c at z=0, c = x + iy for the value to exeed |2|.

        function get_break_value(x,y) implemented to return number i where c=x+iy escapes |2| for the first time at the i_th iteration 
        MAX_ITERATIONS variable set to a reasonably high value which sets the upper bound for number of checks.
        if the distance measure value for a point does not exeed |2| until MAX_ITERATIONS, it is deemed 'stable'


    Colouring Algorithm:

        interprets the break-value-iteration as 'stability' and maps it to a colour (r,g,b) value
        function get_colour(break_number) implements this and returns a tuple of r-g-b values
        uses break_number/MAX_ITERATIONS to map values from 0 to 255

        in the final code stability order is as follows: central-black > blue > green > red shades
        and within a colour, lighter tones > darker tones in stability. (2 alternate colourings in code comments)


    Data Storage/ideated data structure:

        struct pixel and class layer defined to store data which prevents repeated computations at same zoom value
        once remdered, the layer object will be created and  initialized 
        it will be stored as sets of 'pixels' objects  which have x,y and r,g,b values as members
        any subsequent render of the same zoom value will simpke extract data from this layer object
        substantiallydecreases the time taken

        stores necessary data to improve efficiency of code and avoid repetitive calculation)
        decreases time complexity at the expense space/memory usage

        struct pixel represents each coloured space/box on the window
        class layer represents a particular window render (corresponding to zoom value)

----------------------------------------------------------

References:
    https://dev.to/noah11012/using-sdl2-events-2il3
    https://www.youtube.com/watch?v=KnCNfBb2ODQ&t=2052s

----------------------------------------------------------
