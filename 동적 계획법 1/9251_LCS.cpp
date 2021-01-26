#include <iostream>
#include <string>
using namespace std;

int max(int a, int b){
    return a > b ? a : b;
}

int main(){
	string a, b;
	int row, column;
	int dp[1001][1001] = {0,};
	
	cin >> a >> b;
	
	row = a.length();
	column = b.length();
	
	for(int i = 1; i <= row; i++){
	    for(int j = 1; j <= column; j++){
	        if(a[i-1] == b[j-1]){
	            dp[i][j] = dp[i-1][j-1] + 1;
	        }
	        else{
	            dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
	        }
	    }
	}
	
	cout << dp[row][column];
}
