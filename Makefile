#! /bin/make

CFLAGS = -L"lib" -Wall -lSDL2main -lSDL2 -lSDL2_image

mandelbrot: Mandelbrot_plot.cpp
	g++ -std=c++17 Mandelbrot_plot.cpp -I. $(CFLAGS) -o mandelbrot
