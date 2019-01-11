/**
 * @name add-assignment-query
 * @description An add assignment could be used instead of duplicating variable in add expression
 * @kind problem
 * @problem.severity warning
 * @id could-use-add-assignment
 */

import javascript

from AddExpr addExpr, AssignExpr assignExpr
where assignExpr.getLhs().(VarAccess).getVariable() = addExpr.getLeftOperand().(VarAccess).getVariable()
and assignExpr.getRhs() = addExpr
select assignExpr, assignExpr.getLhs().(VarAccess).getVariable().getName() + " += " + addExpr.getRightOperand() + " could be used instead."
