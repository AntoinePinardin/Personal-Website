====// Proposition prop:a4s4-rigid.
k<s> := QuadraticField(-3); // Work over Q(s), where s^2 = -3.
a := s/3; // Thus a^2 = -1/3, as for alpha in the paper.
T<u,v> := PolynomialRing(k,2); // Homogeneous coordinates parametrising C_4.
S<y0,y1,y2,y3> := PolynomialRing(k,4); // Coordinates on the target P^3 of a projection.

// Cubics double at q = [0:0:0:1].
mon := [m : m in MonomialsOfDegree(S,3) | Degree(m,4) le 1]; // These 16 monomials vanish to order at least two at q.
P<x0,x1,x2,x3,x4> := ProjectiveSpace(k,4);
Q := Scheme(P,3*x2^2-4*x1*x3+x0*x4);
forms := []; // Store the two triples of cubic forms on Q.
for e in [1,-1] do // Treat p_+ and p_-.
    c := [u^3*v,u*v^3,v^4-u^4,u^2*v^2-e*a*u^4]; // Parametrise the projected curve C_{4,e}, image of C_4 under the projectionfrom p_e, namely rho_e = [x1:x3:x4-x0:x2-e*a*x0].
    M := Matrix(k,[ // Build the matrix of restriction of cubic forms to C_{4,e}.
        [MonomialCoefficient(Evaluate(m,c),u^(12-j)*v^j) // Extract a coefficient after substituting the parametrisation.
         : j in [0..12]] : m in mon]); // One row per cubic monomial; 13 columns for binary forms of degree 12.
    V := Nullspace(M); // The left kernel gives cubic combinations vanishing on C_{4,e}, hence V_e.
    Dimension(V); // Print dim V_e, which should be 3.
    rho := [x1,x3,x4-x0,x2-e*a*x0]; // Projection from p_e = [1:0:e*a:0:1]; the other point maps to q.
    Append(~forms,[ // Store a basis pulled back from P^3 to Q.
        &+[w[j]*Evaluate(mon[j],rho) : j in [1..#mon]] // Form the cubic with coefficient vector w and substitute rho.
        : w in Basis(V)]);
end for;

// Image in P^2 x P^2 and birationality.
P22<X1,Y1,Z1,X2,Y2,Z2> := ProductProjectiveSpace(k,[2,2]);
psi := map<Q -> P22 | forms[1] cat forms[2]>;
W := Image(psi);
DefiningPolynomials(W);
[Multidegree(P22,f) : f in DefiningPolynomials(W)];
IsNonsingular(W);
birational, inverse := IsInvertible(map<Q -> W | forms[1] cat forms[2]>); // Test birationality onto W and compute an inverse if it exists.
birational;
