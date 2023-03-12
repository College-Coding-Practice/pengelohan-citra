function varargout = erosi(varargin)
% EROSI M-file for erosi.fig
%      EROSI, by itself, creates a new EROSI or raises the existing
%      singleton*.
%
%      H = EROSI returns the handle to a new EROSI or the handle to
%      the existing singleton*.
%
%      EROSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EROSI.M with the given input arguments.
%
%      EROSI('Property','Value',...) creates a new EROSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before erosi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to erosi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help erosi

% Last Modified by GUIDE v2.5 23-Dec-2020 20:41:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @erosi_OpeningFcn, ...
                   'gui_OutputFcn',  @erosi_OutputFcn, ...
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


% --- Executes just before erosi is made visible.
function erosi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to erosi (see VARARGIN)

% Choose default command line output for erosi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes erosi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = erosi_OutputFcn(hObject, eventdata, handles) 
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
%syntax untuk memilih gambar
[FileName,PathName]=uigetfile('*.jpg','Pilih Fil Gambar');
%syntax untuk memberi variabel pada gambar yang dipilih
a=strcat(PathName,FileName);

%syntax untuk memasukkan variabel a sebagai nilai dari veriabel b
b=imread(a);

%syntax untuk mengabu-abukan citra asli
gray=rgb2gray(b);

%sytanx untuk mendilasi citra asli
se=strel('ball',3,3);
erosi=imerode(gray,se);

%syntax untuk menempatkan citra asli, keabuabuan, dan citra dilasi kedalam
%axes
axes(handles.axes1), imshow(b)
axes(handles.axes2), imshow(gray)
axes(handles.axes3), imshow(erosi)
