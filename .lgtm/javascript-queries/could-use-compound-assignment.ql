/**
 * @name add-assignment-query
 * @description A compound assignment could be used instead of duplicating variable in expression
 * @kind problem
 * @problem.severity warning
 * @id could-use-compound-assignment
 */

import javascript

predicate ineffecientVariableMutation (BinaryExpr expr, string msg) {
	exists ( Expr var, int operandInt |
		var = expr.getLeftOperand()
		and operandInt = expr.getRightOperand().(NumberLiteral).getIntValue()
		and
		(
			operandInt = 1 and
			   ( expr instanceof AddExpr and msg = var + "++ could be used instead."
			    or expr instanceof SubExpr and msg = var + "-- could be used instead."
			    or expr instanceof MulExpr and msg = "This assignment has no effect."
			    or expr instanceof DivExpr and msg = "This assignment has no effect." )
			 or  
			 operandInt != 1 and
			 exists (string operator |
			 	msg = var + operator + expr.getRightOperand() + " could be used instead."
			 	and 
			   ( expr instanceof AddExpr and operator = " += "
			    or expr instanceof SubExpr and operator = " -= "
			    or expr instanceof MulExpr and operator = " *= "
			    or expr instanceof DivExpr and operator = " /= " )
			)
		)
	)
}

from BinaryExpr binaryExpr, AssignExpr assignExpr, string msg
  	where assignExpr.getLhs().(VarAccess).getVariable() = binaryExpr.getLeftOperand().(VarAccess).getVariable()
  	and ineffecientVariableMutation(binaryExpr, msg)
  	and assignExpr.getRhs() = binaryExpr
select assignExpr, msg
