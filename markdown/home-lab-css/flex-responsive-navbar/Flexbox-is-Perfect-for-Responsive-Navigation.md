

## Flexbox is Perfect for Responsive Navigation

Flexbox is a versatile layout module with which we can create one-dimensional layouts that require flexibility, such as responsive menus. Using flexbox’s ordering, alignment, and sizing properties, we can build navigation bars that adapt their layouts to the viewport size while keeping the HTML outline logical and accessible.

In this tutorial, we’ll look into how to create a responsive navigation bar with flexbox. Our flexbox navigation will have three different layouts, depending on the viewport size:

1. a **mobile layout** in which only the logo and a toggle button will be visible by default and users can open and close the menu using the toggle,
2. a **tablet layout** in which we will show two call-to-action buttons between the logo and toggle in the default state and the rest of the menu will remain toggleable,
3. a **desktop layout** in which all the menu items, except for the toggle button, will be visible on the screen.

We will use media queries to detect the viewport size of the user’s browser. Our responsive navigation bar will be mobile-first, so we will create the mobile layout first. Then, we will add the tablet- and desktop-specific CSS using `min-width` media queries.

The navigation bar will also have a JavaScript-based dropdown submenu that opens and closes when the user clicks the parent menu item.

Here’s how the menu will look on mobile:

<img src="E:\home-lab\home-lab-css\flex-responsive-navbar\image-20200731163126477.png" style="zoom:75%;"/>



```html
  <ul class="menu">
    <li class="logo"><a href="#">Creative Mind Agency</a></li>
    <li class="item"><a href="#">Home</a></li>
    <li class="item"><a href="#">About</a></li>
    <li class="item has-submenu">
      <a tabindex="0">Services</a>
      <ul class="submenu">
        <li class="subitem"><a href="#">Design</a></li>
        <li class="subitem"><a href="#">Development</a></li>
        <li class="subitem"><a href="#">SEO</a></li>
        <li class="subitem"><a href="#">Copywriting</a></li>
      </ul>
    </li>
    <li class="item has-submenu">
      <a tabindex="0">Plans</a>
      <ul class="submenu">
        <li class="subitem"><a href="#">Freelancer</a></li>
        <li class="subitem"><a href="#">Startup</a></li>
        <li class="subitem"><a href="#">Enterprise</a></li>
      </ul>
    </li>
    <li class="item"><a href="#">Blog</a></li>
    <li class="item"><a href="#">Contact</a>
    </li>
    <li class="item button"><a href="#">Log In</a></li>
    <li class="item button secondary"><a href="#">Sign Up</a></li>
    <li class="toggle"><a href="#"><i class="fas fa-bars"></i></a></li>
  </ul>
```
<img src="E:\home-lab\home-lab-css\flex-responsive-navbar\Annotation 2020-07-31 163214.png" alt="Tablet" style="zoom:50%;" />

  ```css
    <ul class="menu">
    <li class="logo"><a href="#">Creative Mind Agency</a></li>
    <li class="item"><a href="#">Home</a></li>
    <li class="item"><a href="#">About</a></li>
    <li class="item has-submenu">
      <a tabindex="0">Services</a>
      <ul class="submenu">
        <li class="subitem"><a href="#">Design</a></li>
        <li class="subitem"><a href="#">Development</a></li>
        <li class="subitem"><a href="#">SEO</a></li>
        <li class="subitem"><a href="#">Copywriting</a></li>
      </ul>
    </li>
    <li class="item has-submenu">
      <a tabindex="0">Plans</a>
      <ul class="submenu">
        <li class="subitem"><a href="#">Freelancer</a></li>
        <li class="subitem"><a href="#">Startup</a></li>
        <li class="subitem"><a href="#">Enterprise</a></li>
      </ul>
    </li>
    <li class="item"><a href="#">Blog</a></li>
    <li class="item"><a href="#">Contact</a>
    </li>
    <li class="item button"><a href="#">Log In</a></li>
    <li class="item button secondary"><a href="#">Sign Up</a></li>
    <li class="toggle"><a href="#"><i class="fas fa-bars"></i></a></li>
  </ul>
  ```

<img src="E:\home-lab\home-lab-css\flex-responsive-navbar\desktop.png" alt="Desktop" style="zoom: 50%;" />

```javascript
const toggle = document.querySelector(".toggle");
const menu = document.querySelector(".menu");
const items = document.querySelectorAll(".item");

/* Toggle mobile menu */
function toggleMenu() {
  if (menu.classList.contains("active")) {
    menu.classList.remove("active");
    toggle.querySelector("a").innerHTML = "<i class='fas fa-bars'></i>";
  } else {
    menu.classList.add("active");
    toggle.querySelector("a").innerHTML = "<i class='fas fa-times'></i>";
  }
}

/* Activate Submenu */
function toggleItem() {
  if (this.classList.contains("submenu-active")) {
    this.classList.remove("submenu-active");
  } else if (menu.querySelector(".submenu-active")) {
    menu.querySelector(".submenu-active").classList.remove("submenu-active");
    this.classList.add("submenu-active");
  } else {
    this.classList.add("submenu-active");
  }
}

/* Close Submenu From Anywhere */
function closeSubmenu(e) {
  let isClickInside = menu.contains(e.target);

  if (!isClickInside && menu.querySelector(".submenu-active")) {
    menu.querySelector(".submenu-active").classList.remove("submenu-active");
  }
}
/* Event Listeners */
toggle.addEventListener("click", toggleMenu, false);
for (let item of items) {
  if (item.querySelector(".submenu")) {
    item.addEventListener("click", toggleItem, false);
  }
  item.addEventListener("keypress", toggleItem, false);
}
document.addEventListener("click", closeSubmenu, false);
```
