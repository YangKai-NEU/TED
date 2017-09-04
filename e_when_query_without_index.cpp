#include "e_query.hpp"
#include "e_timer.hpp"
#include <iostream>
using namespace std;

int main(int argv, char *args[]) {

  int i, j;

  NODE_PATH = args[1];
  EDGE_PATH = args[2];
  GEO_PATH = args[3];

  gGraph = new Graphic();
  gGraph->InitGraphic();

  FileReader *tPDDPReader = new FileReader(args[4], true);
  FileReader *tPartionReader = new FileReader(args[5], true);

  Query *tQuery = new Query(tPDDPReader, tPartionReader);

  ENTRY_NUM = atoi(args[13]);

  LoadCompressedgTrajectoriesQ(args[6], args[7], args[8], args[9]);

  FileReader *tQueryReader = new FileReader(args[12], true);
  TIME_FILE = args[10];
  DIVID_NUM = atoi(args[11]);

  vector<int> querySetedge;
  vector<double> querySetDistance;

  int tSetSize = tQueryReader->GetNextInt();
  for (i = 0; i < tSetSize; i++) {
    int a = tQueryReader->GetNextInt();
    double b = tQueryReader->GetNextDouble();
    querySetedge.push_back(a);
    querySetDistance.push_back(b);
  }

  delete tQueryReader;

  gMeetQueryNumber = (int)gCTrajectoriesQ->size() * tSetSize;

  Timer *tTimer = new Timer();
  tTimer->ResetStart();

  for (j = 0; j < tSetSize; j++) {
    // cout << "Query " << j << ":" << endl;
    tQuery->WhenWithoutIndex(querySetedge[j], querySetDistance[j]);
  }

  tTimer->ResetFinish();
  double tMeetResult =
      ((double)gMeetQueryNumber / ((int)gCTrajectoriesQ->size() * tSetSize)) *
      tSetSize;
  tTimer->Write2File(tMeetResult > 0 ? tMeetResult : 1);

  delete gGraph;
  delete tQuery;
  delete tTimer;

  for (i = 0; i < (int)gCTrajectoriesQ->size(); i++) {
    delete gCTrajectoriesQ->at(i);
  }
  delete gCTrajectoriesQ;

  return 0;
}
