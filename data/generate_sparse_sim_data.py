import numpy as np
from scipy.io import savemat
from scipy.sparse import csr_matrix
from scipy.sparse import rand
from sklearn.datasets import load_svmlight_file, dump_svmlight_file

#a = np.array([[1, 2, 3, 4], [5, 6, 7, 8]], dtype='double')
#b = csr_matrix(a)
#b = rand(1000000, 10000, density=0.001, dtype='float', format='csr')
P = 2000000
N = 10000
X_density = 0.001
beta_density = 0.3
entry_N = int(P*X_density*N)
row = np.random.randint(low = 0, high= N, size=entry_N)
col = np.random.randint(low = 0, high= P, size=entry_N)
data = np.random.uniform(low= -1.0, high= 1.0, size=entry_N)
X = csr_matrix((data,(row,col)), shape=(N,P))

beta_N = int(P*beta_density)
bdata = np.random.uniform(low= -1.0, high= 1.0, size=beta_N)
idx = np.random.permutation(P)[0:beta_N]
beta_v = csr_matrix((bdata, (idx, np.zeros((beta_N,), dtype=int))), shape=(P,1), dtype=float)
#beta_v[idx] = bdata
#print(beta_v.shape)
#print(X.shape)
y = X*beta_v
noise = np.random.normal(0, 1, y.shape)
y = y + noise
print(X.shape)
yt = np.squeeze(np.asarray(y))
#print(y)
#print(entry_N)
file_name = 'Xy_sim_N_{}_p_{}'.format(N,P)
dump_svmlight_file(X, yt, file_name)
mat_file_name = 'Xy_sim_N_{}_p_{}.mat'.format(N,P)
savemat(mat_file_name, {'X': X, 'y':y})

