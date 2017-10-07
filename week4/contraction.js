/* Random Contraction Algorithm */

/* Pseudocode:
 * While there are more than 2 vertices:
 *  - Pick a remaining edge (u, v) uniformly at randomly
 *  - Merge (or "contract") `u` and `v` into a single vertex
 *  - Remove self-loops
 *
 * Return cut represented by 2 final vertices - This is the minimum cut!
*/
