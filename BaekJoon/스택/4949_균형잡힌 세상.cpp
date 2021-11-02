#include <iostream>
#include <string>
#include <stack>

using namespace std;

int find(string vps){
    stack<int> s;
    for (int j = 0; j < vps.size(); j++) {
		if (vps[j] == '('){
			s.push('(');
		}
		else if (vps[j] == '['){
			s.push('[');
		}
		else if (vps[j] == ')'){
			if (!s.empty() && s.top() == '('){
			    s.pop();
			}
			else{
			    return 1;
			}
		}
		else if (vps[j] == ']'){
			if (!s.empty() && s.top() == '['){
			    s.pop();
			}
			else{
			    return 1;
			}
		}
    }
    if (s.empty()){
        return 0;
    }
    else{
        return 1;
    }
}

int main() {
	int result = 0;
	string vps;
	
	getline(cin, vps);

	while (vps.size() != 1 && vps[0] != '.'){
	    result = find(vps);
	    if (result == 0){
	        cout << "yes" << endl;
	    }
	    else{
	        cout << "no" << endl;
	    }
	    getline(cin, vps);
	}
}
