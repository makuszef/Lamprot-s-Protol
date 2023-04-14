︠817ac987-f533-4521-88d3-6338f449519a︠
import hashlib
import binascii

#Procedura generacji skrótu wiadomosci(hasla)
#wejscie
#  mess - wiadomosc, argument funckji skrotu
#wyjscie
#  hash - wynik funckji skrotu w postaci szesnastkowej
def Funkcja_Skrotu(mess):
    d = hashlib.sha3_512()
    d.update(str(mess).encode())
    hash = d.hexdigest()
    print("Skrot: ", hash)
    return hash

#Procedura generowania przez uzytkownika n iteracji funkcji
#wejscie
#  n - liczba iteracji
#  k - liczba iteracji
#wyjscie
#  hashed_list - lista wynikow funckji skrotu w postaci szesnastkowej
def Inicjalizacja(n, k):
    #list w ktorej beda przetrzymywane wiadomosci
    hashed_list = []
    #x0 - losowa wartosc poczatkowa
    x0 = randint(2, k)
    print("x0 = ", x0)
    hash = Funkcja_Skrotu(x0)
    #generowanie n iteracji funkcji
    for i in range(0, n):
        hashed_list.append(hash)
        hash = Funkcja_Skrotu(hash)
    return hashed_list

#Procedura dla kroku 1
#wejscie
#  hashed_list - lista wynikow funckji skrotu w postaci szesnastkowej
#wyjscie
#  xk - aktualny identyfikator uzytkownika
def Krok1(hashed_list):
    print("Krok 1 użytkownik przesyła aktualny identyfikator xk")
    #ostatni element listy
    xk = hashed_list[-1]
    print("xk = ", xk)
    return xk

#Procedura dla kroku 2
#wejscie
#  xk - aktualny identyfikator uzytkownika
#  hashed_list - lista wynikow funckji skrotu w postaci szesnastkowej
#wyjscie
#  wartość boolowska True albo False
def Krok2(xk, hashed_list):
    print("Krok 2 system sprawdza istnienie użytkownika o otrzymanym identyfikatorze, po czym żąda podania hasła czyli xk−1")
    if (xk in hashed_list):
        print("xk(login) znajduje sie na liscie")
        return True
    else:
        print("xk(login) nie znajduje sie na liscie, odmowa dostepu")
        return False

#Procedura dla kroku 3
#wejscie
#  hashed_list - lista wynikow funckji skrotu w postaci szesnastkowej
#wyjscie
#  xk_1 - aktualne haslo uzytkownika
def Krok3(hashed_list):
    print("Krok 3 użytkownik podaje hasło xk−1")
    #przedostatni element listy
    xk_1 = hashed_list[-2]
    print("xk−1 = ", xk_1)
    return xk_1

#Procedura dla kroku 4
#wejscie
#  xk - aktualny identyfikator uzytkownika
#  xk_1 - aktualne haslo uzytkownika
#  hashed_list - lista wynikow funckji skrotu w postaci szesnastkowej
#wyjscie
#  wartość boolowska True albo False
def Krok4(xk, xk_1, hashed_list):
    print("Krok 4 system weryfikuje poprawność hasła, sprawdzając, czy f(xk−1) = xk, jeśli tak, to zapamiętuje xk−1 jako identyfikator przy następnym logowaniu")
    if (Funkcja_Skrotu(xk_1) == xk):
        print("Haslo poprawne, f(xk-1) = xk, zalogowano")
        return True
    else:
        print("Haslo niepoprawne, odmowa dostepu")
        return False

print("Protokol Lamprota")
# k - zakres losowanej wartosci poczatkowej
k = 10000
# n - liczba iteracji funkcji
n = randint(2, 10)
#Generowanie przez uzytkownika wartosci poczatkowych
hashed_list = Inicjalizacja(n, k)
#Krok1
xk = Krok1(hashed_list)
#Krok2
if (Krok2(xk, hashed_list) == False):
    #zakoncz protokol jesli login niepoprawny
    exit(0)
#Krok3
xk_1 = Krok3(hashed_list)
#Krok4
if (Krok4(xk, xk_1, hashed_list) == False):
    #zakoncz protokol jesli haslo niepoprawne
    exit(0)
else:
    #usun ostatni element z listy
    hashed_list.pop()
︡18ef45a5-4726-4a48-8222-e34337d10e9c︡{"stdout":"Protokol Lamprota\n"}︡{"stdout":"x0 =  3447\nSkrot:  115b602220ec21101d959b9fea746b731cfdb8f1b230a2642f28c6d240d08ad9671e972d94b7265006ebfbfaeedbdc503ce9de5349087d7be74ea418a7d40051\nSkrot:  671d2f9719fc903fecdf495543d244727c5a9316c9b1fae006ad20e302a7780c839d562cd25b833070501af2a1b94f7e9b635bd5b56479594f117ced1b55b291\nSkrot:  e16390c06dfc394d0b60fc00db110d5d9a84ff8703d6e08067abcfe4038577e7c25da9cab7b7ebbc805070d506d22840425e357dd91d8c5b1a402714f984f5ae\nSkrot:  cd626ceebd32b68124dce036a93045ba5e4c5bcccf7fe71f823276da49e0209bf13041983bd7082521914b8863bcb969706762682566fc4e18307faedcab17aa\n"}︡{"stdout":"Krok 1 użytkownik przesyła aktualny identyfikator xk\nxk =  e16390c06dfc394d0b60fc00db110d5d9a84ff8703d6e08067abcfe4038577e7c25da9cab7b7ebbc805070d506d22840425e357dd91d8c5b1a402714f984f5ae\n"}︡{"stdout":"Krok 2 system sprawdza istnienie użytkownika o otrzymanym identyfikatorze, po czym żąda podania hasła czyli xk−1\nxk znajduje sie na liscie\n"}︡{"stdout":"Krok 3 użytkownik podaje hasło xk−1\nxk−1 =  671d2f9719fc903fecdf495543d244727c5a9316c9b1fae006ad20e302a7780c839d562cd25b833070501af2a1b94f7e9b635bd5b56479594f117ced1b55b291\n"}︡{"stdout":"Krok 4 system weryfikuje poprawność hasła, sprawdzając, czy f(xk−1) = xk, jeśli tak, to zapamiętuje xk−1 jako identyfikator przy następnym logowaniu\nSkrot:  e16390c06dfc394d0b60fc00db110d5d9a84ff8703d6e08067abcfe4038577e7c25da9cab7b7ebbc805070d506d22840425e357dd91d8c5b1a402714f984f5ae\nHaslo poprawne, zalogowano\n'e16390c06dfc394d0b60fc00db110d5d9a84ff8703d6e08067abcfe4038577e7c25da9cab7b7ebbc805070d506d22840425e357dd91d8c5b1a402714f984f5ae'\n"}︡{"done":true}









