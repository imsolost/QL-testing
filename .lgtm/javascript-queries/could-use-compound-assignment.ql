/**
 * @name add-assignment-query
 * @description A compound assignment could be used instead of duplicating variable in expression
 * @kind problem
 * @problem.severity warning
 * @id could-use-compound-assignment
 */

import javascript

predicate ineffecientVariableMutation (BinaryExpr expr, string msg) {
	expr.getRightOperand().(NumberLiteral).getIntValue() = 1 and
	   ( expr instanceof AddExpr and msg = expr.getLeftOperand() + "++ could be used instead."
	    or expr instanceof SubExpr and msg = expr.getLeftOperand() + "-- could be used instead."
	    or expr instanceof MulExpr and msg = "This assignment has no effect."
	    or expr instanceof DivExpr and msg = "This assignment has no effect." )
	 or  
	 expr.getRightOperand().(NumberLiteral).getIntValue() != 1 and
	   ( expr instanceof AddExpr and msg = expr.getLeftOperand() + " += " + expr.getRightOperand() + " could be used instead."
	    or expr instanceof SubExpr and msg = expr.getLeftOperand() + " -= " + expr.getRightOperand() + " could be used instead."
	    or expr instanceof MulExpr and msg = expr.getLeftOperand() + " *= " + expr.getRightOperand() + " could be used instead."
	    or expr instanceof DivExpr and msg = expr.getLeftOperand() + " /= " + expr.getRightOperand() + " could be used instead." ) 
}

from BinaryExpr binaryExpr, AssignExpr assignExpr, string msg
  	where assignExpr.getLhs().(VarAccess).getVariable() = binaryExpr.getLeftOperand().(VarAccess).getVariable()
  	and ineffecientVariableMutation(binaryExpr, msg)
  	and assignExpr.getRhs() = binaryExpr
select assignExpr, msg
