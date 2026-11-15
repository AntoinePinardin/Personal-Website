// lemm:swap-five-orbits
k<z> := CyclotomicField(12);
i := z^3;
A := Matrix(k,2,2,[1,0,0,-1]);
B := Matrix(k,2,2,[0,1,1,0]);
C := Matrix(k,2,2,[i,-i,1,1]);

S := [VectorSpace(k,5)];
for g in [A,B,C] do
    T := SymmetricPower(g,4);
    S := [U meet Eigenspace(Transpose(T),e[1])
          : U in S, e in Eigenvalues(T)];
    S := [U : U in S | Dimension(U) gt 0];
end for;
normalise := func<v | v/v[1]>;
P := [normalise(U.1) : U in S];
"Fixed points P1,P2:", P; // (1,0,t,0,1), with 3*t^2+1=0.
"P1 and P2 are on Q:", [3*p[3]^2-4*p[2]*p[4]+p[1]*p[5] eq 0 : p in P];

sigma := func<p | Vector(k,[
    p[2]^2-p[1]*p[3],
    (p[2]*p[3]-p[1]*p[4])/2,
    (p[3]^2-p[1]*p[5])/4,
    (p[3]*p[4]-p[2]*p[5])/2,
    p[4]^2-p[3]*p[5]])>;
"Checks that sigma(P1)=P2:";
normalise(sigma(P[1]));