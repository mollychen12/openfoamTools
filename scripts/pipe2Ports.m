% pipe.m
	%  
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%          build the chain matrix          %
	%    a pipe of a lossless pipe length l    %
	%                                          % 
	%            Paul Darlington               %
	%                                          %
	%          Paul@appledynamics.com          %
	%                                          %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%
	% Input variables......
	% length=l
	% cross sectional area s
	% vector of frequencies = freq

	function [chain] = pipe(l,s,freq)

	omega = 2*pi*freq;
	c = 340;
	kL = (l/c)*omega;
	rhocs = 415/s;

	% Build chain matrix

	chain(1,1,:) = cos(kL);
	chain(1,2,:) = j*rhocs*sin(kL);
	chain(2,1,:) = j/rhocs*sin(kL);
	chain(2,2,:) = cos(kL);