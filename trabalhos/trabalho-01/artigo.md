#C++
##História
C++ foi desenvolvido por Bjarne Stroustrup durante a década de 80 e teve seu primeiro lançamento
em 1985. Stroustrup desenvolveu a linguagem c++ para melhorar a linguagem de programação C, mantendo a
compatibilidade entre a mesma. Além de manter a compatibilidade entre c e c++ ele inseriu elementos de outras
linguagens, como a SIMULA. O motivo para Bjarne ter escolhido C, foi a rapidez e a portabilidade da mesma para
diversas plataformas.
Outras referências que Bjarne usou, foram as seguintes linguagens: 
- Algol 68
- ADA
- CLU 
- ML

####Curiosidade
Há pessoas que dizem que o "++" que procede a consoante C no nome "C++", é uma alusão a uma das formas de 
incremento que é utilizado na  sintaxe da linguagem. como no exemplo  a seguir:

  

	#include<stdio.h>
	int main()
		{
			int c;
			c++; //Incremento na variável C
		}
Sabendo que C++ é a linguagem C incrementada, essa lógica citada acima faz todo sentido!

##Características
A linguagem C++ foi projetada para suportar múltiplos paradigmas de programação, principalmente programação 
estruturada e programação orientada a objetos, que permite ao programador escolher a melhor solução para um
determinado problema. Intitulamos C++ como uma linguagem multiparadigmas por ter as características descritas acima.
Outra característica é a tipagem estática, ou seja, a verificação do tipo de dado é feita em tempo de compilação.

##Comparação

###Linguagem C                                       

Programação estruturada 

   Tipagem estática   
   
    #include<stdio.h>				
	  int main()						
	  {						
	     printf("Hello, World\n!");		
    }			
    
###Linguagem C++

Multiparadigma

   Tipagem estática 
   
   
    #include<iostream>
    int main()
    {
        std::cout<<"Hello, world!"<<"\n";
    }
   **As linguagens descritas acima tem sintaxe diferente e semântica igual.**

##Vantagens
		#include <iostream>

		class Data
		{
			int dia;
			int mes;
			int ano;
			void escreve()
			{
				cout<<dia<<'/'<<mes<<'/'<<ano;
			}
			void le()
			{
				char barra1, barra2;
				cin>>dia>>barra1>>mes>>barra2>>ano;	
			}
		};

		main()
		{
			Data d={1,12,2000};
			d.escreve();
			d.le();
			d.escreve();
			return 0;
		}

No código acima temos a implementação de uma classe que pega datas e imprime as mesmas. Em c++ esta implementação é melhor organizada do que na linguagem C. Isso faz com que se entenda o código mais facilmennte.

- A classe "clock" é definida da seguinte maneira: 


		class clock
       		{ 
        	      protected: 
				int hr; 
				int min; 
				int sec; 
				int is_pm; 
        	      public: 
			      	clock(int h, int m, int s, int pm); 
			      	void set_clock (int h, int m, int s, int pm);  
			      	void read_clock (int &h, int &m, int &s, int &pm); 
			      	void advance(); 
		};
	
	
- Temos também a classe calendar

		class calendar
		{ 
			protected: 
					int mo; 
					int day; 
        			int yr; 
	  		public:
        			calendar(int m, int d, int y); 
        			void set_calendar (int m, int d, int y);  
				void read_calendar (int &m, int &d, int &y);  
				void advance();
		};
	
- E a classe clock_calendar é a classe filha dessas duas outras classes, isso se chama herança múltipla 
e torna nosso código mais genérico, entre outras coisas, como, menos linhas de comando pra digitar. 


        class clock_calendar : public clock, public calendar { 
        	 public: 
        	 	clock_calendar(int mt, int d, int y, int h, int mn,int s, int pm); 
        	 	void advance(); 
        };

##Códigos representtivos
C++ é uma linguagem de uso geral e já foi utilizada para diversas aplicações, como na lista a seguir:

- Windows
- Apple OsX
- Beos
- Solaris
- Symbian(S.O para celulares)
- Buca do Google
- Sistema comercial da Amazon
- Adobe(Photoshop, Illustrador)
- Maya e autocad
- Doom III

##Conclusão

C++ é uma das linguagens mais utilizadas do mundo, ocupando a 5° posição no ranking da Redmonk. Faz sucesso
por ser uma linguagem multiparadigma e de uso geral. Um dos motivos para tal sucesso é a existência de várias
possibilidades para resolver um determinado problema.

##Bibliografia
   
  - [Apostila  C++](http://www.cin.ufpe.br/~rmd2/C++/Apostila_C++.pdf)
  - [Wikipedia C++](https://pt.wikipedia.org/wiki/C%2B%2B)
