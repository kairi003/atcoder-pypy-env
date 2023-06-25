import sys


def check_module_version(module_name, expected_version, test_func=None):
    try:
        module = __import__(module_name)
    except ImportError:
        print(f"[FAIL] {module_name} is not installed.")
        return

    actual_version = getattr(module, '__version__', 'UNKNOWN')
    if actual_version == expected_version:
        print(f"[OK] {module_name}: {actual_version}")
    else:
        print(f"[FAIL] {module_name}: Expected {expected_version}, but found {actual_version}")
    if test_func:
        try:
            test_func(module)
            print(f"[OK] {module_name} operational test passed.")
        except Exception as e:
            print(f"[FAIL] {module_name} operational test failed: {e}")


# List of libraries with their expected versions and test functions
libraries = [
    ("numpy", "1.24.1", lambda np: np.array([1, 2, 3])),
    ("scipy", "1.10.1", lambda sp: sp.linalg.inv([[1, 2], [3, 4]])),
    ("networkx", "3.0", lambda nx: nx.Graph()),
    ("sympy", "1.11.1", lambda sy: sy.symbols('x')),
    ("sortedcontainers", "2.4.0", lambda sc: sc.SortedDict()),
    ("more_itertools", "9.0.0", lambda mi: mi.chunked([1, 2, 3], 2)),
    ("shapely", "2.0.0", lambda sh: sh.geometry.Point(0, 0)),
    ("bitarray", "2.6.2", lambda ba: ba.bitarray('1001')),
    ("pulp", "2.7.0", lambda plp: plp.LpProblem()),
    ("mpmath", "1.2.1", lambda mp: mp.sqrt(4)),
    ("pandas", "1.5.2", lambda pd: pd.DataFrame({'a': [1, 2, 3], 'b': [4, 5, 6]})),
    ("z3", "4.12.1.0", lambda z3: z3.Solver()),
    ("sklearn", "1.2.0", lambda skl: __import__('sklearn.cluster').KMeans()),
    ("typing_extensions", "4.4.0", lambda te: te.TypedDict),
    ("cppyy", "2.4.1", lambda cp: cp.include('iostream'))
]

# Check each library
for module_name, expected_version, test_func in libraries:
    check_module_version(module_name, expected_version, test_func)
