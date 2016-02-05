#include <iostream>
using namespace std;

int main(){
	const int COLS = 8;
	const int ROWS = 8;
	char grid[COLS][ROWS];
	for (int i = 0; i < ROWS; i++){
		for (int j = 0; j < COLS; j++){
			if((j+i)%2==1){
				grid[j][i] = 'X';
				}else if(j%2==1){
				grid[j][i] = '#';
				}else if(j%2==0){
				grid[j][i] = '@';
				}
			}
		}

	int x = 5;
	int y = 6;


	char input;
	char direction;
	while (input != 'q'){
		
		for (int i = 0; i < ROWS; i++){
			for (int j = 0; j < COLS; j++){
				cout << grid[j][i];
			}
			cout << endl;
		}

		cin >> input;
	}

	return 0;
}