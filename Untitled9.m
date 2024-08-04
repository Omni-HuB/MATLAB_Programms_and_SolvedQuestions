xlabel('Seconday Load');
ylabel('power source efficiency');
Sload=[100,1000,9000,40000,200000];
NPeff=[51.377,11.123,1.3848,0.31209,0.06348];
IPeff=[99.323,98.98,99.80,99.727,99.97];

plot(Sload,IPeff,'r',Sload,NPeff,'g'),xlabel('Seconday Load'),ylabel('power source efficiency'),legend('for Ideal Transformer','For Non-Ideal Transformer')
% 
% Sload=[100,1000,9000,40000,200000];
% Teff=[69.04,42.582,5.8931,1.3547,0.27434];
% plot(Sload,Teff)
% plot(Sload,Teff),xlabel('Secondary Load'),ylabel('Transformer Efficiency')
% plot(Sload,Teff),xlabel('Secondary Load'),ylabel('Transformer Efficiency')