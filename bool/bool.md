# Boolean Algebra

## 1. Boolean Operation

### 1-1. Boolean Values

In Python, Boolean algebra is based on the `bool` data type, which has exactly two values: `True` and `False`. These values represent binary logic.

```python
False   # False
True    # True
```

### 1-2. Boolean Operators

Python has three logical operators: `not`, `and`, and `or`. These operators are used to evaluate Boolean expressions.

| Operator | Notation       | Description                              |
| -------- | -------------- | ---------------------------------------- |
| `not`    | $\neg p$       | Negation — inverts the truth value       |
| `and`    | $p \wedge q$   | Conjunction — True only if both are True |
| `or`     | $p \vee q$     | Disjunction — True if at least one is True |

#### Negation

The negation $\neg p$ inverts the truth value of $p$: it is true when $p$ is false, and false when $p$ is true.

| $p$   | $\neg p$ |
| ----- | -------- |
| True  | False    |
| False | True     |

In Python, negation is expressed with `not`:

```python
not True    # False
not False   # True
```

Applying negation twice returns the original value:

$$\neg \neg p \equiv \neg (\neg p) \equiv p$$

```python
not not True    # True
not (not True)  # True
```

#### Conjunction

The conjunction $p \wedge q$ is true if and only if both $p$ and $q$ are true.

| $p$   | $q$   | $p \wedge q$ |
| ----- | ----- | ------------ |
| True  | True  | True         |
| True  | False | False        |
| False | True  | False        |
| False | False | False        |

In Python, conjunction is expressed with `and`:

```python
True  and True    # True
True  and False   # False
False and True    # False
False and False   # False
```

#### Disjunction

The disjunction $p \vee q$ is true if at least one of $p$ or $q$ is true.

| $p$   | $q$   | $p \vee q$ |
| ----- | ----- | ---------- |
| True  | True  | True       |
| True  | False | True       |
| False | True  | True       |
| False | False | False      |

In Python, disjunction is expressed with `or`:

```python
True  or True    # True
True  or False   # True
False or True    # True
False or False   # False
```

### 1-3. Operator Precedence and Parentheses

When multiple logical operators appear in a single expression, the order in which they are evaluated matters. Python follows a fixed precedence (priority) order:

| Precedence | Operator | Notation     |
| ---------- | -------- | ------------ |
| 1 (highest) | `not`   | $\neg$       |
| 2          | `and`    | $\wedge$     |
| 3 (lowest) | `or`     | $\vee$       |

This means `not` binds tightest, then `and`, then `or`. For example:

```python
not True or False     # False
# evaluated as: (not True) or False
```

```python
True or False and False   # True
# evaluated as: True or (False and False)
```

Use parentheses to override the default precedence. The two expressions below look similar but have different truth values:

$$\neg (p \vee q) \quad \text{vs.} \quad \neg p \vee q$$

With $p = \text{True}$, $q = \text{True}$:

```python
not (True or True)   # False  -- negation applies to (True or True)
not True or True     # True   -- (not True) or True == False or True
```

Another case — `or` versus `and` evaluated in different orders:

```python
True or False and False     # True   -- True or (False and False)
(True or False) and False   # False
```

Even when parentheses do not change the result, adding them often improves readability:

```python
# Relies on precedence
not True or False and True

# Same meaning, but easier to read
(not True) or (False and True)
```

### 1-4. Variables

You can assign Boolean values to variables and use them in expressions.

```python
p = True
q = False

p          # True
not p      # False
p and q    # False
p or q     # True
```

Using descriptive names makes Boolean expressions read like natural sentences:

```python
is_raining   = True
has_umbrella = False

is_raining and (not has_umbrella)   # True  -- you will get wet
```

A more complex expression with three variables:

$$(p \vee q) \wedge \neg r$$

```python
p = False
q = True
r = True
(p or q) and (not r)   # False
```

#### Exercise

Let:

- $p$: There is a fire.
- $q$: The smoke detector goes off.
- $r$: People leave the building.

Suppose there is no fire, the smoke detector goes off, and people leave the building. Then $p$ is false, $q$ is true, and $r$ is true.

```python
p = False   # There is a fire.
q = True    # The smoke detector goes off.
r = True    # People leave the building.
```

Or descriptive variable names:

```python
fire = False
alarm = True
people_leave = True
```

Translate each formula below into Python code and evaluate it.

(1) $\neg p$

```python
# (1) There is no fire.
```

(2) $p \wedge q$

```python
# (2) There is a fire and the smoke detector goes off.
```

(3) $p \vee q$

```python
# (3) There is a fire or the smoke detector goes off.
```

(4) $\neg p \vee q$

```python
# (4) There is no fire, or the smoke detector goes off.
```

(5) $\neg (p \vee q)$

```python
# (5) It is not the case that there is a fire or the smoke detector goes off.
```

(6) $(p \wedge q) \vee r$

```python
# (6) There is a fire and the smoke detector goes off, or people leave the building.
```

(7) $p \wedge (q \vee r)$

```python
# (7) There is a fire, and either the smoke detector goes off or people leave the building.
```

(8) $\neg p \vee (q \wedge r)$

```python
# (8) There is no fire, or the smoke detector goes off and people leave the building.
```

(9) $(p \vee q) \wedge \neg r$

```python
# (9) There is a fire or the smoke detector goes off, and people do not leave the building.
```

(10) $\neg (p \wedge q) \vee \neg r$

```python
# (10) It is not the case that there is a fire and the smoke detector goes off, or people do not leave the building.
```

---

## 2. Truth Table Generator
### Installation and import
You can use `truth-table-generator` to create a truth table. First, install the package.

```python
!pip install truth-table-generator
```

And import the package.

```python
import ttg
```

### Variables

A Boolean variable takes one of two values: `True` or `False`. With $k$ variables, there are $2^k$ possible assignments of truth values. For example, three variables $p$, $q$, $r$ yield $2^3 = 8$ possible assignments:

|  $p$  |  $q$  |  $r$  |
| :---: | :---: | :---: |
| True  | True  | True  |
| True  | True  | False |
| True  | False | True  |
| True  | False | False |
| False | True  | True  |
| False | True  | False |
| False | False | True  |
| False | False | False |

`ttg.Truths` enumerates these assignments automatically. Pass a list of variable names, and it produces one column per variable:

```python
print(ttg.Truths(['p', 'q', 'r']))
```

If you prefer `True` and `False` instead of `1` and `0`, set `ints=False`:

```python
print(ttg.Truths(['p', 'q', 'r'], ints=False))
```

### Propositions

From each assignment of truth values, we can compute the value of any compound proposition built from the variables. The table below shows the three elementary operators:

|  $p$  |  $q$  | $\neg p$ | $p \wedge q$ | $p \vee q$ |
| :---: | :---: | :------: | :----------: | :--------: |
| True  | True  |  False   |     True     |    True    |
| True  | False |  False   |    False     |    True    |
| False | True  |   True   |    False     |    True    |
| False | False |   True   |    False     |   False    |

To generate such a table with `ttg.Truths`, pass a second list containing the propositional expressions as strings:

```python
print(ttg.Truths(['p', 'q'], ['not p', 'p and q', 'p or q'], ints=False))
```

### Operators

It supports the following operators:

| Operator              | Notation                  | `ttg` symbols     |
| --------------------- | ------------------------- | ----------------- |
| Negation              | $\neg p$                  | `not`, `-`, `~`   |
| Disjunction           | $p \vee q$                | `or`              |
| Conjunction           | $p \wedge q$              | `and`             |
| Conditional           | $p \to q$                 | `=>`, `implies`   |
| Biconditional         | $p \leftrightarrow q$     | `=`               |
| NOR                   | $p \downarrow q$          | `nor`             |
| Exclusive disjunction | $p \oplus q$              | `xor`, `!=`       |
| NAND                  | $p \uparrow q$            | `nand`            |

Each operator has a characteristic truth table that fully defines its meaning:

|  $p$  |  $q$  | $p \to q$ | $p \leftrightarrow q$ | $p \vee q$ | $p \downarrow q$ | $p \oplus q$ | $p \wedge q$ | $p \uparrow q$ |
| :---: | :---: | :-------: | :-------------------: | :--------: | :--------------: | :----------: | :----------: | :------------: |
| True  | True  |   True    |         True          |    True    |      False       |    False     |     True     |     False      |
| True  | False |   False   |         False         |    True    |      False       |     True     |    False     |      True      |
| False | True  |   True    |         False         |    True    |      False       |     True     |    False     |      True      |
| False | False |   True    |         True          |   False    |       True       |    False     |    False     |      True      |

To reproduce this table with `ttg.Truths`:

```python
print(ttg.Truths(['p', 'q'],
    ['p => q', 'p = q', 'p or q', 'p nor q', 'p xor q', 'p and q', 'p nand q'],
    ints=False))
```

#### Exercise

Use `ttg.Truths` to generate the truth table for each of the following compound formulas. Use only `and`, `or`, `not`, `=>`, and `=`.

(1) $(p \wedge q) \to r$

```python
# (1) print(ttg.Truths(['p', 'q', 'r'], [...], ints=False))
```

(2) $p \to (q \to r)$

```python
# (2)
```

(3) $(p \to q) \wedge (q \to p)$

```python
# (3)
```

(4) $(p \vee q) \wedge \neg (p \wedge q)$

```python
# (4)
```

(5) $\neg (p \wedge q) \leftrightarrow (\neg p \vee \neg q)$

```python
# (5)
```

(6) $(p \to q) \leftrightarrow (\neg p \vee q)$

```python
# (6)
```


---

## 3. Semantic concepts

### 3-1. Tautology and Contradiction

#### Tautology

A proposition is a tautology iff every row in its truth table is True. $p \vee \neg p$ is an example:

| $p$   | $p \vee \neg p$ |
| :---: | :-------------: |
| True  |      True       |
| False |      True       |

Verify this using `ttg`:

```python
print(ttg.Truths(['p'], ['p or (not p)']))
```

#### Contradiction

A proposition is a contradiction iff every row in its truth table is False. $p \wedge \neg p$ is an example:

| $p$   | $p \wedge \neg p$ |
| :---: | :---------------: |
| True  |       False       |
| False |       False       |

Verify this using `ttg`:

```python
print(ttg.Truths(['p'], ['p and (not p)']))
```

### 3-2. Equivalence
#### De Morgan's Laws

The negation of a conjunction is equivalent to the disjunction of the negations:

$$\neg (p \wedge q) \equiv \neg p \vee \neg q$$

We can verify this by checking that the two columns are identical in the truth table:

|  $p$  |  $q$  | $\neg (p \wedge q)$ | $\neg p \vee \neg q$ |
| :---: | :---: | :-----------------: | :------------------: |
| True  | True  |        False        |        False         |
| True  | False |        True         |         True         |
| False | True  |        True         |         True         |
| False | False |        True         |         True         |

Verify this using `ttg`:

```python
print(ttg.Truths(['p', 'q'],
    ['not (p and q)', '(not p) or (not q)'],
    ints=False))
```


The negation of a disjunction is equivalent to the conjunction of the negations:

$$\neg (p \vee q) \equiv \neg p \wedge \neg q$$

We can verify this by checking that the two columns are identical in the truth table:

|  $p$  |  $q$  | $\neg (p \vee q)$ | $\neg p \wedge \neg q$ |
| :---: | :---: | :---------------: | :--------------------: |
| True  | True  |       False       |         False          |
| True  | False |       False       |         False          |
| False | True  |       False       |         False          |
| False | False |       True        |          True          |

Verify this using `ttg`:

```python
print(ttg.Truths(['p', 'q'],
    ['not (p or q)', '(not p) and (not q)'],
    ints=False))
```

#### Conditional and Its Equivalence

The conditional $p \to q$ is logically equivalent to $\neg p \vee q$:

$$p \to q \equiv \neg p \vee q$$

We can verify this by checking that the two columns are identical in the truth table:

|  $p$  |  $q$  | $p \to q$ | $\neg p \vee q$ |
| :---: | :---: | :-------: | :-------------: |
| True  | True  |   True    |      True       |
| True  | False |   False   |      False      |
| False | True  |   True    |      True       |
| False | False |   True    |      True       |

Verify this using `ttg`:

```python
print(ttg.Truths(['p', 'q'],
    ['p => q', '(not p) or q'],
    ints=False))
```


### 3-3. Entailment and validity

#### Modus ponens

Modus ponens is an elementary example of a valid argument. Given a conditional $p \to q$ and its antecedent $p$, we can conclude the consequent $q$.

$$p \to q,\quad p \;\therefore\; q$$

An argument is valid if whenever all premises are true, the conclusion is also true. There are two ways to verify this with a truth table.

One way is to show that $((p \to q) \wedge p) \to q$ is a tautology — every row is True:

|  $p$  |  $q$  | $((p \to q) \wedge p) \to q$ |
| :---: | :---: | :--------------------------: |
| True  | True  |             True             |
| True  | False |             True             |
| False | True  |             True             |
| False | False |             True             |

Verify this using `ttg`:

```python
print(ttg.Truths(['p', 'q'], ['((p => q) and p) => q'], ints=False))
```

Another way is to add a column for each premise and a column for the conclusion, then check that whenever all premise columns are True, the conclusion column is also True:

|  $p$  |  $q$  | $p \to q$ | $p$ | $q$ |
| :---: | :---: | :-------: | :-: | :-: |
| True  | True  |   True    | True  | True  |
| True  | False |   False   | True  | False |
| False | True  |   True    | False | True  |
| False | False |   True    | False | False |

The only row where both premises ($p \to q$ and $p$) are True is the first row, and in that row the conclusion $q$ is also True.

Verify this using `ttg`:

```python
print(ttg.Truths(['p', 'q'], ['(p => q)', 'p', 'q'], ints=False))
```

#### Exercise
(from *forall x: Calgary*, Chapter 12, Exercise C.)

Use truth tables to determine whether each argument is valid or invalid.

(1) $A \to A \;\therefore\; A$
```python
# (1)
```

(2) $A \to (A \wedge \neg A) \;\therefore\; \neg A$
```python
# (2)
```

(3) $A \vee (B \to A) \;\therefore\; \neg A \to \neg B$
```python
# (3)
```

(4) $A \vee B,\; B \vee C,\; \neg A \;\therefore\; B \wedge C$
```python
# (4)
```

(5) $(B \wedge A) \to C,\; (C \wedge A) \to B \;\therefore\; (C \wedge B) \to A$
```python
# (5)
```





---

## Glossary

| Term | Wikipedia |
| ---- | --------- |
| Boolean algebra | [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra) |
| Logical conjunction | [AND](https://en.wikipedia.org/wiki/Logical_conjunction) |
| Logical disjunction | [OR](https://en.wikipedia.org/wiki/Logical_disjunction) |
| Negation | [NOT](https://en.wikipedia.org/wiki/Negation) |
| Conditional | [Material conditional](https://en.wikipedia.org/wiki/Material_conditional) |
| Biconditional | [Logical biconditional](https://en.wikipedia.org/wiki/Logical_biconditional) |
| Tautology | [Tautology](https://en.wikipedia.org/wiki/Tautology_(logic)) |
| Contradiction | [Contradiction](https://en.wikipedia.org/wiki/Contradiction) |
| De Morgan's laws | [De Morgan's laws](https://en.wikipedia.org/wiki/De_Morgan%27s_laws) |
| Modus ponens | [Modus ponens](https://en.wikipedia.org/wiki/Modus_ponens) |
| Truth table | [Truth table](https://en.wikipedia.org/wiki/Truth_table) |
