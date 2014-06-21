function opt = utlOptParse(optCells)
%Convert varargin into opt structure

nopt = numel(optCells);

if mod(nopt,2) == 1
    error('Some option value missing!');
end

opt = struct();

for oo =1:2:nopt-1
    name = optCells{oo};
    value = optCells{oo+1};
    if ~ischar(name)
        error('Some option name is not a string');
    end
    opt.(name) = value;
end
