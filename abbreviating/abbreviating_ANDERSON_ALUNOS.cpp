#include <iostream>
#include <string>
#include <list>

using namespace std;

string abreviaNome(list<string> nomeDoConvidado){
    string result;
    list<string>::iterator it, aux;
    it = nomeDoConvidado.begin();
    aux = nomeDoConvidado.end();

    if(nomeDoConvidado.size() == 1){
        /* 
            caso o convidado tenha apenas um nome, 
            insiro o nome por completo na variavel result
        */
        result.append(*it);
    }
    else if(nomeDoConvidado.size() == 2){ 
        /* 
            caso o convidado tenha apenas dois nomes, 
            insiro o primeiro nome e o ultimo por completo na variavel result 
            com um espaço separando os dois nomes
        */
        result.append(*it++);
        result.append(" ");
        result.append(*it);
    }
    else{
        /* 
            Caso o nome do convidado tenhas mais de tres nomes e sobrenomes,
            primeiro savlo o primeiro nome por completo seguindo de um espaço,
            segundo crio um laço que vai até o penultimo nome do convidado,
            concatenando dentro de result apenas a primeira letra de cada sobrenome seguido de um ponto
            e um espaço, após chegar ao penultimo nome o laço termina indo para o ultimo nome,e logo apos
            o laço eu concateno o ultimo nome por completo.
         */
        char nomeAbreviado[4];

        result.append(*it++);
        result.append(" ");
        
        aux--;
        for (it ; it != aux; it++){
            nomeAbreviado[0] = (char) (*it).at(0);
            nomeAbreviado[1] = '.';
            nomeAbreviado[2] = ' ';
            nomeAbreviado[3] = '\0';

            result.append(nomeAbreviado);
        }
        result.append(*it);
    }
    return result;
}

string AbreviandoNomes(string str){
    list<string> tokens;
    list<string>::iterator it;
    string token, result;
    size_t posicao;

    //obtem nomes e sobrenomes separados por espaço, um de cada vez, e armazena de lista de tokens
    while((posicao = str.find(' ')) != string::npos){//pego a posição onde é encontrado o primeiro caracter de espaço dentro da string
        token  = str.substr(0, posicao); //obtenho uma substring da posição zero ate a posição onde foi achado o primeiro caracter de espaço
        tokens.push_back(token); //adiciono a substring na lista de tokens
        str.erase(0, posicao + 1); //apago substring da posição zero ate a posição onde foi achado o primeiro caracter de espaço, sobrando o resto da string
    }
    tokens.push_back(str);// pego o resto que sobrou da string

    result = abreviaNome(tokens); // obtenho a string vindo da função abreviaNome onde passo no paramentro a lista de tokens
    return result;
}

int main(void){
    list<string> listaDeConvidados;
    list<string>::iterator it;
    string nomeDoConvidado;

    while(getline(cin, nomeDoConvidado)){//le o nome do convidado por completo
        listaDeConvidados.push_back(AbreviandoNomes(nomeDoConvidado)); //adiciona string vindo da função Abreviando Nomes
    }

    //ordena a lista de convidados usando list.sort(), obs: complexidade n log n
    listaDeConvidados.sort();

    //imprime a lista de convidados ja ordenado
    for(it = listaDeConvidados.begin(); it != listaDeConvidados.end(); it++){
        cout << *it << endl;
    }

    return 0;
}