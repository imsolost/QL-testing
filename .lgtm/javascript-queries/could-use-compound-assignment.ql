/**
 * @name add-assignment-query
 * @description A compound assignment could be used instead of duplicating variable in expression
 * @kind problem
 * @problem.severity warning
 * @id could-use-compound-assignment
 */

import javascript

predicate ineffecientVariableMutation (BinaryExpr expr, string operator) {
 expr instanceof AddExpr and operator = " += "
  or expr instanceof SubExpr and operator = " -= "
  or expr instanceof MulExpr and operator = " *= "
  or expr instanceof DivExpr and operator = " /= "
}

from BinaryExpr binaryExpr, AssignExpr assignExpr, string operator
 where assignExpr.getLhs().(VarAccess).getVariable() = binaryExpr.getLeftOperand().(VarAccess).getVariable()
 and ineffecientVariableMutation(binaryExpr, operator)
 and assignExpr.getRhs() = binaryExpr
select assignExpr, assignExpr.getLhs().(VarAccess).getVariable().getName() + operator + binaryExpr.getRightOperand() + " could be used instead."
