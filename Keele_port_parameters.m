    %Define the Parameters 
fs = 50;  %Resonant frequency of the transducer 
Qts =  0.4; % Quality factor of the transducer 
Vas = 42.5; %Compliance of the volume (Litres)

%%%%%%%%KEELES PARAMETERS%%%% IDEAL PARAMETERS
Vb = 15 * Vas * (Qts^(2.87)); % Optimal volume of the box 
f3db = 0.26*fs*(Qts^(-.14));  % 3db frequency
fb = 0.42*fs*(Qts^(-0.9));   %Box frequency 

%%%%%%Assuming the box size 
%Parameters to calculate the frequency response 
A=fb^2/fs^2;
B=A/Qts+fb/(7*fs);
C=1+A+fb/(7*Qts*fs)+Vas/Vb;
D=1/Qts+fb/(7*fs);

%%%Manually entering the box volume and calulating the parameters
Vbhalf=Vb/2;
fbhalf=(Vas/Vbhalf)^0.32*fs;

Ah=fbhalf^2/fs^2;
Bh=A/Qts+fbhalf/(7*fs);
Ch=1+A+fbhalf/(7*Qts*fs)+Vas/Vbhalf;
Dh=1/Qts+fbhalf/(7*fs);

%%Plotting the frequency response 
f=logspace(1,4,1000);
Fn2 = (f/fs).^2;
Fn4 = Fn2.^2;
%fn=f/fs;    
resp = 10*log10(Fn4.^2./((Fn4-C.*Fn2+A).^2 + Fn2.*(D.*Fn2-B).^2));
resphalf = 10*log10(Fn4.^2./((Fn4-Ch.*Fn2+Ah).^2 + Fn2.*(Dh.*Fn2-Bh).^2));
semilogx(f,[resp; resphalf]);
xlabel('Frequency (Hz)')
ylabel('Response (dB)')
legend('optimal','box volume half');





