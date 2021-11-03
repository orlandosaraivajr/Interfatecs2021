#include<iostream>
#include<string.h>

using namespace std;

struct TJegues {
  char Nome[50];
  int T[3]; // 0 p/ T1, 1 p/ T2 e 2 p/ Ch;
};

struct TVencedores {
  int TempoPri = INT_MAX;
  int TempoSeg = INT_MAX;
  int TempoTer = INT_MAX;
  char Pri[50];
  char Seg[50];
  char Ter[50];
};

void TrataEntrada(TVencedores *T, TJegues E, int ind) {
    if (E.T[ind] < T->TempoPri) {
      T->TempoTer = T->TempoSeg;
      T->TempoSeg = T->TempoPri;
      T->TempoPri = E.T[ind];
      strcpy(T->Ter, T->Seg);
      strcpy(T->Seg, T->Pri);
      strcpy(T->Pri, E.Nome);
    } 
    else if (E.T[ind] < T->TempoSeg) {
      T->TempoTer = T->TempoSeg;
      T->TempoSeg = E.T[ind];
      strcpy(T->Ter, T->Seg);
      strcpy(T->Seg, E.Nome);
    } 
    else if (E.T[ind] < T->TempoTer) {
      T->TempoTer = E.T[ind];
      strcpy(T->Ter, E.Nome);
    } 
}

int main () {
  int i;
  TVencedores T1, T2, Ch;
  TJegues aux;

  while (cin >> aux.Nome >> aux.T[0] >> aux.T[1] >> aux.T[2]) {
    TrataEntrada(&T1, aux, 0);
    TrataEntrada(&T2, aux, 1);
    TrataEntrada(&Ch, aux, 2);
  }  
  printf("T1 %s %s %s\n", T1.Pri, T1.Seg, T1.Ter);
  printf("T2 %s %s %s\n", T2.Pri, T2.Seg, T2.Ter);
  printf("CHEGADA %s %s %s\n", Ch.Pri, Ch.Seg, Ch.Ter);
  
  return 0;
}








