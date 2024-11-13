		
RobotAutobalanceablePID


        VTR = 1.e-6;          %Error mínimo de aprendizaje
		D = 3;                %Número de cromosomas en los individuos
        refresh = 1;          %Cada cuantas iteraciones muestra el output

		XVmin = [0,0,0];      %Restricciones de tamaño en los cromosomas
		XVmax = [1,1,1];
		y=[0,0,0]; 

		NP = 30;              %Tamaño de la población, nº de individuos
		itermax = 200;        %Número máximo de iteraciones

		F = 0.8;              %Factor de mutación
		CR = 0.8;             %Factor de cruce

		strategy = 2;         %Estrategia de operadores
      


[x,f,nf] = devec3('tracklsq4',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh);

P = x(1)
I = x(2)
D = x(3)

set_param('RobotAutobalanceablePID/PID Controller','P',num2str(P));
set_param('RobotAutobalanceablePID/PID Controller','I',num2str(I));
set_param('RobotAutobalanceablePID/PID Controller','D',num2str(D));

yout = sim('RobotAutobalanceablePID',[0 10]);

