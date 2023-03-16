#include <iostream>
using namespace std;

int max(int a, int b){
    return a > b ? a : b;
}

int main(){
    int n, a[100000];
    
    cin >> n;
    
    for(int i = 0; i < n; i++){
        cin >> a[i];
    }
    
    int temp = a[0];
    int max_temp = a[0];
    for(int i = 1; i < n; i++){
        temp = max(a[i], temp + a[i]);
        max_temp = max(max_temp, temp);
    }
    
    cout << max_temp;
}
