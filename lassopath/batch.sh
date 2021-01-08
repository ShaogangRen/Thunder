#bin_files=("Xy_sim_N_10000_p_2000000.bin" "myfinance.bin")
bin_file=$1
lambdas=$2
lambda_file_name=${lambdas//,/_}
if (( ${#lambda_file_name} > 58 )); then
    lambda_file_name="${lambda_file_name:0:50}......"
fi
lambda="1"
#epsilons=("1e-5" "1e-12")
epsilons=("1e-8")
r1_ratios=("0.001")
m1s=("300")
m2s=("10")
fix_adds=("0")
add_bs=("0.5")
#fix_adds=("1")
#add_bs=("50")
rank_a_multiple=2

for eps in "${epsilons[@]}"; do
	for r1v in "${r1_ratios[@]}"; do
		for m1v in "${m1s[@]}"; do
			for m2v in "${m2s[@]}"; do
			for fix_addv in "${fix_adds[@]}"; do
			for add_bv in "${add_bs[@]}"; do
				cp main.cc.template tmpmain.cc
				cp lassolver.h.template tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_epsilon/${eps}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_lambda/${lambda}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_m1/${m1v}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_m2/${m2v}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_r1_ratio/${r1v}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_fix_add/${fix_addv}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_add_b/${add_bv}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_rank_a_multiple/${rank_a_multiple}/g" tmplassolver.h
				sed -i -e "s/PLACE_HOLDER_binname/${bin_file}/g" tmpmain.cc
				sed -i -e "s/PLACE_HOLDER_lambdas/${lambdas}/g" tmpmain.cc
				g++ tmpmain.cc -o tmplassolver -g -std=c++11 -O3 -I.
				nohup time ./tmplassolver > ${bin_file}_${lambda_file_name}_${eps}_${r1v}_${m1v}_${m2v}_${fix_addv}_${add_bv}_${rank_a_multiple}.out &
			done
			done
			done
		done
  	done
done

wait

