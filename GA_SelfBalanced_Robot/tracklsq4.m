function F = tracklsq4(pid,y)

P = pid(1);
I = pid(2);
D = pid(3);

if (P<0)||(D<0)||(I<0)||(P>1)||(D>1)||(I>1), F=1000000;
    return
else

set_param('RobotAutobalanceablePID/PID Controller','P',num2str(P));
set_param('RobotAutobalanceablePID/PID Controller','I',num2str(I));
set_param('RobotAutobalanceablePID/PID Controller','D',num2str(D));

yout = sim('RobotAutobalanceablePID',[0 10]);

F=sum(abs(yout(:,1)));
end