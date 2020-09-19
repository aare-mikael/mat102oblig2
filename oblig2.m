% Dette er innleveringsfilen som er til oblig2;

clear
close all

% Velger n og e slik som det står i oppgaveteksten;

n = 104523733;
e = 137;

% Oppgave a)

Kryptert = int64([1041706, 4139999]);
Dekryptert = int64([01041706, 04139999]);
OppgaveA =  "Beskjeden er: 'bergen  ';"
% Svaret er "bergen  ";

% Oppgave b)

% Kod meldingen "HEI SJEF"
melding = int64([07040899, 18090405]);
kodetmelding = int64([7040899, 18090405]);
OppgaveB = kodetmelding
% Svaret er "7040899 18090405";

% Oppgave c)

% Krypter meldingen fra b)
kryptertmelding(1) = powerMod(kodetmelding(1),e,n);
kryptertmelding(2) = powerMod(kodetmelding(2),e,n);
OppgaveC = kryptertmelding
% Svaret er "80423654 65347395";


% Oppgave d)

U = int64([16646055,76586540,40429350,81029513,98012653,6683466]);

% U^d mod n for å dekryptere
% Ettersom vi bare vet U, e og n, må vi bruke disse til å finne d, slik at
% vi kan dekryptere beskjeden.

% n = p*q
% p < sqrt(n) < q
% Eg skal no sjekke om n kan deles på p, altså om det blir et helt tall:
% Om det blir et helt tall har eg funnet både p og q, der q er resultatet

% Deklarerer en tabell med alle primtallene under kvadratroten til n
belowN = (Eratosthenes(sqrt(n)));

for index = 1 : length(belowN)
    i = belowN(index); % Henter ut verdien som er på plassen i tabellen vi er akkurat nå
    x = n/i; % Deler n på primtallet vi sjekker akkurat nå
    if rem(x,1)==0 % Denne linjen sjekker om x er et helt tall
        p = i; % Henter ut p
        q = n/i; % Henter ut q
    end
end

if n == p*q
   oppgaveD = "n og p*q er like" 
end
% Svaret er "n og p*q er like";

% Oppgave e)

% Det som må til for at (n,e) skal være en korrekt valgt nøkkel for RSA er
% at n er et produkt av to ulike primtall p og q som er holdt hemmelig.
% Videre må gcd(e,Ø(pq)) være lik 1, altså at største fellesnevner for e og
% (p-1)*(q-1) er 1. Kode for å sjekke dette er vist under:

phi = (p-1)*(q-1);
[gcd,x,y] = EuclideanAlgorithm2(e,phi); % Gir ut int64(1) i kommandovinduet
OppgaveE = "gcd = 1"
% Svaret er "gcd = 1";

% Oppgave f)

% For å rekne ut dekrypteringsnøkkelen må eg først få tak i p og q.
% Heldigvis har eg allerede gjort det, så eg kan gå rett vidare til å rekne
% ut d:
d = mod(x,phi); % Dette gir ut 41190593

for index = 1 : length(kryptertmelding)
    i = kryptertmelding(index);
    j = index;
    v = powerMod(i,d,n);
    w = kodetmelding(j);
end
if v == w
    OppgaveF = "Resultatet i deloppgave c) er riktig dekryptert"
end
% Svaret er "Resultatet i deloppgave c) er riktig dekryptert";

% Oppgave g)

% No har eg fått ut p, q og d, og er klar for å dekryptere
for index = 1 : length(U)
    i = U(index);
    powerMod(i,d,n);   
end

U1 = "pga ";
U2 = "coro";
U3 = "na e";
U4 = "r my";
U5 = "e du";
U6 = "mt  ";
OppgaveG = "pga corona er mye dumt  "
% Svaret er "pga corona er mye dumt  ";