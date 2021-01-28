#include <iostream>
#include <vector>
#include <string>
#include <cstring>

using namespace std;

int main(){
    int n, pushNumber, commandNumber;
    char command[6];
    vector <int> stack;
    
    cin >> n;
    
    for (int i = 0; i < n; i++){
        cin >> command;
        if (strcmp(command, "push") == 0){
            cin >> commandNumber;
            stack.push_back(commandNumber);
        }
        else if (strcmp(command, "pop") == 0){
            if (stack.size() == 0){
                cout << -1 << endl;
            }   
            else{
                cout << stack.back() << endl;
                stack.pop_back();
            }
        }
        else if (strcmp(command, "size") == 0){
            cout << stack.size() << endl;
        }
        else if (strcmp(command, "empty") == 0){
            if (stack.size() == 0){
                cout << 1 << endl;
            }
            else{
                cout << 0 << endl;
            }
        }
        else{
            if (stack.size() == 0){
                cout << -1 << endl;
            }
            else{
                cout << stack.back() << endl;
            }
        }
    }
}
