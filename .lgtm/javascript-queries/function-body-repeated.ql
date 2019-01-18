/**
 * @name NewQuery
 * @description Insert description here...
 * @kind problem
 * @problem.severity warning
 */

import javascript

/* 
Make an array of all the function expressions in the code. Check if any are repeated. 
 */
 
/* from FunctionExpr fe
select fe.getBody(), "function expression" */

/* from ArrowFunctionExpr afe
select afe.getBody(), "arrow function expression" 

predicate body(FunctionExpr fe) {
     exists(ArrowFunctionExpr afe | afe.getBody())
}
*/

 
from ArrowFunctionExpr afe

select afe.getBody(), "Arrow function"