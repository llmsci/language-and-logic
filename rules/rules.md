# Basic Rules for TFL

## Natural Deduction

Natural deduction is a style of formal proof in which you reason from premises to a conclusion using a small set of inference rules. For example, the following is a basic inference rule:

$$
P \to Q, P \vdash Q
$$

An argument consists of sentences, and a sentence is built from atomic sentences and logical connectives. Each rule of natural deduction is therefore a way of transforming sentences, that is, of adding or removing a connective.

### Connectives

The following table compares the symbols used for logical operators across different contexts. The "ASCII" column lists the symbols we will use in markdown code blocks. The "Bitwise" and "Logic" columns show the corresponding operators in programming languages such as C, C++, and Java. The "Carnap" column lists the symbols used on Carnap.io, and the "CLPB" column lists those used by the CLP(B) library in Prolog.

| Operator      | Symbol            | ASCII     | Bitwise | Logic  | carnap | clpb  |
| ------------- | ----------------- | --------- | ------- | ------ | ------ | ----- |
| Negation      | $\lnot$           | `~`       | `~`     | `!`    | `-`    | `~`   |
| Conjunction   | $\land$           | `&`, `*`  | `&`     | `&&`   | `/\`   | `*`   |
| Disjunction   | $\lor$            | `\|`, `+` | `\|`    | `\|\|` | `\/`   | `+`   |
| Conditional   | $\to$             | `>`       |         |        | `->`   | `=<`  |
| Biconditional | $\leftrightarrow$ | `=`       |         |        | `<->`  | `=:=` |

### Fitch Notation

[Fitch notation](https://en.wikipedia.org/wiki/Fitch_notation) is a way of writing natural-deduction proofs for propositional and first-order logic, developed by Frederic B. Fitch. Each step is written on its own numbered line, and indentation with vertical scope bars shows which assumptions are still in effect. Fitch-style proofs are widely used in introductory logic textbooks.

To display the Fitch system using code blocks in markdown, you can utilize the code block syntax, which is enclosed by triple backticks (```).

The Fitch-style proofs in this document use the following conventions:

- Line numbers (e.g., `m`, `n`, `i`, `j`, `1`, `2`) appear on the left.
- `|` is the vertical bar that separates the line number from the formula.
- `|---` is a horizontal divider: above it are premises or assumptions, below it are derived lines.
- Nested `| |` marks a subproof, which is opened by an assumption.
- `:PR` indicates a premise; 
- `:AS` indicates an assumption that opens a subproof.
- `:Rule, refs` is the justification, giving the rule applied and the line numbers it cites. A reference is either a single line `m` or a subproof range `i-j`.

Example:

```
1 | P > Q                       :PR
2 | Q > R                       :PR
  |-------
3 | | P                         :AS
  | |---
4 | | Q                         :>E, 1, 3
5 | | R                         :>E, 2, 4
6 | P > R                       :>I, 3-5
```

Lines 1 and 2 are premises. Line 3 opens a subproof with the assumption $P$. Lines 4 and 5 are derived inside the subproof by Conditional Elimination. Line 6 closes the subproof and derives $P \to R$ by Conditional Introduction, citing the subproof range 3-5.

## Basic Rules

Each connective has two rules. The introduction rule tells you how to add the connective to a sentence. The elimination rule tells you how to take it away.

| Connective                         | Introduction       | Elimination        |
| ---------------------------------- | ------------------ | ------------------ |
| Conjunction ($\land$)              | $\land$I           | $\land$E           |
| Disjunction ($\lor$)               | $\lor$I            | $\lor$E            |
| Conditional ($\to$)                | $\to$I             | $\to$E             |
| Biconditional ($\leftrightarrow$)  | $\leftrightarrow$I | $\leftrightarrow$E |
| Negation ($\neg$)                  | $\neg$I            | $\neg$E            |

- IP (Indirect Proof)

### Conjunction Introduction

```
m | A
n | B
  | A & B             :&I, m, n
```

You can verify each basic rule with a complete truth table. We will use the `truth-table-generator` package in Python on Colab. First, install the package:

```
!pip install truth-table-generator
```

Then import it:

```python
import ttg
```

Check that there is no row in which $A$ and $B$ are both true while $A \land B$ is false.

```python
print(ttg.Truths(['A', 'B'], ['A and B'], ints=False))
```

```
+-------+-------+-----------+
|   A   |   B   |  A and B  |
|-------+-------+-----------|
| True  | True  |   True    |
| True  | False |   False   |
| False | True  |   False   |
| False | False |   False   |
+-------+-------+-----------+
```

### Conjunction Elimination

```
m | A & B
  | A                 :&E, m
```

Truth table:

### Conditional Elimination

```
m | A > B
n | A
  | B                 :>E, m, n
```

Truth table:

### Conditional Introduction

```
i | | A               :AS
  | |---
j | | B
  | A > B             :>I, i-j
```

### Biconditional Introduction

```
i | | A
  | |---
j | | B
  | 
k | | B
  | |---
l | | A
  | 
  | A = B            :=I, i-j, k-l
```

### Biconditional Elimination

```
m | A = B
n | A
  | B               :=E, m, n
```

Truth table:

### Disjunction Introduction

```
m | A
  | A + B          :+I, m
```

Truth table:

### Disjunction Elimination

```
m | A + B             :PR
i | | A               :AS
  | |---
j | | C
  | 
k | | B               :AS
  | |---
l | | C
  | C                 :+E, m, i-j, k-l
```

### Negation Elimination

```
m | ~A
n | A
  | contradiction    :~E, m, n
```

### Negation Introduction

```
i | | A              :AS
  | |---
j | | contradiction
  | ~A               :~I, i-j
```

### Indirect Proof

```
i | | ~A              :AS
  | |---
j | | contradiction
  | A                 :IP, i-j
```

## Exercises

Give a proof for each of the following arguments. The main task of this exercise is not the proof itself. What matters more is providing a natural-language example that corresponds to each argument and explaining the reasoning in natural language. In addition, construct complete truth tables and check whether there is any case in which all of the premises are true and the conclusion is false. If you find it helpful, consider using Venn diagrams to support your explanation.

### Example

$$
(P \land Q) \lor (P \land R) \therefore P
$$

```
1 | (P & Q) + (P & R)          :PR
  |------------------
2 | | P & Q                    :AS
  | |-------
3 | | P                        :&E, 2
  | |
4 | | P & R                    :AS
  | |-------
5 | | P                        :&E, 4
6 | P                          :|E, 1, 2-3, 4-5
```


1. $A \land (B \land C) \therefore (A \land B) \land C$ 

2. $A \to (B \to C) \therefore (A \land B) \to C$ 

3. $(C \land D) \lor E \therefore E \lor D$

4. $\lnot F \to G,F \to H \therefore G \lor H$

5. $(Z \land K) \lor (K \land M),K \to D \therefore D$
