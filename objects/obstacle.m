%% GENERIC OBSTACLE CLASS (obstacle.m) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This class is designed to define a generic obstacle and import its variables 
% into the simulation space for the purpose of multi-vehicle control simulation.

% Author: James A. Douthwaite 20/05/2016

classdef obstacle < objectDefinition
%%% AGENT BASE CLASS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This class contains the basic properties of a generic agent, neither
    % aerial or ground based.
    properties
        % OBSTACLE VIRTUAL PROPERTIES

    end
%%  CLASS METHODS
    methods 
%       CONSTRUCTION METHOD
        function obj = obstacle(varargin)
            % This function is to construct the obstacle object using the
            % object defintions held in the 'objectDefinition' base class.
            
            % INPUT HANDLING
            if length(varargin) == 1 && iscell(varargin)                   % Catch nested cell array inputs
                varargin = varargin{:};
            end 
            
            % CALL THE SUPERCLASS CONSTRUCTOR
            obj = obj@objectDefinition(varargin); % Call the super class
            
            % ALLOCATE DEFAULT OBJECT-SPECIFIC CONSTANTS 
            obj.VIRTUAL.type = simulation_objectType.obstacle;
            obj.VIRTUAL.symbol = 'o';
            obj.VIRTUAL.size = 1;
            
            % CHECK FOR USER OVERRIDES
            [obj] = obj.configurationParser(varargin);
        end   
              
    end
    methods (Access = public)
        function obj = set_size(obj,newsize)
            assert(isnumeric(newsize) == 1,'Obstacle size must be numeric.');
            % ASSIGN NEW SIZE
            obj.VIRTUAL.size = newsize;
        end
    end
end
%%% STATE VECTOR IS DEFINED AS [x;y;z;psi;the;phi;v;u;w;p;q;r] %%%%%%%%%%%%
