#include <iostream>
#include <queue>
using namespace std;

int main(void){
    int n, toBack;
    queue<int> q;

    cin >> n;

    for(int i = 1; i <= n; i++){
        q.push(i);
    }

    while(q.size() > 1){
        q.pop();
        toBack = q.front();
        q.pop();
        q.push(toBack);
    }
    
    cout << q.front() << endl;
}
