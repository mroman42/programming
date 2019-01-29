#include<iostream>
#include<vector>
#include<queue>
#include<map>
using namespace std;
typedef pair<int,int> edge;
typedef vector< map<int,int> > vvi;
typedef map<int,int>::iterator mii;

class edgecomp {
public:
  bool operator() (edge const& lhs, edge const& rhs) {
    return lhs.second > rhs.second;
  }
};

int main() {
  std::ios_base::sync_with_stdio(false);
  int cases; cin >> cases;
  for (int t=0; t<cases; t++) {
    // Initialization
    int n,m; cin >> n >> m;
    vvi graph = vvi(n+1,map<int,int>());
    
    for (int i=0; i<m; i++) {
      int x,y,r; cin >> x >> y >> r;

      // Replaces distances
      mii ix = graph[x].find(y);
      if (not (ix != graph[x].end() and ix->second <= r))
	graph[x][y] = r;
      mii iy = graph[y].find(x);
      if (not (iy != graph[y].end() and iy->second <= r))
	graph[y][x] = r;
    }

    int s; cin >> s;
    
    // Dijkstra
    vector<int> distance(n+1,-1);
    vector<bool> visited(n+1,false);
    distance[s] = 0;
    priority_queue<edge,vector<edge>,edgecomp> to_visit;
    to_visit.push(make_pair(s,0));

    while (not to_visit.empty()) {
      edge edge = to_visit.top();
      int node  = edge.first;
      int dist  = distance[node];
      to_visit.pop();

      if (not visited[node]) {
      for (mii it = graph[node].begin(); it != graph[node].end(); it++) {
	int to_node = it->first;
	int to_dist = it->second;

	int old_distance = distance[to_node];
	int new_distance = dist + to_dist;
	if ((new_distance < old_distance) or (old_distance == -1)) {
	  distance[to_node] = new_distance;
	  to_visit.push(make_pair(to_node,new_distance));
	}
      }
      }

      visited[node] = true;
    }

    // Printing output
    for (int i=1; i<n+1; i++)
      if (i != s)
	cout << distance[i] << ' ';
    cout << endl;
  }
}
