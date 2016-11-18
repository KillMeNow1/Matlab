clear 
close all

% Creates a 2D Mesh to plot surface
x=linspace(0,1,100);
[X,Y] = meshgrid(x,x);

% make a new figure for movie 
fig = figure();

N=100; % Number of frames
M (1:N) = struct('cdata',[],'colormap',[]);
for i = 1:N
    Z = sin(2*pi*(X-i/N)).*sin(2*pi*(Y-i/N));
    surf(X,Y,Z)
    set(gcf,'Renderer','zbuffer') %Fix windows 7 transparency problem.
    M(i)=getframe(gcf); %leaving gcf out crops the frame 
end 
%movie(M)

movie2avi(M, 'WaveMovie.avi'); %Creating .avi file of the movie 



