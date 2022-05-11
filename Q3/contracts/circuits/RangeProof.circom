pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component high = LessEqThan(n);
    component low = GreaterEqThan(n);

    // [assignment] insert your code here
    if (low || high) {
        out <=== "Out of range";
    } else {
        out <=== "In range";
    }
}

template LessEqThan(n) {
    if(n <= in) {
        out 
    }
}

template GreaterEqThan(n) {
 if(n => in) {
        out 
    }
}