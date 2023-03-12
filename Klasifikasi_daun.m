function varargout = Klasifikasi_daun(varargin)
% KLASIFIKASI_DAUN MATLAB code for Klasifikasi_daun.fig
%      KLASIFIKASI_DAUN, by itself, creates a new KLASIFIKASI_DAUN or raises the existing
%      singleton*.
%
%      H = KLASIFIKASI_DAUN returns the handle to a new KLASIFIKASI_DAUN or the handle to
%      the existing singleton*.
%
%      KLASIFIKASI_DAUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLASIFIKASI_DAUN.M with the given input arguments.
%
%      KLASIFIKASI_DAUN('Property','Value',...) creates a new KLASIFIKASI_DAUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Klasifikasi_daun_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Klasifikasi_daun_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help Klasifikasi_daun
 
% Last Modified by GUIDE v2.5 23-Oct-2016 15:06:14
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Klasifikasi_daun_OpeningFcn, ...
                   'gui_OutputFcn',  @Klasifikasi_daun_OutputFcn, ...
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
 
 
% --- Executes just before Klasifikasi_daun is made visible.
function Klasifikasi_daun_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Klasifikasi_daun (see VARARGIN)
 
% Choose default command line output for Klasifikasi_daun
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
 
% UIWAIT makes Klasifikasi_daun wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = Klasifikasi_daun_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.*'});
 
if ~isequal(nama_file,0)
    I = imread(fullfile(nama_path,nama_file));
    axes(handles.axes1)
    imshow(I)
    handles.I = I;
    guidata(hObject,handles)
else
    return
end
 
 
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.I;
J = I(:,:,1);
K = im2bw(J,.6);
L = imcomplement(K);
str = strel('disk',5);
M = imclose(L,str);
N = imfill(M,'holes');
O = bwareaopen(N,5000);
stats = regionprops(O,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;
 
input = [metric;eccentricity];
 
load net
output = round(sim(net,input));
 
axes(handles.axes2)
imshow(O)
 
if output == 1
    kelas = 'Bougainvillea';
elseif output == 2
    kelas = 'Geranium';
elseif output == 3
    kelas = 'Magnolia soulangeana';
elseif output == 4
    kelas = 'Pinus';
end
 
set(handles.edit1,'String',kelas)
     
 
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
 
 
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end