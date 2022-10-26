How to Lua
===

This is a very brief introduction to the Lua programming language and assumes you've never
programmed before.

If you're already familiar with Lua or you're feeling brave and just want to start making stuff,
feel free to skip this guide.  If you know a different programming language or you want a refresher
on Lua, check out these guides:

1. [Learn Lua in 15 Minutes](http://tylerneylon.com/a/learn-lua/)
1. [Lua for Programmers](http://nova-fusion.com/2012/08/27/lua-for-programmers-part-1/)

You can use [repl.it](https://repl.it/languages/lua) to run Lua code on the web if you don't want to
set up Lua on your computer.

Printing
---

You can use `print` to print out numbers and text.  It doesn't print things out using your printer,
but will "print" text to the output so you can see it.  Try it:

    print('hey')
    print(5)

Math
---

Lua is really good at math.  You can use it like a basic calculator.  Try some of these examples:

    print(5 + 5)
    print(3 - 2)
    print(2 * (7 - 8))
    print(1 + .5)
    print((2 ^ 5) - 16 / 3)

Variables
---

Variables are like little mailboxes that can hold things inside of them.  Each one has a name.  To
make a variable we type its name, type an equals sign, and then type the value, like this:

    a = 3
    b = 1

So now the variable named `a` holds the value 3 inside of it.  If we print out a variable, we see
the value it contains, not its name:

    print(a)
    print(b)
    print(a + b)

The names of variable are _case sensitive_, so `a` and `A` are two different variables.  We change
the value of a variable at any time, and even use other variables when we do it:

    a = 3
    b = 1
    c = a + b
    b = 7
    print(a, b, c)

You can tell `print` to print multiple things using commas.  Pretty neato.  Variables can also hold
strings, which is a fancy way of saying text.  To make a string, you just put some text inside
quotes:

    a = 'woah'
    print(a)

Lua also lets you assign multiple variables at once:

    a, b = 1, 2
    print(a, b)

Functions
---

Functions let you wrap up a chunk of code and give it a name.  This can be useful to keep things
organized in a big file, or it can be useful to save typing if you want to do the same thing many
times.  Let's write a function that adds one to a variable and then prints it:

    function addOne()
      a = a + 1
      print(a)
    end

We typed `function` then typed the name of the function and put parentheses after it.  Then we
wrote the code we want to run whenenver the function is run.  Finally, we typed `end` to tell Lua
that we're done writing the function.

If you run this code, you'll notice that nothing gets printed out!  This is because writing a
function does not actually run it.  To run a function you type the name of the function followed
by parentheses:

    function addOne()
      a = a + 1
      print(a)
    end

    a = 0
    addOne()
    addOne()
    addOne()
    addOne()
    addOne()

There we go.  Now our function is getting "called" and the code inside it is getting run!

We can also give a function inputs.  To do that we just add variable names into the function
definition:

    function sayHello(name)
      print('hello', name)
    end

    sayHello('adele')
    sayHello('yall')

Because we put the `name` variable in parentheses, the code in the `sayHello` function can now use
the `name` variable.  Note that `name` is a temporary variable that can only be used inside the
function.

A function can also output values using `return`.  This can be used to put the result of a function
in a variable.  Here's an example:

    function double(number)
      return number * 2
    end

    print(double(10))

We don't have to put the result into a variable though, we can directly print it out.  In this
example, the output of `double` is used as the input of `print`.

Comments
---

In Lua, you can write a _comment_ by using `--`.  If you put a comment, then the rest of the line
will be ignored.  It's a useful tool that lets you write explanations for your code so you can
remember what's going on:

    -- This variable contains my favorite color
    color = 'purple'

Nil
---

The value `nil` is a value that represents the absence of a value.  If a variable doesn't have any
value assigned to it, it has the value of `nil`.  Similarly, if a function doesn't return any
values, then it returns `nil`.

If, For, While
---

Lastly, here are a few features of Lua called "control flow".  Normally lines of code are run in
order, one after another, but control flow lets you change that.  For example, then `if` statement
let you conditinally run lines of code:

    if 5 > 3 then
      print('ok cool five is greater than three')
    else
      print('wait what')
    end

The `while` statement lets you run a segment of code over and over again until some condition is
met:

    i = 0
    while i < 5 do
      i = i + 1
      print(i)
    end

Finally, the `for` statement is similar to `while`, but is a little more concise if you want to run
a piece of code a certain number of times:

    for i = 1, 5 do
      print(i)
    end

It automatically does the `i = i + 1` and the `i < 5` part from the previous example.

More Resources
---

This is really just the tip of the iceberg, but hopefully it helps you understand some of the other
code in these guides.  For additional reference content, have a look at these:

1. [Lua Wiki tutorial series](http://lua-users.org/wiki/LuaTutorial)
1. The [Programming in Lua](http://lua.org/pil) book (first edition)
1. [Lua Reference Manual](http://www.lua.org/manual/5.1/)

Otherwise, continue on to the <a data-key="Callbacks">Callbacks</a> guide.
