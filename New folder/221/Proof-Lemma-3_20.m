// Lemma lemm:Gis22or222: the base locus of the pencil <f1,f3> on Q.
R<x0,x1,x2,x3,x4,lambda,mu> := PolynomialRing(Rationals(),7);
f0 := x3^2-x2*x4;
f1 := x2*x3-x1*x4;
f2 := x2^2-x0*x4;
f3 := x1*x2-x0*x3;
f4 := x1^2-x0*x2;
f5 := 3*x2^2-4*x1*x3+x0*x4;
IC4 := ideal<R | f0,f1,f2,f3,f4,f5>;

// Case 4: the two roots satisfy mu*a^2-4*a+mu = 0.
q := mu*(f0+f4)+lambda*f2+f5;
Igamma := ideal<R | q,x1,x3>; // Ideal of gamma = Q intersect {x1=x3=0}.
Iell := ideal<R | f1,f2,f3,mu*(x0+x4)-4*x2,mu*(x1^2+x3^2)-4*x1*x3>; // Ideal of the union of the two lines ell_a.
ideal<R | q,f1,f3> eq (Igamma meet IC4 meet Iell); // Check the claimed base locus; expected output: true.

// Case 5: the two roots are 0 and 4.
q := f0+lambda*f2+f5;
Igamma := ideal<R | q,x1,x3>; // Ideal of gamma.
I0 := ideal<R | x2,x3,x4>; // Ideal of ell_0.
I4 := ideal<R | x2-4*x0,x3-4*x1,x4-16*x0>; // Ideal of ell_4.
ideal<R | q,f1,f3> eq (Igamma meet IC4 meet I0 meet I4); // Check the claimed base locus; expected output: true.
