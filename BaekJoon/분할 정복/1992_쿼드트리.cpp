#include <iostream>
#include <string>
using namespace std;

int n;
int tree[64][64];

void find(int row, int col, int size){
    int check = tree[row][col];
    
    for (int i = row; i < row + size; i++){
        for (int j = col; j < col + size; j++){
            if (check != tree[i][j]){
                cout << '(';
                find(row, col, size/2);
                find(row, col + size/2, size/2);
                find(row + size/2, col, size/2);
                find(row + size/2, col + size/2, size/2);
                cout << ')';
                return;
            }
        }
    }
    cout << check;
}

int main(){
    string s;
    
    cin >> n;
    
    for (int i = 0; i < n; i++){
        cin >> s;
        for (int j = 0; j < n; j++){
            tree[i][j] = s[j] - '0';
        }
    }
    find(0, 0, n);
}
