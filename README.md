# Thunder

Thunder code with the paper [Thunder: a Fast Coordinate Selection Solver for Sparse Learning, NeurIPS2020].
The code has been tested on Ubuntu 16.04.6 LTS.


## Files and Usage

### binary_dump_libsvm
binary_dump_libsvm is a program that converts the libsvm dataset
into a binary file for fast loading of lassolver.
Usage: ./binary_dump_libsvm <n> <p> <input_libsvm_data> <output_binary_data>
Example: ./binary_dump_libsvm 16087 1668738 myfinance.libsvm myfinance.bin

Processed bin files are avarilable at
[1]https://drive.google.com/drive/folders/1SohTz5Fa8DFNH7LgGFUJ4PxnWaqNdVLX?usp=sharing

Please read run_all.sh and batch.sh for more details.

### batch.sh
In batch.sh you can specify a collection of epsilon (stopping duality gap), r1 (R1/R2 ratio) and m1(K1).
The script enumerates all those combinations for the experiment.
batch.sh takes two inputs as parameters---bin_file and lambda.
The bin_file is generated by binary_dump_libsvm. 

### run_all.sh
run_all.sh simplely specifies the two inputs mentioned above for batch.sh.

Example cmd:
 nohup sh  runall_finance.sh > nohup_finance &


## Run the code

The scripts can compile the files and then run the code.

### Run the code
1. Download a bin file from [1] and put it in the code directory.

2. run  sh  ./runall_*.sh.  Example: sh ./runall_finance.sh

In scripts/, there are some example .sh files for the data sets.


### Compile the files
The comond lines to compile the code.

lassolver : lassolver.h main.cc parser.h

```
g++ main.cc -o lassolver -g -std=c++11 -O3 -I.
```

binary_dump_libsvm : lassolver.h binary_dump_libsvm.cc parser.h

```
g++ binary_dump_libsvm.cc -o binary_dump_libsvm -g -std=c++11 -O3 -I.
```



## Citation
If you use the code in your research, please cite our  paper:
```
@article{ren2020thunder,
  title={Thunder: a Fast Coordinate Selection Solver for Sparse Learning},
  author={Ren, Shaogang and Zhao, Weijie and Li, Ping},
  journal={Advances in Neural Information Processing Systems (NeurIPS)},
  volume={33},
  year={2020}
}
```

