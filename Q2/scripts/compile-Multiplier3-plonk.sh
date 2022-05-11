#!/bin/bash

# [assignment] create your own bash script to compile Multiplier3.circom using PLONK below
cd contracts/circuits

mkdir Multiplier3_plonk

echo "Compiling Multiplier3.circom..."

# compile circuit

circom Multiplier3.circom --r1cs --wasm --sym -o Multiplier3_plonk
snarkjs r1cs info Multiplier3_plonk/Multiplier3.r1cs

# generate witness
# node "Multiplier3_plonk/generate_witness.js" Multiplier3_plonk/Multiplier3.wasm input.json Multiplier3_plonk/witness.wtns

snarkjs plonk setup Multiplier3_plonk/Multiplier3.r1cs powersOfTau28_hez_final_10.ptau Multiplier3_plonk/circuit_final.zkey
snarkjs zkey export verificationkey Multiplier3_plonk/circuit_final.zkey Multiplier3_plonk/verification_key.json

# generate proof
# snarkjs plonk prove Multiplier3_plonk/circuit_final.zkey Multiplier3_plonk/witness.wtns Multiplier3_plonk/proof.json Multiplier3_plonk/public.json

# verify proof
# snarkjs plonk verify Multiplier3_plonk/verification_key.json Multiplier3_plonk/public.json Multiplier3_plonk/proof.json

# generate solidity contract
snarkjs zkey export solidityverifier Multiplier3_plonk/circuit_final.zkey ../Multiplier3Verifier_plonk.sol


cd ../..