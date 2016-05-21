package org.codeontology.extraction.statement;

import com.hp.hpl.jena.rdf.model.RDFNode;
import org.codeontology.Ontology;
import org.codeontology.extraction.expression.ExpressionEntity;
import org.codeontology.extraction.support.ConditionHolderEntity;
import org.codeontology.extraction.support.ConditionTagger;
import spoon.reflect.code.CtDo;

public class DoWhileEntity extends LoopEntity<CtDo> implements ConditionHolderEntity<CtDo> {

    public DoWhileEntity(CtDo doStatement) {
        super(doStatement);
    }

    @Override
    protected RDFNode getType() {
        return Ontology.DO_WHILE_ENTITY;
    }

    @Override
    public void extract() {
        super.extract();
        tagCondition();
    }

    @Override
    public ExpressionEntity getCondition() {
        ExpressionEntity condition = getFactory().wrap(getElement().getLoopingExpression());
        condition.setParent(this);
        return condition;
    }

    @Override
    public void tagCondition() {
        new ConditionTagger(this).tagCondition();
    }

}