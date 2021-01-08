#include"tmplassolver.h"
#include"parser.h"

Lassolver lassolver;

void build_callback(idx_t idx,std::pair<double,std::vector<std::pair<int,value_t>>> point){
	lassolver.y.push_back(point.first);
	for(const auto& idx_val : point.second)
		lassolver.col_x[idx_val.first].push_back(std::make_pair(idx,idx_val.second));
}

int main(){
//	lassolver.load("finance.bin");
	//lassolver.load("sim_50_200.bin");
//	lassolver.load("myfinance.bin");
//	lassolver.load("Xy_sim_N_10000_p_2000000.bin");
	lassolver.load("url.bin");
//	lassolver.init(50,200);
  //  std::unique_ptr<Parser> query_parser(new Parser("Xy_sim_N_50_p_200",build_callback));
	fprintf(stderr,"[Info] loading finished!\n");
	lassolver.precomputation();
	lassolver.spin();
	return 0;
}
