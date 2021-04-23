## When it comes to write HTML code, it can get pretty tedious.

Let’s assume you want to write your items list.
Well, this piece of code :		

'wrapper>.grid__container>header>.logo+nav.nav__menu>ul>li*3^^^main+section+article+aside+footer'

turns into this:
```html
<wrapper>
        <div class="grid__container">
            <header>
                <div class="logo"></div>
                <nav class="nav__menu">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <main></main>
                    <section></section>
                    <article></article>
                    <aside></aside>
                    <footer></footer>
                </nav>
            </header>
        </div>
    </wrapper>
```





```html
<ul class="list">
    <h2 class="title">My items</h2>
	<li class="item item-1">Item 1</li>
	<li class="item item-2">Item 2</li>
	<li class="item item-3">Item 3</li>
	<li class="item item-4">Item 4</li>
</ul>
```

will turn to that :


![Image for post](https://miro.medium.com/max/303/1*GBMseKIfuYBMmaPXWuDTaA.png)

Your beautiful items list

That’s a lot of HTML code and trust me, you don’t want to waste your time writing every single character by hand.

Now, you might think :

> OK. But how do I do then ?

Luckily for us, some guys have thought about this problem and a great tool has come up. Ladies and gentlemen, let me introduce [Emmet](https://emmet.io/).

Emmet is a plugin for text editors that will allow you to be way more productive when writing HTML code. Basically, you write a snippet, you press your `tab` key and Voilà. You just gained some time for the same result.

What if I said that the example above can be written in a single line ?

> NO WAY ! Is that possible ?

Absolutely. Here’s how :

```html
ul.list>h2.title{My items}+li.item.item--${Item $}*4 
```

Give me 5 minutes and this thought will vanish instantly.

# Installing Emmet

- VSCode : already integrated, you have nothing to do.
- [Atom](https://atom.io/packages/emmet)
- [Sublime Text](https://github.com/sergeche/emmet-sublime#readme)
- [Brackets](https://github.com/emmetio/brackets-emmet)

# Emmet basics

Consider the following has your super Emmet cheatsheet !

#### . : Create tags with classes

It may be the most popular feature : the quickest way to give a `class` name to all your elements.

```html
ul.list<ul class="list"></ul>
```

Cool thing : Emmet can recognize implicit tag names. So, if you begin to write a list or a table, Emmet will **automatically** knows what elements to add.

```html
.container<div class="container"></div>table>.row>.col<table>
  <tr class="row">
    <td class="col"></td>
  </tr>
</table>
```

> What is this `>` ?

Patience my friend, patience. I’m going to talk about it in just a second !

Let’s come back to our classes. You can also give as many classes as you want :

```html
h1.heading.heading--primary<h1 class="heading heading--primary"></h1>
```
#### # : Create tags with IDs

Same as the one above instead that this time you’re creating a element with an ID.

```html
#app>.container<div id="app">
  <div class="container"></div>
</div>
```

#### {} : Insert content in a tag

```html
h2{What do I like ?}<h2>What do I like ?</h2>p.text>{Emmet is really }em{Cool}<p class="text">Emmet is really <em>Cool</em></p>
```

#### > : Create nested tags

Now this one is a real time saver. Instead of formatting manually your HTML and spending time writing all your `>` and `<` , you just use `>` to nest all your tags.

```html
ul>li<ul>
  <li></li>
</ul>.container>.card>h1.card__title<div class="container">
  <div class="card">
    <h1 class="card__title"></h1>
  </div>
</div>
```

Remember the implicit tags ? Now you should more understand the example ;)

#### + : Create sibling tags

Same as `>` , you can use `+` to create sibling tags. Powerful if you want to quickly layout a page for example.

```html
header+nav+main+aside+footer<header></header>
<nav></nav>
<main></main>
<aside></aside>
<footer></footer>
```

#### ^ : Climb up tags

That one is less used.

If you go too deep in your HTML code, you may lose some time thinking of how many times you have to climb up to create other tags.

```html
header>p>span^^footer<header>
  <p><span></span></p>
</header>
<footer></footer>
```

#### () : grouping your tags

The syntax used above can be hard to read. Instead, you can use grouping.

```html
(header>p>span)+footer<header>
  <p><span></span></p>
</header>
<footer></footer>
```

It can be super powerful if you have to repeat some complex HTML code.

```html
(.card>h1.card__title+h3.card__subtitle+button{Click here})*3<div class="card">
  <h1 class="card__title"></h1>
  <h3 class="card__subtitle"></h3>
  <button>Click here</button>
</div>
<div class="card">
  <h1 class="card__title"></h1>
  <h3 class="card__subtitle"></h3>
  <button>Click here</button>
</div>
<div class="card">
  <h1 class="card__title"></h1>
  <h3 class="card__subtitle"></h3>
  <button>Click here</button>
</div>
```

#### $ : Numbering

That one is a feature that I really like, especially when you want to number your tags.

```html
.page-$*4<div class="page-1"></div>
<div class="page-2"></div>
<div class="page-3"></div>
<div class="page-4"></div>
```

You can even precise at which number you want to start with `@`

```html
ul>li.item-$@3*3<ul>
  <li class="item-3"></li>
  <li class="item-4"></li>
  <li class="item-5"></li>
</ul>
```

#### [] : Custom attributes

Emmet doesn’t stop here, you can also give custom attributes to your elements with `[]` !

```html
input[type=number]<input type="number">
```

If you want to add more attributes to your tag, don’t worry just put a space between your attributes.

```html
img[src=logo.png alt=logo]<img src="logo.png" alt="logo">
```

#### Some useful shortcuts

You’re going to use them a lot so be sure to remember them ;)

```html
html:5<!DOCTYPE html>
  <html lang=”en”>
  <head>
    <meta charset=”UTF-8">
    <meta name=”viewport” content=”width=device-width, initial scale=1.0">
    <meta http-equiv=”X-UA-Compatible” content=”ie=edge”>
    <title>Document</title>
  </head>
  <body>  </body>
</html>loremLorem, ipsum dolor sit amet consectetur adipisicing elit. Modi, odit laboriosam enim illum et vero esse blanditiis libero perspiciatis numquam, voluptatum debitis, tempora veniam ipsam maxime atque est sequi dolore!link:css<link rel="stylesheet" href="style.css" />script:src<script src=""></script>
```

# Time to practice

Practice makes perfect ! Here are some HTML code. Try to figure out what was the snippet.
Don’t look now at the solution. Play around with Emmet. It’s the only way to really learn !

#### Exercise 1

```html
<div class="container">
  <p>Hello world!</p>
</div>
```

#### Exercise 2

```html
<ul>
  <li class="item item--1">Item 1</li>
  <li class="item item--2">Item 2</li>
  <li class="item item--3">Item 3</li>
</ul>
```

#### Exercise 3

```html
<header class="header">
  <img src="logo.png" alt="logo" class="header__logo"/>
  <h1 cass="heading">Title</h1>
</header>
```

#### Exercise 4

```html
<section>
  <h2 class=”heading-2"></h2>
  <p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe
    accusamus totam enim harum deserunt laborum voluptates 
    voluptatem sint possimus blanditiis commodi aliquam fuga dolorum
    quae similique qui, suscipit, ad vitae.
  </p>
</section><aside>
  Lorem ipsum dolor sit amet consectetur adipisicing elit.
  Recusandae minima, assumenda quibusdam reiciendis blanditiis
  praesentium molestiae omnis fuga atque impedit, perferendis 
  quisquam. Dolores aliquam minima labore! Deserunt inventore
  aperiam totam.
</aside>
```

#### Exercise 5

```html
<!DOCTYPE html>
  <html lang=”en”>
  <head>
    <meta charset=”UTF-8">
    <meta name=”viewport” content=”width=device-width, initial scale=1.0">
    <meta http-equiv=”X-UA-Compatible” content=”ie=edge”>
    <title>Document</title>
  </head>
  <body>
    <header></header>
    <main>
      <div class=”feature”>
        <h1 class=”feature__title”>Feature 1</h1>
      </div>
      <div class=”feature”>
        <h1 class=”feature__title”>Feature 2</h1>
      </div>
      <div class=”feature”>
        <h1 class=”feature__title”>Feature 3</h1>
      </div>
    </main>
  </body>
</html>
```

#### Solution 1

```html
.container>p{Hello World}
```

#### Solution 2

```html
ul>li.item.item--${Item $}*3
```

#### Solution 3

```html
header.header>img[src=logo.png alt=logo].header__logo+h1.heading{Title}
```

#### Solution 4

```html
section>h2.heading-2+p>lorem^^aside>lorem
```

Or

```html
(section>h2.heading-2+p>lorem)+aside>lorem
```

#### Solution 5

```html
html:5>header+main>(.feature>h1.feature__title{Feature $})*3
```