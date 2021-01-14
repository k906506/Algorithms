#include <iostream>
using namespace std;

int max(int a, int b){
    return a > b ? a : b;
}

int main(){
    int triangle[500][500];
    int dp[500][500];
    int n, result;
    
    cin >> n;
    
    for(int i = 0; i < n; i++){
        for(int j = 0; j <= i; j++){
            cin >> triangle[i][j];
        }
    }
    
    dp[0][0] = triangle[0][0];
    
    for(int i = 1; i < n; i++){
        for(int j = 0; j <= i; j++){
            if (j == 0){
                dp[i][j] = dp[i-1][j] + triangle[i][j];
            }
            else if (j == i){
                dp[i][j] = dp[i-1][j-1] + triangle[i][j];
            }
            else{
                dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j];
            }
        }
    }
    
    result = dp[n-1][0];
    
    for(int i = 0; i < n; i++){
        if (dp[n-1][i] > result){
            result = dp[n-1][i];
        }
    }
    
    cout << result;
}
