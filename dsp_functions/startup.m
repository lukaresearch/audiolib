% This file sets the default settings for figures
clear; close all; clc;
disp('*** DSP Using MATLAB-Second Edition ***')
disp('          Chapter-3 Solutions'); disp(' ');
d = pwd; disp('Current Directory is: '); 
disp(d); clear d; disp(' ');
disp('The directory listing is:'); ls
format compact; colordef none;

% Default Parameters
set(0,'defaultaxesfontsize',8);
set(0,'defaultaxesfontweight','bold');
set(0,'defaultaxesfontname','times');
set(0,'defaultaxeslinewidth',1);
set(0,'defaultfigureunits','normalized');
set(0,'defaultfigureposition',[0.1,0.1,0.8,0.8]);
set(0,'defaultfigurepaperunits','inches');
set(0,'defaultfigurepaperposition',[0,0,5,3]);

% Figure Fonts
FNTSZ = 'Fontsize';
LFS = 10; % Label Font Size
TFS = 11; % Tirle Font Size

path('..\..\..\..\..\Matlab_Toolboxes\I&P_dsp_toolbox',path);
path('..\..\..\..\..\Matlab_Toolboxes\I&P_dsp_solution',path);

warning('off','MATLAB:dispatcher:InexactMatch')