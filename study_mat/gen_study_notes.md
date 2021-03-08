## Variable Scope
- Variable scope is defined by where the variable is initiated.
- Variable scope's boundary is defined by a block: a piece of code following a `method invocation`, usually delimited by either curly braces `{}` or `do..end`.
  **(NOT ALL `do..end` pairs imply a block!)**: `for`
- Ruby blocks create a new scope for local variables; the scope created by a block following a method invocation can be considered as an inner scope; nested blocks creating nested scopes. 
- Inner scope can access variables initialized in an outer scope, but not vice versa.
- You can change variables from an inner scope and have that change affect the outer scope. 
- Variable scope in a *method defintion*: 
  - A method's scope is entirely self-contained. 
  - A method definition has no notion of "outer" or "inner" scope; you must explicitly pass in any parameters to a method definition, and the local variables a method has access to must be passed into the method as arguments when it is invoked. 

## Precedence and Evaluation order
- Method & local variable precedence: `local variable takes precedence over methods` when method name and local variable name is the same && method is called without the `()`
- Ruby goes left to right to evaluate before calling any operators: strict evaluation strategy
- strict evaluation strategy: With strict evaluation, every expression is evaluated and converted to an object before it is passed along to a method. 
- Blocks have the lowest precedent
- Binding of *method called with `{}` block argument* is tighter than *argument to a method* which is tighter than *a method call and `do..end` block agrument*

  `p array.map {|num| num + 1}`
  will output the transformed array

  BUT
  
  ```ruby
  p array.map do |num|
    num + 1
  end
  ```
  will output the enumerator because `p` takes `array.map` as argument

## Objects

- Objects are just physical space in memory. 
- Ruby variables are merely references to objects in memory.
- An object is a bit of data that has some sort of state (or value) and associated behavior. [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby)
- 
- Integers and symbols in Ruby with same values occupy the same physical space in memory(they are the same objects).
- Immutable objects: integer, float, symbol, set, booleons, range

## Variables as pointers

- Assignment in ruby assigns a reference to a variable (makes the variable point to an object in memory)
- A ruby variable or constant doesn’t contain an actual object. Instead, the variable or constant contains a pointer to an object. Assignment merely changes that pointer, which causes the variable to be bound to a different object than the one it originally held.

## Method definition and invocation

- Types of methods from: core library, standard library, external library (gem)
- Method definition has a self contained scope: `Method definitions` cannot directly access local variables initialized outside of the method definition, nor can local variables initialized outside of the method definition be reassigned from within it. 
- A `block` can access local variables initialized outside of the block and can reassign those variables. 
- Methods can access local variables that are: 
  1. passed in as arguments
  2. through interaction with blocks.
- When a literal is passed to a method, it still has an anonymous or unnamed reference, referencing it. Ruby will first convert that literal to an object, then, internally, create a reference to the object. 
- Even if method is invoked with a block, if the method is not defined to use a block in any way, the block is not executed.
- Blocks and methods can interact with each other, which (the interaction) is *set* by the method definition and then *used* at method invocation. For example `yield` keyword can control the interaction of the method with the block. 
- **Method definition** (`def..end` construction) can be seen as as **setting a certain scope** for any local variables in terms of the parameters that the method definition has: what it does with those parameters, and also how it interacts (if at all) with a block. **Method invocation** (referencing a method name) can be seen as **using the scope** set by the method definition. If the method is defined to use a block (`{}` or `do..end`), then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings. The block is part of the method invocation.
- As `arguments` are passed to `methods` :: `Return values` are passed by those methods back to the `caller`.

## Object passing

- If thinking in terms of ruby as pass by reference: pass by reference isn’t limited to mutating methods. A non-mutating method can use pass by reference as well, so pass by reference can be used with immutable objects. There may be a reference passed, but the reference isn’t a guarantee that the object can be modified.
- While we can change which object is bound to a variable inside of a method, we can’t change the binding of the original arguments (initiated outside of the method). We can change the **objects** if the objects are mutable, but the **references** themselves are immutable as far as the method is concerned.
- To *package* mutable and immutable methods/object AND assignments in "one" strategy: We can say that ruby is pass by **reference value** or pass by value of the reference.

## Truthiness
- Ruby considers everything to be truthy other than false and nil
- Use "evaluates to true" or "is truthy" when discussing an expression that evaluates to true in a boolean context
