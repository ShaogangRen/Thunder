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
	lassolver.load("kdda.bin");
//	lassolver.init(50,200);
  //  std::unique_ptr<Parser> query_parser(new Parser("Xy_sim_N_50_p_200",build_callback));
	fprintf(stderr,"[Info] loading finished!\n");
	lassolver.precomputation();
	std::vector<double> lambdas = {0.8710,0.7586,0.6607,0.5754,0.5012,0.4365,0.3802,0.3311,0.2884,0.2512,0.2188,0.1905,0.1660,0.1445,0.1259,0.1096,0.0955,0.0832,0.0724,0.0631,0.0550,0.0479,0.0417,0.0363,0.0316,0.0275,0.0240,0.0209,0.0182,0.0158,0.0138,0.0120,0.0105,0.0091,0.0079,0.0069,0.0060,0.0052,0.0046,0.0040,0.0035,0.0030,0.0026,0.0023,0.0020,0.0017,0.0015,0.0013,0.0011,0.0010};
	for(auto l : lambdas){
		lassolver.update_lambda(l);
		lassolver.spin();
	}
	printf("++++++++++++++++++++\n");
	printf("++++++++++++++++++++\n");
	return 0;
}
