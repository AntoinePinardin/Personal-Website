k<z> := CyclotomicField(60); // Contains all eigenvalues.
i := z^15; w := z^12; a := 1-w-w^-1;

R2 := Matrix(k,2,2,[1,0,0,-1]);
B := Matrix(k,2,2,[0,1,1,0]);
C := Matrix(k,2,2,[i,-i,1,1]);
D := Matrix(k,2,2,[1,-i,i,-1]);
M := Matrix(k,2,2,[w,0,0,1]);
N := Matrix(k,2,2,[1,a,1,-1]);

function Fixed(gens)
    S := [VectorSpace(BaseRing(gens[1]),5)];
    for g in gens do
        A := SymmetricPower(g,4); // Veronese: u^4,u^3*v,u^2*v^2,u*v^3,v^4.
        S := [U meet Eigenspace(Transpose(A),e[1])
              : U in S, e in Eigenvalues(A)];
        S := [U : U in S | Dimension(U) gt 0];
    end for;
    // For these groups, the nonzero common eigenspaces are lines.
    P := [U.1 : U in S];
    return [v : v in P | 3*v[3]^2-4*v[2]*v[4]+v[1]*v[5] eq 0];
end function;

// Projective coordinates; [] means no fixed points on Q.
"A4:", Fixed([R2,B,C]);   // (1,0,t,0,1), where 3*t^2+1=0.
"S4:", Fixed([R2,B,C,D]); // []
"A5:", Fixed([M,N]);     // []
