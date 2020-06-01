
prog_name=$1  # e.g. lwe_dec_many_test
n_repeats=$2  # For amortized programs, number of repeats
              # Otherwise ***SET THIS VALUE TO 1***

N_PLAYERS=${@:3}

for i in ${N_PLAYERS}; do 
  t=$(( ${i} / 2))
  ./create_players.sh ${i} ${t} sm_lwe_image; 
  for m in 10 20 30; do 
    ./run_test.sh ${i} ${t} ${prog_name} 1 false false ${m} ${n_repeats}; 
  done; 
done
