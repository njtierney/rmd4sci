# HTML document extensions

Some common options for HTML include:

- Adding tab sets
- floating table of contents

### Adding Tab sets

A tab set looks like the following:

````markdown
#### Example tab set {.tabset}

##### Tab 1

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed eleifend velit. Sed porta pulvinar lorem ut rutrum. Etiam quis cursus libero. Donec nibh nisl, auctor quis sem in, feugiat convallis odio. Ut at euismod ligula. Nullam vitae quam non lacus scelerisque tempus. Sed tincidunt massa non nunc tincidunt feugiat. In hac habitasse platea dictumst.

##### Tab 2

```{r tab-plot}` r''
plot(iris$Sepal.Length, iris$Sepal.Width)
```
````

To add a tab set, you include `{.tabset}` after your heading

### Floating table of contents

A floating table of contents can be added

## Your turn {.exercise}

1. Add tab sets to your document
1. Add a floating table of contents
