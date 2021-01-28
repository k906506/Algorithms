#include <iostream>
#include <string>

using namespace std;

int main() {
	int t, cnt;
	string vps;

	cin >> t;

	for (int i = 0; i < t; i++) {
		cnt = 0;
		cin >> vps;
		for (int j = 0; j < vps.size(); j++) {
			if (vps[j] == '('){
				cnt += 1;
			}
			else {
				cnt -= 1;
			}
			if (cnt < 0) {
				break;
			}
		}
		if (cnt != 0) {
			cout << "NO" << endl;
		}
		else {
			cout << "YES" << endl;
		}
	}
}
