m=str2num(get(handles.edit1,'string'));

b=str2num(get(handles.edit2,'string'));

k=str2num(get(handles.edit3,'string'));

Exciting_Function=get(handles.edit4,'string');

EF=strcat('@(t)',Exciting_Function);

string=str2func(EF);

x_0=str2num(get(handles.edit5,'string'));

v_0=str2num(get(handles.edit6,'string'));

t_initial=str2num(get(handles.edit7,'string'));

t_final=str2num(get(handles.edit8,'string'));

h=str2num(get(handles.edit9,'string'));


f1=@(t, x, v) v;

f2=@(t, x, v) (1/m)*(-k*x-b*v);


h1=h;

a=(t_final-t_initial)/h1;

a_rounded = round(a);

t(1)=t_initial;

x(1)=x_0;

v(1)=v_0;


for i=1:a_rounded

x(i+1)=x(i)+h1*f1(t(i), x(i), v(i));

v(i+1)=v(i)+h1*string(t(i))+h1*(f2(t(i), x(i), v(i)));

t(i+1)=t(i)+h1;

end


if ( (b^2) - ( 4*m*k ) < 0 )
    set(handles.edit10, 'string', 'Under-Damped');
end

if ( (b^2) - ( 4*m*k ) == 0 )
    set(handles.edit10, 'string', 'Critically Damped');
end

if ( (b^2) - ( 4*m*k ) > 0 )
    set(handles.edit10, 'string', 'Over-Damped');
end


plot(handles.axes1,t,x,'b');
grid on;
axis tight;
xlabel('Time');
ylabel('Position');


plot(handles.axes2,t,v,'r');
grid on;
axis tight;
xlabel('Time');
ylabel('Velocity');
