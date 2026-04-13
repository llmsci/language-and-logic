# Boolean Algebra

> Reference: *Sets, Logic, Computation: An Open Introduction to Metalogic* (Richard Zach, Open Logic Project)

---

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

$$\neg A$$

```python
not True    # False
not False   # True
```

Double negation:

$$\neg \neg A = \neg (\neg A)$$

```python
not not True    # True
not (not True)  # True
```

#### Conjunction and Disjunction

```python
True and False   # False
True or False    # True

(True and False) or (False and (not True))   # False
```

### 1-3. Variables

You can use variables to represent Boolean values and perform operations on them.

$$( p \vee q) \wedge \neg r$$

```python
p = False
q = True
r = True
(p or q) and (not r)   # False
```

### 1-4. Boolean and Comparison Operators

Boolean values are the result of comparison operations.

```python
3 > 2         # True
3 == 3        # True
3 != 2        # True
type(3 > 2)   # <class 'bool'>
```

---

## 2. Truth Table Generator

You can use `truth-table-generator` to create a truth table. First, install the package.

```python
!pip install truth-table-generator
```

And import the package.

```python
import ttg
```

A truth table has one column for each input variable. If the input has only one list of strings, each string is considered an input variable:

```python
print(ttg.Truths(['p', 'q', 'r']))
```

```
+-----+-----+-----+
|  p  |  q  |  r  |
|-----+-----+-----|
|  1  |  1  |  1  |
|  1  |  1  |  0  |
|  1  |  0  |  1  |
|  1  |  0  |  0  |
|  0  |  1  |  1  |
|  0  |  1  |  0  |
|  0  |  0  |  1  |
|  0  |  0  |  0  |
+-----+-----+-----+
```

If you prefer `True` and `False` instead of `1` and `0`, set `ints=False`:

```python
print(ttg.Truths(['p', 'q', 'r'], ints=False))
```

A second list of strings can be passed with propositional expressions:

```python
print(ttg.Truths(['p', 'q'], ['not p', 'p and q', 'p or q'], ints=False))
```

```
+-------+-------+---------+-----------+----------+
|   p   |   q   |  not p  |  p and q  |  p or q  |
|-------+-------+---------+-----------+----------|
| True  | True  |  False  |   True    |   True   |
| True  | False |  False  |   False   |   True   |
| False | True  |  True   |   False   |   True   |
| False | False |  True   |   False   |  False   |
+-------+-------+---------+-----------+----------+
```

It supports the following operators:

| Operator | Symbols                |
| -------- | ---------------------- |
| Negation | `not`, `-`, `~`        |
| Disjunction | `or`                |
| Conjunction | `and`               |
| Conditional | `=>`, `implies`     |
| Biconditional | `=`               |
| NOR | `nor`                       |
| Exclusive disjunction | `xor`, `!=` |
| NAND | `nand`                     |

```python
print(ttg.Truths(['p', 'q'],
    ['p => q', 'p = q', 'p or q', 'p nor q', 'p xor q', 'p and q', 'p nand q'],
    ints=False))
```

```
+-------+-------+----------+---------+----------+-----------+-----------+-----------+------------+
|   p   |   q   |  p => q  |  p = q  |  p or q  |  p nor q  |  p xor q  |  p and q  |  p nand q  |
|-------+-------+----------+---------+----------+-----------+-----------+-----------+------------|
| True  | True  |   True   |  True   |   True   |   False   |   False   |   True    |   False    |
| True  | False |  False   |  False  |   True   |   False   |   True    |   False   |    True    |
| False | True  |   True   |  False  |   True   |   False   |   True    |   False   |    True    |
| False | False |   True   |  True   |  False   |   True    |   False   |   False   |    True    |
+-------+-------+----------+---------+----------+-----------+-----------+-----------+------------+
```

---

## 3. Logical Laws

### 3-1. Tautology and Contradiction

A **tautology** is a formula that is true under every possible assignment of truth values. A **contradiction** is a formula that is false under every possible assignment.

```python
# Tautology: always True
print(ttg.Truths(['p'], ['p or (not p)']))

# Contradiction: always False
print(ttg.Truths(['p'], ['p and (not p)']))
```

### 3-2. De Morgan's Laws

$$\neg (p \wedge q) \equiv \neg p \vee \neg q$$
$$\neg (p \vee q) \equiv \neg p \wedge \neg q$$

We can verify these by checking that the two columns are identical in the truth table:

```python
print(ttg.Truths(['p', 'q'],
    ['not (p and q)', '(not p) or (not q)'],
    ints=False))

print(ttg.Truths(['p', 'q'],
    ['not (p or q)', '(not p) and (not q)'],
    ints=False))
```

### 3-3. Conditional and Its Equivalence

The conditional $p \Rightarrow q$ is logically equivalent to $\neg p \vee q$:

$$p \Rightarrow q \equiv \neg p \vee q$$

```python
print(ttg.Truths(['p', 'q'],
    ['p => q', '(not p) or q'],
    ints=False))
```

### 3-4. Summary of Key Laws

| Law | Formula |
| --- | ------- |
| Identity | $p \wedge \top \equiv p$,  $p \vee \bot \equiv p$ |
| Domination | $p \vee \top \equiv \top$,  $p \wedge \bot \equiv \bot$ |
| Complement | $p \vee \neg p \equiv \top$,  $p \wedge \neg p \equiv \bot$ |
| Double negation | $\neg \neg p \equiv p$ |
| De Morgan | $\neg(p \wedge q) \equiv \neg p \vee \neg q$ |
| De Morgan | $\neg(p \vee q) \equiv \neg p \wedge \neg q$ |
| Conditional | $p \Rightarrow q \equiv \neg p \vee q$ |

---

## 4. Inference Rules

### 4-1. Modus Ponens

$$p \Rightarrow q,\quad p \;\therefore\; q$$

If $p \Rightarrow q$ is true and $p$ is true, then $q$ must be true.

```python
print(ttg.Truths(['p', 'q'], ['p => q', 'A and B', 'A'], ints=False))
```

We can verify: whenever $p \Rightarrow q$ and $p$ are both true, $q$ is also true.

### 4-2. Simplification

$$A \Rightarrow A \;\therefore\; A$$

```python
print(ttg.Truths(['p', 'q'], ['(p and p) => p']))
```

```
+-----+-----+------------------+
|  p  |  q  |  (p and p) => p  |
|-----+-----+------------------|
|  1  |  1  |        1         |
|  1  |  0  |        1         |
|  0  |  1  |        1         |
|  0  |  0  |        1         |
+-----+-----+------------------+
```

This is a tautology: $A \rightarrow A$ is always true.

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
