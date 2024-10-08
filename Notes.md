## Lecture 1
1. `: View` -> behave like a `View`
    You need to satisfy these claims in order to behave like something. 
    E.g., if you want to behave like a `View`, you need to be able to return some other `View` (hence the `some View`)
    SwiftUI is all about the `View`
    
2. Computed Property
    Value of the variable is computed everytime. 
    Can be seen all over the place.
    `var body: some View {}` is a computed property. But a simple string is not, its a stored property.

3. `@ViewBuilder`
    Turns a "list" of views into "tuple" view.
    Conditionals, list, local variables only!
    
## Lecture 2
1. Swift is strongly typed
    But it also has type inference. Letting swift do the type inference is a good idea.

2. Views are immutable ('self' is immutable)
    Generally the backend of the app will do this.
    `@State` is a temporary fix for this issue. Generally used in Demos.

3. `LazyVGrid` takes as less space of possible.
    Hence when the emojis were invisible, the view got squashed.
