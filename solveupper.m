## Copyright#### A block with the copyright notice## -*- texinfo -*-#### A block with the help textfunction r = solveupper (m, b)  n = rows (m);  assert (all(m(n, 1 : n -1) == 0), "not an upper triangular matrix")  r(n, 1) = b(n) /  m(n, n);  for c = (n - 1) : -1 : 1    assert (m(c, c) != 0, "singular matrix")    assert (all(m(c, 1 : (c - 1)) == 0), "not an upper triangular matrix")    r(c, 1) = (b(c) - dot (m(c, (c+1) : n), r((c+1) : n))) / m(c, c);  endforendfunction%!assert (solveupper ([2], [4]) == [2])%!assert (solveupper ([1, 0, 0; 0, 1, 0; 0, 0, 1], [3; 1; 5]) == [3; 1; 5])%!assert (solveupper ([1, 4, 2; 0, 1, 3; 0, 0, 1], [-3; 11; 5]) == [3; -4; 5])%!assert (solveupper ([2, 0; 0, 1], [4; 1]) == [2; 1])