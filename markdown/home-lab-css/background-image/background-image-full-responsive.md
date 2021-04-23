## Responsive Full Background Image Using CSS

### HTML

This is all you need for the markup:

```html
<!doctype html>
<html>
<body>
  ...Your content goes here...
</body>
</html>
```

We’re going to assign the background image to the `body` element so that the image will always cover the entire viewport of the browser.

However, this technique will also work on any block-level element (such as a `div` or a `form`). If the width and height of your block-level container is fluid, then the background image will always scale to cover the container entirely.

### CSS

We declare a style rule for the `body` element like so:

```css
body {
  /* Location of the image */
  background-image: url(images/background-photo.jpg);
  ```
  ```css
  /* Background image is centered vertically and horizontally at all times */
  background-position: center center;
  ```
  ```css
  /* Background image doesn't tile */
  background-repeat: no-repeat;
  ```
  ```css
  /* Background image is fixed in the viewport so that it doesn't move when 
     the content's height is greater than the image's height */
  background-attachment: fixed;
  ```
  ```css
  /* This is what makes the background image rescale based
     on the container's size */
  background-size: cover;
  ```
  ```css
  /* Set a background color that will be displayed
     while the background image is loading */
  background-color: #464646;
}
```