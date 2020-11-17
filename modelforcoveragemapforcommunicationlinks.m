% Define transmitter site at  (SION CIRCLE, MU)
fq = 6e9; % 6 GHz
tx = txsite('Name','sion circle', ...
    'Latitude',19.043020, ...
    'Longitude',72.864045, ...
    'Antenna',design(circularArray,fq), ...
    'AntennaHeight',0.5, ...        % Units: meters
    'TransmitterFrequency',fq, ... % Units: Hz
    'TransmitterPower',4.7);        % Units: Watts

% Define receiver sites in several surrounding towns and cities
rxNames = {...
   'kj somaiya, MU','ghatkopar, MU','bkc, MU','Mahim, MU', ...
   'kings circle, MU','wadala, MU','dadar, MU','cs airport, MU'};

rxLocations = [...
   19.046083 72.870898; ... % kj somaiya
   19.085120 72.908535; ... % ghatkopar
   19.067429 72.864400; ... % bkc
   19.042030 72.840098; ... % Mahim
   19.030224 72.857862; ... % kings circle
   19.026483 72.876875; ... % wadala
   19.018215 72.843105; ... % dadar
   19.013888 73.014979];    % seawoods

% Define receiver sensitivity. Sensitivity is the minimum signal strength in
% power that is necessary for the receiver to accurately detect the signal.
rxSensitivity = -80; % Units: dBm
fq = 6e9; % 6 GHz

rxs = rxsite('Name',rxNames, ...
    'Latitude',rxLocations(:,1), ...
    'Longitude',rxLocations(:,2), ...
    'Antenna',design(dipole,fq), ...
    'AntennaHeight',0.005, ...        % Units: meters
    'ReceiverSensitivity',rxSensitivity); % Units: dBm
viewer = siteviewer;
show(tx)
show(rxs)

viewer.Basemap = "openstreetmap";

coverage(tx,'freespace', ...
    'SignalStrengths',rxSensitivity)

link(rxs,tx,'freespace')