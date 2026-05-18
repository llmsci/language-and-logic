# First-Order Logic: Single-Quantifier Symbolization

## Cross-Reference: forallx YYC (Part 5, Ch. 24)

| Section | Source |
|---|---|
| 1. Quantifier Patterns | 24.1 Common quantifier phrases |
| 2. The Utility of Paraphrase | 24.4 The utility of paraphrase |
| 3. Quantifiers and Scope | 24.5 Quantifiers and scope |
| 4. Ambiguous Predicates | 24.6 Ambiguous predicates |

---

## 1. Quantifier Patterns

Symbol key (used throughout this section):

- $D = \{a, b, c, d \}$ : domain
- $a$: Alice, $b$: Boole, $c$: Cantor, $d$: Dobby
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

### 1-1. "Every F is G"

Suppose we want to symbolize "All humans are mortal."

$$\forall x\; (H(x) \to M(x))$$

We must use conditional($\to$) here, not conjunction($\land$). If we write:

$$\forall x\; (H(x) \land M(x))$$

this means "everything is both human and mortal," which would require Dobby ($d$) to be human as well. That is not the intended meaning.

"Every $F$ is $G$" is symbolized as $\forall x\; (F(x) \to G(x))$.

### 1-2. "Some F is G"

"Some human is mortal" is:

$$\exists x\; (H(x) \land M(x))$$

We must use conjunction($\land$) here, not conditional($\to$). If we write:

$$\exists x\; (H(x) \to M(x))$$

this says there is some $x$ satisfying "$H(x)$ implies $M(x)$." Since $H(x) \to M(x)$ is equivalent to $\neg H(x) \lor M(x)$, it is true for any non-human object. In other words, the formula holds as long as there is something satisfying $\neg H(x)$, so $M(x)$ is completely ignored. This is a much weaker claim than intended. Only when the domain consists exclusively of humans does the formula actually require some mortal to exist.

"Some $F$ is $G$" is symbolized as $\exists x\; (F(x) \land G(x))$.

Placing a conditional ($\to$) inside the scope of an existential ($\exists$) quantifier almost always produces a claim that is too weak.

### 1-3. "No F is G"

"No human is mortal":

$$\neg \exists x\; (H(x) \land M(x))$$

This says that there is no object that is both human and mortal. The existence claim "some human is mortal" is denied.

Or equivalently:

$$\forall x\; (H(x) \to \neg M(x))$$

This says that for every $x$, if $x$ is human, then $x$ is not mortal. Every human is non-mortal.

The two forms are equivalent by De Morgan's law for quantifiers:

$$\neg\exists x\,\varphi \equiv \forall x\,\neg\varphi$$

De Morgan's law for connectives:

$$\neg(p \land q) \equiv \neg p \lor \neg q$$

and the conditional equivalence:

$$p \to q \equiv \neg p \lor q$$


"No $F$ is $G$" is symbolized as $\neg\exists x\;(F(x) \land G(x))$ or $\forall x\;(F(x) \to \neg G(x))$.

### 1-4. "Only Fs are Gs"

"Only humans are mortal" looks like $\forall x(H(x) \to M(x))$ at first glance, but the direction is reversed.

Think about when "only humans are mortal" is false. It is false when something is mortal but not human. In that situation, "all humans are mortal" can still be true (every human is still mortal), but "only humans are mortal" is false (since a mortal non-human exists). The two sentences therefore have different truth conditions and require different FOL formulas.

We can also paraphrase "only humans are mortal" as "no non-humans are mortal." That is, there does not exist something that is non-human and mortal.

- $\neg\exists x (\neg H(x) \land M(x))$
- $\forall x \neg (\neg H(x) \land M(x))$
- $\forall x (\neg\neg H(x) \lor \neg M(x))$
- $\forall x (H(x) \lor \neg M(x))$
- $\forall x (\neg M(x) \lor H(x))$
- $\forall x (M(x) \to H(x))$

"Only $F$s are $G$s" means "if $G$, then $F$."

### 1-5. Pattern Summary

| English pattern | FOL |
|-----------------|-----|
| Every $F$ is $G$. | $\forall x\;(F(x) \to G(x))$ |
| Some $F$ is $G$. | $\exists x\;(F(x) \land G(x))$ |
| No $F$ is $G$. | $\neg\exists x\;(F(x) \land G(x))$ or $\forall x\;(F(x) \to \neg G(x))$ |
| Only $F$s are $G$s. | $\forall x\;(G(x) \to F(x))$ |
| Not every $F$ is $G$. | $\neg\forall x\;(F(x) \to G(x))$ or $\exists x\;(F(x) \land \neg G(x))$ |

### Exercise

Symbol key:

- $M(x)$: $x$ is a magician.
- $C(x)$: $x$ is inside the castle.
- $D(x)$: $x$ has a dragon.
- $K(x)$: $x$ is a knight.
- $T(x)$: $x$ is inside the town.
- $S(x)$: $x$ carries a sword.

1. Symbolize each sentence in FOL.

- (1) Every magician inside the castle has a dragon.
- (2) Some knight in the town carries a sword.
- (3) Not all knights carrying a sword are inside the castle.
- (4) None of the magicians inside the castle carries a sword.
- (5) Only knights carry swords.
- (6) No magician outside the castle has a dragon.

2. Read each FOL formula in natural language.

- (1) $\forall x\,(M(x) \to D(x))$
- (2) $\exists x\,(K(x) \land \neg S(x))$
- (3) $\neg \exists x\,((M(x) \land C(x)) \land \neg D(x))$
- (4) $\forall x\,(D(x) \to (M(x) \lor K(x)))$

3. Explain the difference in meaning between the two formulas and identify which is the correct symbolization of "every magician is in the castle."

- (a) $\forall x\,(M(x) \land C(x))$
- (b) $\forall x\,(M(x) \to C(x))$

---

## 2. The Utility of Paraphrase

When an English sentence is hard to symbolize directly in FOL, first paraphrase it, then symbolize the paraphrase. Each paraphrase takes one step closer to FOL.

### 2-1. Removing Pronouns

Symbol key:

- $a$: Alice
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

Compare these two sentences.

1. If Alice is human, then she is mortal.
2. If a person is human, then she is mortal.

Both have "she is mortal" in the consequent, but they mean different things. Paraphrase removes the pronouns.

(1) → "If Alice is human, then Alice is mortal."
$$H(a) \to M(a)$$

(2) → "For any person $x$, if $x$ is human, then $x$ is mortal."
$$\forall x\; (H(x) \to M(x))$$

### 2-2. Handling "Any" and "Anyone"

"Any" and "anyone" can translate to $\forall$ or $\exists$ depending on context. Paraphrase resolves the ambiguity.

Symbol key:

- $a$: Alice
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

1. If anyone is human, then Alice is mortal.
2. If anyone is human, then they are mortal.

(1) → "If there is at least one human, then Alice is mortal." The consequent makes a fixed claim about Alice that does not refer back to the antecedent. The existential governs the antecedent:

$$\exists x\; H(x) \to M(a)$$

(2) → "For all $x$, if $x$ is human, then $x$ is mortal." The pronoun "they" in the consequent is bound to the same variable as "anyone":
$$\forall x\; (H(x) \to M(x))$$

Key point: when "any" or "anyone" appears alone as the antecedent of a conditional, it usually translates to $\exists$. When it appears as the subject of a conditional with the same pronoun bound in the consequent, it usually translates to $\forall$. When unsure, confirm with a paraphrase.

### Exercise

Symbol key:

- $k$: Kim
- $B(x)$: $x$ is a bassist.
- $R(x)$: $x$ is a rock star.
- $L(x, y)$: $x$ loves $y$.

1. Symbolize each sentence in FOL. Use paraphrase to determine what the pronoun refers to and whether "anyone" is universal or existential.

- (1) If Kim is a bassist, then she is a rock star.
- (2) If a person is a bassist, then she is a rock star.
- (3) If anyone is a bassist, then Kim is a rock star.
- (4) If anyone is a bassist, then she is a rock star.

2. Use paraphrase to explain the difference in meaning between the two sentences. Symbolize each in FOL.

- (a) Kim loves anyone.
- (b) Kim loves someone.

3. Paraphrase each sentence, then symbolize it in FOL. Pay attention to the direction of quantification for "anyone."

- (1) If anyone loves Kim, then Kim is happy.
- (2) Anyone who is a bassist is a rock star.

---

## 3. Quantifiers and Scope

### 3-1. Parentheses Determine Scope

Symbol key:

- $a$: Alice
- $b$: Boole
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

Compare these two sentences.

1. If everyone is human, then Alice is mortal.
2. Everyone is such that, if they are human, then Alice is mortal.

In (1), the main connective is conditional($\to$) and the entire antecedent is "everyone is human."

$$\forall x\; H(x) \to M(a)$$

Here $\forall x$ governs only $H(x)$. $M(a)$ is outside its scope.

In (2), $\forall x$ governs the entire conditional.

$$\forall x\; (H(x) \to M(a))$$

### 3-2. Comparing Truth Values

- Domain: $\{a, b, c, d\}$. 
- Extension of $H$: $\{a, b, c\}$. 
- $M(a)$: true.

Checking $\forall x\; H(x) \to M(a)$:

$\forall x\; H(x)$ is false, since $d$ is not human. The antecedent is false, so the conditional is true. This sentence is trivially true in most interpretations.

Checking $\forall x\; (H(x) \to M(a))$:

"For all $x$, if $x$ is human, then Alice is mortal." If $M(a)$ is true, the consequent is always true and the whole sentence is true. If $M(a)$ is false, the sentence is false whenever the domain contains a human. This sentence is contingent. 

A useful equivalence: when the quantified variable does not occur in the consequent, the scope makes a clean swap between $\forall$ and $\exists$:

$$\forall x\,(H(x) \to M(a)) \;\equiv\; \exists x\, H(x) \to M(a)$$

Both say "if there is a human, then Alice is mortal." This connects back to the "any/anyone" pattern in 2-2: "Alice is mortal, if anyone is human" is a natural English reading of either form.

### 3-3. Scope and Connectives

Just as with negation($\neg$), the scope of $\forall x$ is marked explicitly by parentheses.

| Formula | Scope of $\forall x$ | Meaning |
|---------|---------------------|---------|
| $\forall x\; H(x) \to M(a)$ | $H(x)$ | "If everything is human, then Alice is mortal" |
| $\forall x\; (H(x) \to M(a))$ | $H(x) \to M(a)$ | "For all $x$, if $x$ is human, then Alice is mortal" |



### Exercise

Symbol key:

- $a$: Alice
- $b$: Boole
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.

1. Explain the difference between the two FOL formulas and give a natural language example of each.

- (a) $(\forall x\, H(x)) \to H(a)$
- (b) $\forall x\,(H(x) \to H(a))$

2. Explain the difference between the two FOL formulas and give a natural language example of each.

- (a) $\neg H(a) \to H(b)$
- (b) $\neg(H(a) \to H(b))$

3. Let $D = \{a, b, c, d\}$, ext($H$) $= \{a, b\}$, ext($M$) $= \{a\}$. Determine the truth value of each formula.

- (1) $(\forall x\, H(x)) \to M(a)$
- (2) $\forall x\,(H(x) \to M(a))$
- (3) $(\exists x\, H(x)) \to M(a)$
- (4) $\forall x\,(H(x) \to M(x))$

4. Symbolize each sentence in FOL. Pay attention to the scope of quantifiers and negation.

- (1) If everything is mortal, then Alice is mortal.
- (2) For all $x$, if $x$ is human, then Alice is mortal.
- (3) It is false that Alice is not mortal.
- (4) Alice is not mortal, or Boole is mortal.

---

## 4. Ambiguous Predicates

Defining predicates carelessly can make an invalid argument appear valid.

### 4-1. A Predicate Defined Too Loosely

Consider this argument.

> Alice is a famous logician and a human.  
> Therefore, Alice is a famous human.

This argument is invalid. "Famous" in "famous logician" and "famous human" carries different contextual meanings.

Now suppose we set up this symbol key:

- $F(x)$: $x$ is famous.
- $L(x)$: $x$ is a logician.
- $H(x)$: $x$ is human.

The argument is symbolized as:

$$\underbrace{(F(a) \land L(a)) \land H(a)}_{\text{premise}} \;\therefore\; \underbrace{H(a) \land F(a)}_{\text{conclusion}}$$

This symbolization is valid. An invalid argument has been made to look valid. The predicate failed to capture the difference between "famous as a logician" and "famous as a human."

### 4-2. The Correct Symbolization

"Famous" requires different predicates depending on the context in which someone is famous.

- $F_1(x)$: $x$ is famous as a logician.
- $F_2(x)$: $x$ is famous as a human.

Now the argument becomes:

$$\underbrace{(F_1(a) \land L(a)) \land H(a)}_{\text{premise}} \;\therefore\; \underbrace{H(a) \land F_2(a)}_{\text{conclusion}}$$

This symbolization is invalid — correctly reflecting the invalidity of the original argument.

### 4-3. General Principle

Adjectives such as "famous," "skilled," "good," "big," and "small" shift in meaning with context.

- "Big" in "big dog" and "big problem" applies different standards.
- "Good" in "good surgeon" and "good person" applies different standards.

We do not always need to split them into separate predicates. If only one sense appears in the argument, a single predicate suffices. But when two different senses appear at once, we must separate them.

Key principle: before symbolizing an argument, check whether the same English word is used in different senses within that argument.

### Exercise

1. The following symbol key is used to symbolize sentence (1).

- $a$: Alice
- $K(x)$: $x$ is skilled.
- $S(x)$: $x$ is a surgeon.

- (1) Alice is a skilled surgeon. → $K(a) \land S(a)$

Explain the problem with this symbolization. Give two more English examples with the same type of problem.

2. Explain in natural language why the following argument is invalid. Reconstruct the symbol key to make the invalidity visible, then symbolize the argument.

> Bob is a good liar.  
> Bob is a person.  
> Therefore, Bob is a good person.

3. For each case, determine whether treating "skilled" as a single predicate $K(x)$ is acceptable or whether it must be split. Explain your answer.

- (1) Alice is a skilled surgeon. Therefore, Alice is skilled.
- (2) Alice is a skilled surgeon. Bob is a skilled painter. Therefore, Alice and Bob have a skill in common.
- (3) Every skilled surgeon is skilled. Therefore, some surgeon is skilled.

