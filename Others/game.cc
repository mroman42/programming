#include <vector>
#include <iostream>
using namespace std;

int max_score(vector<int>& nmb, vector<int>& maxs, int pos) {
    if (pos >= nmb.size())
	return 0;

    if (maxs[pos] != -1)
	return maxs[pos];

    // Take 1
    int min1 = min ({
	    max_score(nmb,maxs,pos+2), // Opponent takes 1
	    max_score(nmb,maxs,pos+3), // Opponent takes 2
	    max_score(nmb,maxs,pos+4) // Opponent takes 3
		}) + nmb[pos];

    // Take 2
    int min2 = min ({
	    max_score(nmb,maxs,pos+3), // Opponent takes 1
	    max_score(nmb,maxs,pos+4), // Opponent takes 2
	    max_score(nmb,maxs,pos+5) // Opponent takes 3
		}) + nmb[pos] + nmb[pos+1];

    // Take 3
    int min3 = min ({
	    max_score(nmb,maxs,pos+2), // Opponent takes 1
	    max_score(nmb,maxs,pos+3), // Opponent takes 2
	    max_score(nmb,maxs,pos+4)  // Opponent takes 3
		}) + nmb[pos] + nmb[pos+1] + nmb[pos+2];

    maxs[pos] = max({min1,min2,min3});
    return maxs[pos];
}

int main() {
    int cases;
    cin >> cases;
    
    for (int c=0; c<cases; c++) {
	// Reading numbers
	int n;
	cin >> n;
	vector<int> numbers;

	for (int i=0; i<n; i++) {
	    int input;
	    cin >> input;
	    numbers.push_back(input);
	}

	// Dynamic programming
	vector<int> maxs(n,-1);
	cout << max_score(numbers,maxs,0) << endl;
    }
    
    return 0;
}
