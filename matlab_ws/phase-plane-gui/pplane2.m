function varargout = pplane2(varargin)
% PPLANE2 MATLAB code for pplane2.fig
%      PPLANE2, by itself, creates a new PPLANE2 or raises the existing
%      singleton*.
%
%      H = PPLANE2 returns the handle to a new PPLANE2 or the handle to
%      the existing singleton*.
%
%      PPLANE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PPLANE2.M with the given input arguments.
%
%      PPLANE2('Property','Value',...) creates a new PPLANE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pplane2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pplane2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pplane2

% Last Modified by GUIDE v2.5 31-Mar-2017 14:43:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pplane2_OpeningFcn, ...
                   'gui_OutputFcn',  @pplane2_OutputFcn, ...
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


% --- Executes just before pplane2 is made visible.
function pplane2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pplane2 (see VARARGIN)

% Choose default command line output for pplane2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pplane2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pplane2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_xdot_Callback(hObject, eventdata, handles)
% hObject    handle to txt_xdot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_xdot as text
%        str2double(get(hObject,'String')) returns contents of txt_xdot as a double


% --- Executes during object creation, after setting all properties.
function txt_xdot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_xdot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_ydot_Callback(hObject, eventdata, handles)
% hObject    handle to txt_ydot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_ydot as text
%        str2double(get(hObject,'String')) returns contents of txt_ydot as a double


% --- Executes during object creation, after setting all properties.
function txt_ydot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_ydot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_minx_Callback(hObject, eventdata, handles)
% hObject    handle to txt_minx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_minx as text
%        str2double(get(hObject,'String')) returns contents of txt_minx as a double


% --- Executes during object creation, after setting all properties.
function txt_minx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_minx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_maxx_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maxx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maxx as text
%        str2double(get(hObject,'String')) returns contents of txt_maxx as a double


% --- Executes during object creation, after setting all properties.
function txt_maxx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_miny_Callback(hObject, eventdata, handles)
% hObject    handle to txt_miny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_miny as text
%        str2double(get(hObject,'String')) returns contents of txt_miny as a double


% --- Executes during object creation, after setting all properties.
function txt_miny_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_miny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_maxy_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maxy as text
%        str2double(get(hObject,'String')) returns contents of txt_maxy as a double


% --- Executes during object creation, after setting all properties.
function txt_maxy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graph_phase_plane.
function btn_graph_phase_plane_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graph_phase_plane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global equ_xdot;
global equ_ydot;

equ_xdot_=get(handles.txt_xdot, 'String');
equ_ydot_=get(handles.txt_ydot, 'String');

equ_xdot = strrep(equ_xdot_, 'x', 'x(1)');
equ_xdot = strrep(equ_xdot, 'y', 'x(2)');
equ_ydot = strrep(equ_ydot_, 'x', 'x(1)');
equ_ydot = strrep(equ_ydot, 'y', 'x(2)');

xmin = str2double(get(handles.txt_minx, 'String'));
xmax = str2double(get(handles.txt_maxx, 'String'));
ymin = str2double(get(handles.txt_miny, 'String'));
ymax = str2double(get(handles.txt_maxy, 'String'));
simtime = str2double(get(handles.txt_simtime, 'String'));
resolution = [str2double(get(handles.txt_resolutionh, 'String')) ...
    str2double(get(handles.txt_resolutionv, 'String'))];
phase_plot_2_interactive(@f, [xmin xmax; ymin ymax], simtime, ...
    {strcat('$\dot{x}=', equ_xdot_, '$') strcat('$\dot{y}=', equ_ydot_, '$')}, ...
    resolution);


function txt_simtime_Callback(hObject, eventdata, handles)
% hObject    handle to txt_simtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_simtime as text
%        str2double(get(hObject,'String')) returns contents of txt_simtime as a double


% --- Executes during object creation, after setting all properties.
function txt_simtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_simtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Callback function of the ODE
function xdot = f(t, x)
global equ_xdot;
global equ_ydot;

xdot(1,1) = eval(equ_xdot);
xdot(2,1) = eval(equ_ydot);



function txt_resolutionh_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resolutionh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resolutionh as text
%        str2double(get(hObject,'String')) returns contents of txt_resolutionh as a double


% --- Executes during object creation, after setting all properties.
function txt_resolutionh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resolutionh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_resolutionv_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resolutionv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resolutionv as text
%        str2double(get(hObject,'String')) returns contents of txt_resolutionv as a double


% --- Executes during object creation, after setting all properties.
function txt_resolutionv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resolutionv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function mnu_file_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_load_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] = uigetfile('*.dat', 'Select file');

if file ~= 0
    T = readtable(strcat(path, file));
    data = table2cell(T);
    set(handles.txt_xdot, 'String', data{1, :});
    set(handles.txt_ydot, 'String', data{2, :});
    set(handles.txt_minx, 'String', data{3, :});
    set(handles.txt_maxx, 'String', data{4, :});
    set(handles.txt_miny, 'String', data{5, :});
    set(handles.txt_maxy, 'String', data{6, :});
    set(handles.txt_simtime, 'String', data{7, :}); 
    set(handles.txt_resolutionh, 'String', data{8, :})
    set(handles.txt_resolutionv, 'String', data{9, :});
end


% --------------------------------------------------------------------
function mnu_save_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ode2ndorder = {get(handles.txt_xdot, 'String'); ...
    get(handles.txt_ydot, 'String'); ...
    get(handles.txt_minx, 'String'); ...
    get(handles.txt_maxx, 'String'); ...
    get(handles.txt_miny, 'String'); ...
    get(handles.txt_maxy, 'String'); ...
    get(handles.txt_simtime, 'String'); ...
    get(handles.txt_resolutionh, 'String');...
    get(handles.txt_resolutionv, 'String')};

[file, path] = uiputfile('myode.dat', 'Save file name');
if file ~= 0
    T = cell2table(ode2ndorder);
    writetable(T, strcat(path, file));
end


% --------------------------------------------------------------------
function mnu_help_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_instruction_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_instruction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Please try the provided examples (.dat files).'}, 'Instruction');


% --------------------------------------------------------------------
function mnu_about_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'manurunga@yandex.com'; 'http://kataauralius.com/'}, 'About', 'modal');
