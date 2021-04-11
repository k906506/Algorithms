#include <iostream>
using namespace std;

int main(){
    int n, k, cnt;
    
    cin >> n >> k;
    
    int coin[1000000] = {0,};
    
    for(int i = 0; i < n; i++){
        cin >> coin[i];
    }
    
    cnt = 0;
    
    for(int i = n-1; i >= 0; i--){
        if(coin[i] <= k){
            while(k >= coin[i]){
                k -= coin[i];
                cnt += 1;
            }
        }
    }
    
    cout << cnt;
}
