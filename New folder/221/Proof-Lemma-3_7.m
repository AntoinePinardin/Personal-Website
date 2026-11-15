// lemm:quadrics-five-orbits
k<z> := CyclotomicField(60);
i := z^15;
phi := 1+z^12+z^-12;
a := (1+2*z^20)/3;
A := Matrix(k,2,2,[1,0,0,-1]);
g := Matrix(k,2,2,[-phi+i,phi-1,phi-1,phi+i])/2;

//we check that B belongs to <A,g> to confirm that the proof of lemm:quadrics-five-orbits fits to the proof of lemm:swap-five-orbits.
B := Matrix(k,2,2,[i,-i,1,1]);
GL(2,k)!((1-i)/2*B) in MatrixGroup<2,k | A,g>; // true (normalised lift of B).

M := SymmetricPower(A*g,4);

// The two fixed points from lemm:swap-five-orbits; a^2 = -1/3.
points := [Vector(k,[1,0,e*a,0,1])*Transpose(M)^j
    : e in [-1,1], j in [0..4]];

P<x0,x1,x2,x3,x4> := ProjectiveSpace(k,4);
R := CoordinateRing(P);
q := 3*x2^2-4*x1*x3+x0*x4;
mon := [m : m in MonomialsOfDegree(R,2) | m ne x2^2];
T := Matrix(k,[[Evaluate(m,Eltseq(p)) : p in points] : m in mon]);
quadrics := [&+[v[j]*mon[j] : j in [1..#mon]] : v in Basis(Nullspace(T))];
Z := Scheme(P,Saturation(ideal<R | [q] cat quadrics>));

quadrics; // A basis modulo the equation of Q.
#points, #quadrics, Dimension(Z), Degree(Z), IsReduced(Z);
// Expected: 10 4 0 10 true.
