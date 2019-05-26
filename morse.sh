if [ "$1" == "-h" -o "$1" == "" ]; then
	echo -e "\n\n\nTlumacz na jezyk Morse'a by Adrian Krzyzanowicz \n\n\nInstrukcja obslugi:\n\nUruchom skrypt przekazujac jako argument tekst, ktory ma zostac przetlumaczony. Jesli ponadto chcesz, by wynik tlumaczenia zostal zapisany do pliku, uzyj przelacznika -s, a nastepnie podaj nazwe pliku (bez rozszerzenia). Jesli chcesz zdefiniowac, jak maja wygladac symbole dla sygnalu krotkiego, sygnalu dlugiego i odstepu miedzy wyrazami, uzyj przelacznika -c w nastepujacy sposob:\n\n-d <krotki znak> <dlugi znak> (domyslnie krotki znak to . , dlugi to - , a odstep miedzy wyrazami to spacja (litery sa oddzielone jednym znakiem, a wyrazy - dwoma.\n\nPrzelacznikow nalezy uzywac w kolejnosci alfabetycznej.\n\nPrzykladowe uzycie przelacznikow:\n\n./s.sh -c [ ] = -s <plik> <tekst>\n\n"
fi
pomoc=0
zapis=0
if [ "$1" == "-c" -a "$5" != "-s" ]; then
	krotki="$2"
	dlugi="$3"
	odstep="$4"
	pomoc=4
fi
if [ "$1" == "-s" ]; then
	plik="$2"
	pomoc=2
	zapis=1
fi
if [ "$1" == "-c" -a "$5" == "-s" ]; then
	krotki="$2"
	dlugi="$3"
	odstep="$4"
	plik="$6"
	pomoc=6
	zapis=1
fi
if [ "$1" != "-c" ]; then
	krotki="."
	dlugi="-"
	odstep=" "
fi
a="$krotki$dlugi"
b="$dlugi$krotki$krotki$krotki"
c="$dlugi$krotki$dlugi$krotki"
d="$dlugi$krotki$krotki"
e="$krotki"
f="$krotki$krotki$dlugi$krotki"
g="$dlugi$dlugi$krotki"
h="$krotki$krotki$krotki$krotki"
i="$krotki$krotki"
j="$krotki$dlugi$dlugi$dlugi"
k="$dlugi$krotki$dlugi"
l="$krotki$dlugi$krotki$krotki"
m="$dlugi$dlugi"
n="$dlugi$krotki"
o="$dlugi$dlugi$dlugi"
p="$krotki$dlugi$dlugi$krotki"
q="$dlugi$dlugi$krotki$dlugi"
r="$krotki$dlugi$krotki"
s="$krotki$krotki$krotki"
t="$dlugi"
u="$krotki$krotki$dlugi"
v="$krotki$krotki$krotki$dlugi"
w="$krotki$dlugi$dlugi"
x="$dlugi$krotki$krotki$dlugi"
y="$dlugi$krotki$dlugi$dlugi"
z="$dlugi$dlugi$krotki$krotki" 
A="$krotki$dlugi"
B="$dlugi$krotki$krotki$krotki"
C="$dlugi$krotki$dlugi$krotki"
D="$dlugi$krotki$krotki"
E="$krotki"
F="$krotki$krotki$dlugi$krotki"
G="$dlugi$dlugi$krotki"
H="$krotki$krotki$krotki$krotki"
I="$krotki$krotki"
J="$krotki$dlugi$dlugi$dlugi"
K="$dlugi$krotki$dlugi"
L="$krotki$dlugi$krotki$krotki"
M="$dlugi$dlugi"
N="$dlugi$krotki"
O="$dlugi$dlugi$dlugi"
P="$krotki$dlugi$dlugi$krotki"
Q="$dlugi$dlugi$krotki$dlugi"
R="$krotki$dlugi$krotki"
S="$krotki$krotki$krotki"
T="$dlugi"
U="$krotki$krotki$dlugi"
V="$krotki$krotki$krotki$dlugi"
W="$krotki$dlugi$dlugi"
X="$dlugi$krotki$krotki$dlugi"
Y="$dlugi$krotki$dlugi$dlugi"
Z="$dlugi$dlugi$krotki$krotki"
touch wejscie.txt
for dd in `seq 1 $#`
do
	if [ $dd -gt $pomoc ]; then
	echo ${!dd} >> wejscie.txt
	fi
done
touch filtr1.txt
cat wejscie.txt | tr "\n" " " > filtr1.txt
rm wejscie.txt
words="$( cat filtr1.txt )"
echo $pomocnicza
rm filtr1.txt
touch out.txt
while test -n "$words"; do
   temp=${words:0:1}    
   echo ${!temp} >> out.txt
   words=${words:1}   
done
touch $plik
cat out.txt | tr "\n" "$odstep" > $plik
echo -e "\n\n\t\t Operacja zakonczona sukcesem - oto wynik tlumaczenia:"
cat $plik
if [ "$zapis" == "0" ]; then
	rm $plik
fi
rm out.txt