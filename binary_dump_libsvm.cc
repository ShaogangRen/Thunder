#include"lassolver.h"
#include"parser.h"

Lassolver lassolver;

void build_callback(idx_t idx,std::pair<double,std::vector<std::pair<int,value_t>>> point){
	lassolver.y.push_back(point.first);
	for(const auto& idx_val : point.second){
		lassolver.col_x[idx_val.first].push_back(std::make_pair(idx,idx_val.second));
//		printf("adding %d %d %f\n",idx,idx_val.first,idx_val.second);
	}
}

int main(){
	lassolver.init(16087,1668738);
	//lassolver.init(16087,4272228);
//	lassolver.init(50,200);
    std::unique_ptr<Parser> query_parser(new Parser("myfinance.libsvm",build_callback));
    //std::unique_ptr<Parser> query_parser(new Parser("finance_t",build_callback));
    //std::unique_ptr<Parser> query_parser(new Parser("log1p.E2006.train",build_callback));
    //std::unique_ptr<Parser> query_parser(new Parser("Xy_sim_N_50_p_200",build_callback));
	fprintf(stderr,"[Info] loading finished!\n");
	//lassolver.dump("sim_50_200.bin");
	lassolver.dump("myfinance.bin");
	fprintf(stderr,"[Info] dump finished!\n");
	return 0;
}
