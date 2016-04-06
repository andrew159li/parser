package org.codeontology.extractors;

import org.codeontology.Ontology;
import spoon.reflect.declaration.CtNamedElement;
import spoon.reflect.declaration.CtTypedElement;
import spoon.reflect.reference.CtReference;
import spoon.reflect.reference.CtTypeReference;

public abstract class TypedElementExtractor<E extends CtTypedElement & CtNamedElement> extends Extractor<E> {
    public TypedElementExtractor(CtReference reference) {
        super(reference);
    }

    public TypedElementExtractor(E typedElement) {
        super(typedElement);
    }

    protected void tagJavaType() {
        Extractor extractor;

        try {
            extractor = getFactory().getExtractor(getElement().getType());
        } catch (RuntimeException e) {
            extractor = getFactory().getExtractor((CtTypeReference<?>) getReference());
        }

        addStatement(Ontology.getAbstractTypeProperty(), extractor.getResource());
        if (extractor.getElement() == null) {
            extractor.extract();
        }
    }
}