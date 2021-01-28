#include <iostream>
#include <vector>
#include <stack>

using namespace std;

int main() {
	int n, element;
	vector <int> v;
	stack <int> s;
	
	cin >> n;
	
	for (int i = 0; i < n; i++) {
		cin >> element;
		v.push_back(element);
	}
	
	vector <int> r(v.size(), -1);

	for (int i = 0; i < n; i++) {
	    while (!s.empty() && v[s.top()] < v[i]){
	        r[s.top()] = v[i];
	        s.pop();
	    }
	    s.push(i);
	}

	for (int i = 0; i < n; i++) {
		cout << r[i] << " ";
	}
}
