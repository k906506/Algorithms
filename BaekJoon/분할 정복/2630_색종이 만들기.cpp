#include <iostream>
using namespace std;

int n;
int square[128][128];
int white, blue;

void solve(int row, int col, int size){
    int check = square[row][col];
    
    for (int i = row; i < row + size; i++){
        for (int j = col; j < col + size; j++){
            if (square[i][j] != check){
                solve(row, col, size/2);
                solve(row, col + size/2, size/2);
                solve(row + size/2, col, size/2);
                solve(row + size/2, col + size/2, size/2);
                return;
            }
        }
    }
    
    if (check == 0){
        white++;
    }
    else{
        blue++;
    }
}

int main(){
    cin >> n;
    
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++){
            cin >> square[i][j];
        }
    }
    
    solve(0, 0, n);
    cout << white << endl;
    cout << blue << endl;
}
