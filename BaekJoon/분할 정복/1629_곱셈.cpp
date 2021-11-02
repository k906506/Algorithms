#include <iostream>
using namespace std;

long long division(int a, int b, int c){
    if (b == 0){
        return 1;
    }
    else{
        long long temp = division(a, b/2, c);
        if (temp%2){ // 홀수
            return (temp*temp)%c * a%c;
        }
        else{
            return (temp*temp)%c;
        }
    }
}

int main(){
    int a, b, c;
    cin >> a >> b >> c;
    cout << division(a, b, c);
}
