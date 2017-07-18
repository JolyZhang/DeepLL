function varargout = checkChessStatus(varargin)
% CHECKCHESSSTATUS MATLAB code for checkChessStatus.fig
%      CHECKCHESSSTATUS, by itself, creates a new CHECKCHESSSTATUS or raises the existing
%      singleton*.
%
%      H = CHECKCHESSSTATUS returns the handle to a new CHECKCHESSSTATUS or the handle to
%      the existing singleton*.
%
%      CHECKCHESSSTATUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHECKCHESSSTATUS.M with the given input arguments.
%
%      CHECKCHESSSTATUS('Property','Value',...) creates a new CHECKCHESSSTATUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before checkChessStatus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to checkChessStatus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help checkChessStatus

% Last Modified by GUIDE v2.5 18-Jul-2017 04:16:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @checkChessStatus_OpeningFcn, ...
                   'gui_OutputFcn',  @checkChessStatus_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before checkChessStatus is made visible.
function checkChessStatus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to checkChessStatus (see VARARGIN)

% Choose default command line output for checkChessStatus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
disp(handles);
% UIWAIT makes checkChessStatus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = checkChessStatus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.bmp;*.jpg;*.jpeg;*.gif', 'Image Files (*.bmp, *.jpg, *., *.jpeg;*.gif)'; ...
    '*.*', 'All Files (*.*)'}, ...
    'Pick an image');
if isequal(filename,0) || isequal(pathname,0)
    return;
end

%
handles.p = 1;
guidata(hObject,handles);
%
pfile = [pathname,filename];
[I,map] = imread(pfile);
axes(handles.a1);
if ~isempty(map)
    I = ind2rgb(I,map);
end
% subplot(2,1,1);
%subplot(1,2,1);
imshow(I);
% 
% gray = rgb2gray(I);
% 
% subplot(1,2,2);
% imshow(gray);

%subplot(2,1,2);


% 
% inds = findstr(pathname,'\');
% len = length(inds);
% filename=[pathname(inds(len-1)+1:inds(len)-1),'_',filename];
% % 
% % set(handles.annotation,'String',pathname(inds(len-1)+1:inds(len)-1));
% set(handles.annotation,'String',Annotation(filename));
% %sscanf(filename,'%d',img_index);
% %set(handles.annotation,'String',filename);
set(handles.FEN,'String',test(pfile));
