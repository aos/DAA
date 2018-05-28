def wis(file_path):
    # Cached running total weight of independent sets
    i_set = []
    i_set.append(0)
    # Independent set reconstruction
    v = 0
    # Running array
    arr = []
    arr.append('empty')
    # Reconstructed arr
    reconstructed = []

    # Get total weight of independent set
    with open(file_path) as f:
        for index, line in enumerate(f):
            weight = int(line)
            if index == 0:
                v = weight + 1
                continue
            if index == 1:
                i_set.append(weight)
                arr.append(weight)
                continue
            # Weight of vertex
            # Add vertex to a running array
            arr.append(weight)
            # Finds the max between case #1 and case #2
            # Case 1: IS not including final vertex (v_n)
            # Case 2: IS including final vertex (v_n) and (v_n - 2)
            i_set.append(max(i_set[index - 1], i_set[index - 2] + weight))

    # Reconstruct independent set vertices
    v -= 1
    while v >= 1:
        # reconstructed[v] is weight of vertix
        if i_set[v - 1] >= (i_set[v - 2] + arr[v]):
            v -= 1
        else:
            reconstructed.append(v)
            v -= 2

    return v, reconstructed
