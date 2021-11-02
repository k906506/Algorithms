#include <iostream>
using namespace std;

int min(int a, int b){
    return a < b ? a : b;
}

int main(){
    int n;
    cin >> n;
    
    int cnt[1000001];
    cnt[1] = 0;
    cnt[2] = 1;
    cnt[3] = 1;
    
    if (n >= 4){
        for(int i=4; i<=n; i++){
            cnt[i] = cnt[i-1] + 1;
            if(i%3 == 0){
                cnt[i] = min(cnt[i], cnt[i/3] + 1);
            }
            if(i%2 == 0){
                cnt[i] = min(cnt[i], cnt[i/2] + 1);
            }
        }
    }
    cout << cnt[n];
    
    return 0;
}
