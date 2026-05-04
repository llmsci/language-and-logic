# First-Order Logic: Basic Concepts

- Magnus, P. D. et al. *forall x: Calgary*. Open Logic Project. Part 5, Ch. 23–29.

| Section | Reference |
|---|---|
| 1. The Limits of Propositional Logic | 23.1 The need to decompose sentences |
| 2. Names | 23.2 Names |
| 3. Predicates | 23.3 Predicates, 25.1 Many-placed predicates, 25.2 Mind the gap(s)!,  27.1 Expressions, 27.2 Terms and formulas |
| 4. Quantifiers | 23.4 Quantifiers |
| 5. Domain | 23.5 Domains, 24.2 Empty predicates, 24.3 Picking a domain |
| 6. Non-Referring Terms | 23.6 Non-referring terms |


## 1. The Limits of Propositional Logic

Consider this argument.

> Alice is human.  
> All humans are mortal.  
> Therefore, Alice is mortal.

This is clearly a valid argument. But when we symbolize it in propositional logic (TFL), the picture changes. With this symbol key:

- $P$: "Alice is human"
- $Q$: "All humans are mortal"
- $R$: "Alice is mortal"

the argument becomes $P,\ Q \;\therefore\; R$. A truth table check tells us this is invalid. What went wrong?

The problem is not the symbolization. This is the best we can do in propositional logic. The problem lies in propositional logic itself. "All humans are mortal" says two things at once: being human and being mortal. Propositional logic cannot symbolize this internal structure, so it loses the connection between the fact that Alice is human and the fact that Alice is mortal.

The basic unit of propositional logic is the sentence letter, which cannot be broken down. To split these "atoms," we need a new logical language: first-order logic (FOL). In FOL, the same argument is symbolized as follows.

$$H(a), \quad \forall x\;(H(x) \to M(x)) \;\therefore\; M(a)$$

Here $a$ is Alice, $H(x)$ means "$x$ is human," and $M(x)$ means "$x$ is mortal." The three sentences are connected through the shared predicates $H$ and $M$, so we can derive $M(a)$ from $H(a)$ and $\forall x\;(H(x) \to M(x))$.

We have not covered this notation yet, so let's think about it using sets. Let $H$ be the set of humans and $M$ the set of mortals. "Alice is human" becomes $a \in H$, and "all humans are mortal" becomes $H \subseteq M$. The argument then becomes:

$$a \in H, \quad H \subseteq M \;\therefore\; a \in M$$

If $a$ is a member of $H$ and $H$ is a subset of $M$, then $a$ is also a member of $M$. This follows immediately from set theory. The power of predicate logic lies in capturing this internal structure with symbols.

### Exercise

The following arguments seem intuitively valid. Symbolize each in propositional logic and determine whether it is valid. If it is invalid, explain why propositional logic cannot capture its validity. Then represent each argument using sets.

- (1) Boole is a mathematician. All mathematicians are human. Therefore, Boole is human.
- (2) Alice likes Boole. Therefore, someone likes Boole.
- (3) No mathematician is a cat. Boole is a mathematician. Therefore, Boole is not a cat.

---

## 2. Names

A singular term is a word or phrase that refers to exactly one object. 'Human' is not a singular term — it applies to many objects. 'Alice', by contrast, is a singular term that refers to a specific individual.

A proper name is the most important kind of singular term. A proper name points to an object without describing it. From the name 'Boole' alone, we learn nothing about the object it names.

In FOL, names are written in lowercase, and a symbol key specifies what each name refers to.

| Symbol | Referent |
|--------|---------|
| $a$ | Alice |
| $b$ | Boole |
| $c$ | Cantor |
| $d$ | Dobby |

In FOL, each name must refer to exactly one object. However, two different names may refer to the same object. Also, some objects in the domain may have no name — we assign names only to objects we want to single out.

### Exercise

1. Identify all singular terms in the following expressions.

- (1) Alice
- (2) human
- (3) the author of *Begriffsschrift*
- (4) mortal
- (5) Boole's mother
- (6) cat

2. Identify the proper names in each sentence and write a FOL symbol key.

- (1) Alice loves Boole.
- (2) Cantor admires Frege, and Frege admires Boole.

3. Determine whether each statement is true or false.

- (1) Two different names can refer to the same object.
- (2) One name can refer to two objects.
- (3) Every element of the domain must have a name.

---

## 3. Predicates

### 3-1. One-Place Predicates

The simplest predicates express properties of individual objects. A predicate must combine with a singular term to form a sentence. Conversely, removing a singular term from a sentence leaves the predicate.

Example: removing 'Alice' from "Alice is mortal" gives

$$\_\_\_ \text{ is mortal}$$

This is the one-place predicate $M(\;\cdot\;)$.

In FOL, predicates are written in uppercase. Combining a name with a predicate gives an atomic formula.

| English sentence | FOL |
|------------------|-----|
| Alice is human. | $H(a)$ |
| Boole is mortal. | $M(b)$ |
| Alice is human and mortal. | $H(a) \land M(a)$ |
| Alice is human, and so is Boole. | $H(a) \land H(b)$ |
| If Alice is human, then Alice is mortal. | $H(a) \to M(a)$ |

FOL retains all the connectives of propositional logic ($\neg, \land, \lor, \to, \leftrightarrow$).

### 3-2. Terms and Predicates

A term corresponds to a particular individual — a proper name. Alice and Boole are terms: each refers to exactly one object. Terms are written in lowercase in FOL.

A predicate corresponds to a property or attribute. "Is human" and "is mortal" apply to objects and yield a truth value. Predicates are written in uppercase in FOL.

| Natural language | FOL role |
|------------------|----------|
| Alice, Boole (proper names) | term — lowercase $a, b$ |
| human, mortal (properties) | predicate — uppercase $H, M$ |

### 3-3. Many-Place Predicates

The predicates above express properties of a single object. The real expressive power of FOL comes from many-place predicates, which express relations between multiple objects. This insight is owed mainly to Frege (1879), and also to Peirce.

#### Two-place predicates

Examples of English predicates that express relations between two objects:

- \_\_\_ loves \_\_\_
- \_\_\_ knows \_\_\_

Removing 'Alice' from "Alice loves Boole and Cantor" gives

$$\_\_\_ \text{ loves Boole and Cantor}$$

Removing 'Boole' as well gives the two-place predicate $L(\;\cdot\;,\;\cdot\;)$. Removing all three singular terms gives a three-place predicate. There is no upper limit on the number of places a predicate can have.

#### Order matters — track the places

When dealing with predicates of two or more places, the order of places is critical.

If we define $L(x, y)$ as "$x$ loves $y$":

| English sentence | FOL |
|------------------|-----|
| Alice loves Boole. | $L(a, b)$ |
| Boole loves Alice. | $L(b, a)$ |
| Alice loves herself. | $L(a, a)$ |
| Alice loves Boole, but not vice versa. | $L(a, b) \land \neg L(b, a)$ |
| Boole is loved by Alice. | $L(a, b)$ |

$L(a, b)$ and $L(b, a)$ are different sentences, since love may not be reciprocated. The passive sentence "Boole is loved by Alice" has the same truth conditions as the active "Alice loves Boole," so we symbolize it as $L(a, b)$.

#### Three-place predicates

If we define $G(x, y, z)$ as "$x$ gives $y$ to $z$":

| English sentence | FOL |
|------------------|-----|
| Alice gives Dobby to Boole. | $G(a, d, b)$ |
| Boole gives Dobby to Alice. | $G(b, d, a)$ |

$G(a, d, b)$ and $G(b, d, a)$ describe completely different situations. Reading the place order incorrectly changes the meaning entirely.

Key principle: when working with predicates of two or more places, always pay attention to the order of places.

### 3-4. Atomic Formulas and Connectives

Filling a predicate's places with terms gives an atomic formula.

$$H(a), \quad M(b), \quad L(a, b), \quad K(b, c), \quad G(a, b, d)$$

We combine atomic formulas to build complex formulas.

| Symbol | Name | Example |
|--------|------|---------|
| $\neg \varphi$ | Negation | $\neg H(d)$ — Dobby is not human. |
| $\varphi \land \psi$ | Conjunction | $H(a) \land M(a)$ — Alice is human and mortal. |
| $\varphi \lor \psi$ | Disjunction | $H(a) \lor H(d)$ — Alice or Dobby is human. |
| $\varphi \to \psi$ | Conditional | $H(a) \to M(a)$ — If Alice is human, Alice is mortal. |
| $\varphi \leftrightarrow \psi$ | Biconditional | $H(a) \leftrightarrow M(a)$ — Alice is human iff mortal. |

### Exercise

Symbol key:

- $a$: Alice, $b$: Boole, $c$: Cantor, $d$: Dobby
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.
- $L(x, y)$: $x$ likes $y$.
- $G(x, y, z)$: $x$ gives $y$ to $z$.

1. Symbolize each sentence in FOL.

- (1) Cantor is human.
- (2) Dobby is not mortal.
- (3) Alice likes Cantor.
- (4) Cantor likes Alice, but Alice does not like Cantor.
- (5) Boole gives Dobby to Alice.
- (6) Alice likes herself.

2. Write out the natural language sentence each formula represents: $L(b, c)$, $L(c, b)$, $L(b, b)$.

3. Explain the difference in meaning between $G(a, d, c)$ and $G(c, d, a)$.

4. Remove all singular terms from each expression to extract the predicate. State the arity of each predicate.

- (1) Alice is human.
- (2) Alice likes Boole.
- (3) Cantor gives Dobby to Boole.
- (4) Boole is between Alice and Cantor.

---

## 4. Quantifiers

### 4-1. Universal Quantifier — $\forall$

Suppose we want to symbolize "All humans are mortal." We could list the names in our symbol key. If we have only $a, b, c$:

$$M(a) \land M(b) \land M(c)$$

But this says "these three are mortal," not "all humans are mortal." To include objects without names, we need the universal quantifier $\forall$.

$\forall x\; \varphi(x)$ means "for every $x$ in the domain, $\varphi(x)$ holds."

The variable $x$ is a placeholder. Any choice of variable is logically equivalent.

$$\forall x\; H(x) \;\equiv\; \forall y\; H(y) \;\equiv\; \forall z\; H(z)$$

### 4-2. Existential Quantifier — $\exists$

"Some human exists" uses the existential quantifier $\exists$.

$\exists x\; \varphi(x)$ means "there exists some $x$ in the domain such that $\varphi(x)$ holds."

| English sentence | FOL |
|------------------|-----|
| All humans are mortal. | $\forall x\; (H(x) \to M(x))$ |
| Someone is human. | $\exists x\; H(x)$ |
| No one is human. | $\neg \exists x\; H(x)$ or $\forall x\; \neg H(x)$ |
| Not all humans are mortal. | $\neg \forall x\; (H(x) \to M(x))$ or $\exists x\; (H(x) \land \neg M(x))$ |
| Some human is not mortal. | $\exists x\; (H(x) \land \neg M(x))$ |
| No human is mortal. | $\forall x\; (H(x) \to \neg M(x))$ or $\neg \exists x\; (H(x) \land M(x))$ |

"No one is human" can be symbolized in two ways. This is De Morgan's law for quantifiers.

### 4-3. De Morgan's Laws

$$\neg \forall x\; \varphi(x) \;\equiv\; \exists x\; \neg\varphi(x) \qquad \neg \exists x\; \varphi(x) \;\equiv\; \forall x\; \neg\varphi(x)$$

| Original formula | Equivalent | Reading |
|------------------|------------|---------|
| $\neg \forall x\; H(x)$ | $\exists x\; \neg H(x)$ | Not everything is human = something is not human |
| $\neg \exists x\; H(x)$ | $\forall x\; \neg H(x)$ | There are no humans = everything is non-human |
| $\neg \forall x\; (H(x) \to M(x))$ | $\exists x\; (H(x) \land \neg M(x))$ | Not all humans are mortal = some human is not mortal |

### 4-4. Quantifiers and Sets

The set notation from earlier maps directly onto FOL quantifiers.

| FOL | Set notation | Reading |
|-----|--------------|---------|
| $\forall x\; (H(x) \to M(x))$ | $H \subseteq M$ | All humans are mortal |
| $\exists x\; H(x)$ | $H \neq \emptyset$ | Some human exists |
| $\exists x\; (H(x) \land M(x))$ | $H \cap M \neq \emptyset$ | Something is both human and mortal |
| $\neg \exists x\; (H(x) \land \neg M(x))$ | $H \subseteq M$ | Nothing is both human and non-mortal |

### Exercise

Symbol key:

- $a$: Alice, $b$: Boole
- $H(x)$: $x$ is human.
- $M(x)$: $x$ is mortal.
- $S(x)$: $x$ is a student.

1. Symbolize each sentence in FOL.

- (1) All students are human.
- (2) Some student is not human.
- (3) Everything is mortal.
- (4) No human is mortal.
- (5) Some student is not mortal.

2. Apply De Morgan's law to produce an equivalent formula. Push the negation inside the quantifier.

- (1) $\neg \forall x\, S(x)$
- (2) $\neg \exists x\, (H(x) \land \neg M(x))$
- (3) $\neg \forall x\, (S(x) \to H(x))$

3. Translate each FOL formula into set notation. Use the sets $H$, $M$, $S$ as the extensions of the predicates $H$, $M$, $S$.

- (1) $\forall x\, (S(x) \to H(x))$
- (2) $\exists x\, S(x)$
- (3) $\exists x\, (H(x) \land M(x))$
- (4) $\neg \exists x\, (S(x) \land \neg H(x))$

---

## 5. Domain

### 5-1. What Is a Domain?

When we symbolize $\forall x\; H(x)$ as "Everyone is human," who is included in "everyone"? If the domain contains only $\{a, b, c\}$, then Dobby ($d$) is not included.

To remove this ambiguity, we must specify a domain explicitly. The domain is the set of objects we are talking about. Quantifiers range over the domain.

Rules:

- The domain must contain at least one element.
- Each name must refer to exactly one element of the domain.
- Elements of the domain may or may not have names.

$\forall x\; \varphi(x)$ means "for all things in the domain," not "for all things whatsoever." Missing this point can lead to results that differ from our intuitions.

For example, if the domain is $\{d\}$ (Dobby alone) and $M(x)$ means "$x$ is mortal," then $\forall x\; M(x)$ is equivalent to $M(d)$. This sounds like "everything is mortal," but it really just means "everything in the domain — that is, Dobby — is mortal." It says nothing about objects outside the domain.

### 5-2. Choosing a Domain

Suppose we want to symbolize "All humans are mortal."

$$\forall x\; (H(x) \to M(x))$$

This symbolization works correctly only if the domain includes all humans. If the domain is just $\{a, b, c\}$, we cannot use the formula alongside sentences about objects outside the domain, such as Dobby.

When the domain includes objects other than humans, such as $\{a, b, c, d\}$, "everyone" must be spelled out as "every human."

| Domain | Symbolization | Meaning |
|--------|---------------|---------|
| $\{a, b, c\}$ (humans only) | $\forall x\; M(x)$ | All humans are mortal |
| $\{a, b, c, d\}$ (humans + Dobby) | $\forall x\; (H(x) \to M(x))$ | All humans are mortal |

### 5-3. Empty Predicates and Vacuous Truth

A predicate is empty when it applies to no object in the domain.

If the domain is $\{d\}$ (Dobby alone), then $H$ is an empty predicate, since Dobby is not human. The following sentence is then vacuously true.

$$\forall x\; (H(x) \to M(x))$$

"Every human is mortal" — since no human is in the domain, the claim cannot be refuted.

Similarly, "every human knows Dobby ($\forall x\;(H(x) \to K(x, d))$)" is vacuously true when the domain is just $\{d\}$.

Rule: when $F$ is an empty predicate, every sentence of the form $\forall x\; (F(x) \to \ldots)$ is vacuously true.

### Exercise

1. Let $D = \{a, b, c\}$ with ext($H$) = $\{a\}$ and ext($M$) = $\{a, b, c\}$. Determine the truth value of each formula.

- (1) $\forall x\, M(x)$
- (2) $\forall x\, H(x)$
- (3) $\forall x\, (H(x) \to M(x))$
- (4) $\exists x\, (H(x) \land \neg M(x))$

2. Compare how $\forall x\, (H(x) \to M(x))$ is evaluated under each interpretation.

- (1) $D_1 = \{d\}$, ext($H$) = $\emptyset$, ext($M$) = $\emptyset$
- (2) $D_2 = \{a, d\}$, ext($H$) = $\{a\}$, ext($M$) = $\emptyset$

3. With domain $\{d\}$ (Dobby only), identify which sentences are vacuously true. Assume $H(x)$: $x$ is human, $M(x)$: $x$ is mortal, $K(x, y)$: $x$ knows $y$. Dobby is not human but is mortal.

- (1) $\forall x\, (H(x) \to M(x))$
- (2) $\forall x\, M(x)$
- (3) $\forall x\, (H(x) \to K(x, d))$
- (4) $\exists x\, H(x)$

---

## 6. Non-Referring Terms

In FOL, each name must refer to exactly one element of the domain. This requirement connects to a classical philosophical problem.

Medieval philosophers used the chimera — a mythical creature that does not exist — as a test case. Suppose we set up this symbol key:

| Symbol | Referent |
|--------|---------|
| $k$ | chimera |
| $P(x)$ | $x$ is powerful |

1. Chimera is powerful. ($P(k)$)
2. Chimera is not powerful. ($\neg P(k)$)

If the chimera does not exist, is (1) false? If so, (2) must also be false for the same reason. But $P(k)$ and $\neg P(k)$ cannot both be false. That would violate the truth condition of negation.

The solution: every name in FOL must refer to something in the domain, but the domain can include anything we like. To symbolize arguments about mythical creatures, we include them in the domain. In a Harry Potter world, if Dobby ($d$) is in the domain, then $H(d)$ is false but $M(d)$ may be true — Dobby exists and can die.

### Exercise

1. Suppose the domain is $D = \{$Alice, Boole$\}$. Determine whether each symbol key is allowed in FOL. If it is not allowed, explain why.

- (1) $a$: Alice, $b$: Boole
- (2) $a$: Alice, $p$: Pegasus (Pegasus is not in the domain)
- (3) $a$: Alice, $a'$: Alice (two different names for the same object)
- (4) $h$: human (a general property rather than a specific object)

2. Explain the problem that arises if we take both "Pegasus has wings" and "Pegasus does not have wings" to be false.

3. Explain how to set up the domain to avoid this problem. With that domain and $W(x)$ meaning "$x$ has wings," symbolize both sentences.

