#bin_files=("Xy_sim_N_10000_p_2000000.bin" "myfinance.bin")
bin_file=$1
lambda=$2
epsilons=("1e-5" "1e-8" "1e-11")
r1_ratios=("0.014285714285")
m1s=("300" "400")

for eps in "${epsilons[@]}"; do
	for r1v in "${r1_ratios[@]}"; do
		for m1v in "${m1s[@]}"; do
			cp main.cc.template tmpmain.cc
			cp lassolver.h.template tmplassolver.h
			sed -i -e "s/PLACE_HOLDER_epsilon/${eps}/g" tmplassolver.h
			sed -i -e "s/PLACE_HOLDER_lambda/${lambda}/g" tmplassolver.h
			sed -i -e "s/PLACE_HOLDER_m1/${m1v}/g" tmplassolver.h
			sed -i -e "s/PLACE_HOLDER_r1_ratio/${r1v}/g" tmplassolver.h
			sed -i -e "s/PLACE_HOLDER_binname/${bin_file}/g" tmpmain.cc
			g++ tmpmain.cc -o tmplassolver -g -std=c++11 -O3 -I.
			nohup time ./tmplassolver > ${bin_file}_${lambda}_${eps}_${r1v}_${m1v}.out &
		done
  	done
done

wait

