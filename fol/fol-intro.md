# Predicate Logic: Introduction

Several logicians from the mid-19th to the early 20th century developed first-order logic independently, with little awareness of each other's work.

## 1. Boole (1847): Algebraization of Logic

Many trace modern logic to George Boole (1815–1864, British) and his *Mathematical Analysis of Logic* (1847). Boole was a self-taught mathematician and logician who taught at Queen's College Cork in Ireland. He showed that logic can be expressed as an algebraic system. His name lives on in Boolean algebra, which forms the foundation of modern computer science.

Boole showed that Aristotle's syllogisms could be expressed as algebra. His system is what we now call propositional logic (sentential logic), a limited form of first-order logic. However, it had no quantifiers and no way to express relations.

### Exercise

Do not analyze the internal structure of each sentence. First define your symbol key, then symbolize each sentence in propositional logic.

- (1) Alice is human, and Boole is a mathematician.
- (2) Alice is not human, and Dobby is a wizard.
- (3) Alice is human or Dobby is a wizard.
- (4) If Alice is human, then Alice dies.
- (5) Alice dies if and only if Alice is human.
- (6) Alice is human and Boole is a mathematician, or Dobby is a wizard.
- (7) If Alice is human she dies, and if she is not human she is immortal.

## 2. Frege (1879): Function-Argument Analysis

Frege (Gottlob Frege, 1848–1925, German) built the first predicate logic system in 1879, in his *Begriffsschrift* (*Concept Notation*). He was a mathematician, logician, and philosopher who spent his career at the University of Jena, working to derive the foundations of mathematics from pure logic. Few noticed the *Begriffsschrift* at first, but Russell and Wittgenstein later rediscovered it. It is now the starting point of modern mathematical logic and analytic philosophy.

Frege's key idea was to bring the mathematical concept of a function into logic. Just as $f(x) = x^2$ takes an argument $x$ and returns a number, a predicate takes arguments and returns true or false.

Analyzing "Alice is human":

$$H(a)$$

Here $H(\cdot)$ is an *unsaturated* function with an open slot $(\cdot)$. With the slot empty, $H(\cdot)$ has no truth value. Only when a term like $a$ (Alice) fills the slot does it become the *saturated* expression $H(a)$, which is either true or false.

The same holds for binary predicates. $L(\cdot,\cdot)$ has two open slots. It has a truth value only when both are filled, as in $L(a, b)$ ("Alice likes Boole").

- $H(\cdot)$ : unsaturated, incomplete, no truth value
- $a$ : saturated, complete, referes to an object

This distinction between unsaturated and saturated expressions is the basis for today's distinction between predicates and terms.

Although Frege did not use the symbols $\forall$ and $\exists$ as we know them today, he introduced a way to express universal quantification, enabling formulas like $\forall x(H(x) \to M(x))$ in modern notation. He expressed existential statements using universal quantification and negation, not a separate existential quantifier. His system first combined relational logic with quantification.

### Exercise

Analyze each sentence using function-argument structure.

Symbol key:

- $a$: Alice, $b$: Boole, $c$: Cantor
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.
- $L(x, y)$: $x$ likes $y$.

1. Identify the predicate and arguments and represent each sentence in FOL.

- (1) Alice is mortal.
- (2) Boole is human.
- (3) Alice loves Boole.
- (4) Boole loves Alice.

2. In "Boole is human," identify the unsaturated and saturated expressions.

3. Remove the names from each expression below to leave only the predicate part.

- (1) Alice is human.
- (2) Alice loves Boole.
- (3) Cantor gives Dobby to Alice.

4. Write out the natural language sentence each FOL formula represents. 

- (1) $H(a)$
- (2) $M(b)$
- (3) $L(a, b)$
- (4) $L(b, a)$

## 3. Peirce (1885): Quantifiers and Order Distinctions

Peirce (Charles Sanders Peirce, 1839–1914, American) worked in the tradition of Boole and made important contributions, independent of Frege, in his 1885 paper "On the Algebra of Logic." He studied mathematics at Harvard and worked at the U.S. Coast Survey. He also founded semiotics and pragmatism. He spent his later years in poverty outside academia, but his influence on logic and philosophy was widely recognized after his death.

First, he introduced quantifier symbols, using $\Pi$ for the universal quantifier and $\Sigma$ for the existential, treating them as infinite Boolean products and sums. For example, $\Pi_x H(x)$ means "$H(a)$ and $H(b)$ and $H(c)$ and …"

Second, he drew the order distinction. He divided his paper into "first-intentional logic," where quantifiers range over individual objects, and "second-intentional logic," where quantifiers can range over predicates. This is the origin of today's distinction between first-order and second-order logic.

| Level | Quantified over | Name |
|-------|----------------|------|
| 0th order | nothing (propositions only) | Propositional logic |
| 1st order | individual objects | Predicate logic, FOL |
| 2nd order | properties and relations themselves | Second-order logic |

Modern notation uses $\forall$ and $\exists$ instead of Peirce's $\Pi$ and $\Sigma$.

- $\forall x H(x)$: "For all $x$, $x$ is human"
- $\exists x H(x)$: "There exists some $x$ such that $x$ is human"

For example,

$$\forall x(H(x) \to M(x))$$

means "For all $x$, if $x$ is human then $x$ is mortal" — i.e., "All humans are mortal." By contrast,

$$\exists x(H(x) \land M(x))$$

means "There exists some $x$ such that $x$ is human and mortal."

The key point: $\forall$ ranges over the domain, while $\exists$ asserts that at least one object satisfies the condition.

In second-order logic, we can quantify over properties and relations, not just individual objects. For instance:

> "Every property that Alice has, Boole also has."

This requires a property variable $P$:

$$\forall P(P(a) \to P(b))$$

"For all properties $P$, if Alice ($a$) has $P$, then Boole ($b$) has $P$."

In summary: $\forall x$, $\exists x$ talk about individual objects; $\forall P$, $\exists P$ talk about properties. First-order logic covers only the former; second-order logic covers both.

### Exercise

Answer each question about quantifiers and order distinctions.

Symbol key:

- $a$: Alice, $b$: Boole, $c$: Cantor
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

1. Read each formula in natural language.

- (1) $\forall x H(x)$
- (2) $\exists x H(x)$
- (3) $\forall x(H(x) \to M(x))$
- (4) $\exists x(H(x) \land M(x))$

2. Symbolize each sentence in FOL.

- (1) All humans are mortal.
- (2) There is at least one thing that is human.
- (3) There is at least one human who is not mortal.
- (4) Nothing is human.

3. Represent each sentence in FOL if possible; otherwise, explain why it cannot be expressed in FOL.

- (1) All humans are mortal.
- (2) Some human is a student.
- (3) Alice and Boole share every property.

## 4. Interpretations and Domains: Tarski (1930s)

While Frege and Peirce developed the syntax of logic, Alfred Tarski (1901–1983, Polish-American) gave it a rigorous definition of truth in the 1930s. Tarski studied mathematics at the University of Warsaw and later taught at UC Berkeley. He is considered one of the greatest logicians of the 20th century, known for his formal definition of truth, model theory, and work on decidability.

Tarski established the concepts of domain and interpretation.
A formula is not true or false on its own. Its truth value depends on an interpretation.
An interpretation specifies:

1. A domain $D$: the set of individual objects over which variables range
2. What object each constant refers to
3. What set of objects (extension) each predicate denotes

Example — same formula, different interpretations:

Formula: $\forall x(H(x) \to M(x))$

| Interpretation | $D$ | Extension of $H$ | Extension of $M$ | True/False |
|----------------|-----|-----------------|-----------------|------------|
| $\mathcal{M}_1$ | $\{a, b, c, d\}$ | $\{a, b, c\}$ | $\{a, b, c, d\}$ | True (all humans are mortal) |
| $\mathcal{M}_2$ | $\{a, b, c, d\}$ | $\{a, b, c\}$ | $\{a, b\}$ | False ($c$ is human but not mortal) |
| $\mathcal{M}_3$ | $\{d\}$ | $\emptyset$ | $\{d\}$ | True (vacuously — the extension of $H$ is empty) |

The formula is the same, but its truth value changes with the interpretation. This is the starting point of model theory.

### Exercise

Answer each question about interpretations and domains.

Symbol key:

- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.
- $L(x, y)$: $x$ likes $y$.

1. Determine whether $\forall x (H(x) \to M(x))$ is true or false under each interpretation.

- (1) $W = \{a, b, c\}$, ext($H$) = $\{a\}$, ext($M$) = $\{a, b\}$
- (2) $W = \{a, b, c\}$, ext($H$) = $\{a, b\}$, ext($M$) = $\{a\}$
- (3) $W = \{a, b, c\}$, ext($H$) = $\emptyset$, ext($M$) = $\{a\}$

2. Determine whether $\exists x (H(x) \land M(x))$ is true or false under each interpretation.

- (1) $W = \{a, b, c\}$, ext($H$) = $\{a, c\}$, ext($M$) = $\{b, c\}$
- (2) $W = \{a, b, c\}$, ext($H$) = $\{a\}$, ext($M$) = $\{b, c\}$

3. Determine whether $\forall x L(x, a)$ is true or false under each interpretation.

- (1) $W = \{a, b, c\}$, ext($L$) = $\{(a,a), (b,a), (c,a)\}$
- (2) $W = \{a, b, c\}$, ext($L$) = $\{(a,a), (b,a)\}$

