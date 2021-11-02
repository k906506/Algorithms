#include <iostream>
using namespace std;

int n, resultMinus, resultZero, resultPlus;
int paper[2187][2187];

void solve(int row, int col, int size) {
    int check = paper[row][col];
    for (int i = row; i < row + size; i++) {
        for (int j = col; j < col + size; j++) {
            if (check != paper[i][j]) {
                solve(row, col, size / 3);
                solve(row, col + size / 3, size / 3);
                solve(row, col + size * 2 / 3, size / 3);
                solve(row + size / 3, col, size / 3);
                solve(row + size / 3, col + size / 3, size / 3);
                solve(row + size / 3, col + size * 2 / 3, size / 3);
                solve(row + size * 2 / 3, col, size / 3);
                solve(row + size * 2 / 3, col + size / 3, size / 3);
                solve(row + size * 2 / 3, col + size * 2 / 3, size / 3);
                return;
            }
        }
    }
    if (check == -1) {
        resultMinus++;
    }
    else if (check == 0) {
        resultZero++;
    }
    else {
        resultPlus++;
    }
}

int main() {

    cin >> n;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> paper[i][j];
        }
    }
    
    solve(0, 0, n);

    cout << resultMinus << endl;
    cout << resultZero << endl;
    cout << resultPlus << endl;

}
