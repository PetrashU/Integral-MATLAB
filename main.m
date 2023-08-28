f1 =@(x) x*exp(x);
clear table1
I1 = 0.735759;
Prosta = [];
Blad_prosta = [];
Zlozona = [];
Blad_zlozona = [];
Metoda = {'Prostokątów';'Trapezów';'Simpsona';'3/8'};


a = -1;
b = 1;
Prosta = [Prosta; rectangl(f1,a,b)];
Blad_prosta = [Blad_prosta; Prosta(end)-I1];
Prosta = [Prosta; trapezoid(f1,a,b)];
Blad_prosta = [Blad_prosta; Prosta(end)-I1];
Prosta = [Prosta; simpson(f1,a,b)];
Blad_prosta = [Blad_prosta; Prosta(end)-I1];
Prosta = [Prosta; threeight(f1,a,b)];
Blad_prosta = [Blad_prosta; Prosta(end)-I1];

%table1 = table(Metoda,Prosta,Blad_prosta)

Zlozona = [Zlozona; complex_int(f1,a,b,@rectangl,100)];
Blad_zlozona = [Blad_zlozona;Zlozona(end)-I1];
Zlozona = [Zlozona; complex_int(f1,a,b,@trapezoid,100)];
Blad_zlozona = [Blad_zlozona;Zlozona(end)-I1];
Zlozona = [Zlozona; complex_int(f1,a,b,@simpson,100)];
Blad_zlozona = [Blad_zlozona;Zlozona(end)-I1];
Zlozona = [Zlozona; complex_int(f1,a,b,@threeight,100)];
Blad_zlozona = [Blad_zlozona;Zlozona(end)-I1];

table1 = table(Metoda,Prosta,Blad_prosta, Zlozona, Blad_zlozona);
disp(table1);

n = 5;
h = 1;
for i = 1: n-1
    h = [h, h(i)/10];
end
blad = zeros(4,n);
for j = 1: 4
    for i = 1: n
        wynik = complex_zadanie(f1,h(i),j);
        blad(j,i) = wynik-I1;
    end
end
x = logspace(0,n-1,n);
blad = abs(blad);
loglog(x,blad(1,:), x, blad(2,:), x, blad(3,:), x, blad(4,:));
legend(Metoda);

