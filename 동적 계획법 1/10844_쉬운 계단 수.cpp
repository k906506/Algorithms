#include <iostream>
using namespace std;

int main(){
    long dp[100][10];
    int n;
    long sum = 0;
    
    cin >> n;
    
    dp[0][0] = 0;
    
    for(int i = 1; i < 10; i++){
        dp[0][i] = 1;
    }
    
    for(int i = 1; i < n; i++){
        for(int j = 0; j < 10; j++){
            if(j == 0){
                dp[i][j] = (dp[i-1][j+1])%1000000000;
            }
            else if(j == 9){
                dp[i][j] = (dp[i-1][j-1])%1000000000;
            }
            else{
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1])%1000000000;
            }
        }
    }
    
    for(int i = 0; i < 10; i++){
        sum += dp[n-1][i];
    }
    
    cout << sum%1000000000;
}
