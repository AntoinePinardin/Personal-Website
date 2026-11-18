# Website maintenance

This is a static website. Upload the contents of this `Website` folder to your GitHub Pages repository (keeping `CNAME`).

- **Text and publications:** edit `index.html`. Each publication is one `<article class="publication-card">` in the `publication-grid` section. Copy one article to add another.
- **Responsive layout:** edit `css/site-fixes.css` (loaded last). The original template is in `css/layout.css` and the vendor files are in `vendor/`.
- **Images:** in `img/`. PDFs are at the root.
- **Tablet layouts:** CSS rules are grouped under the 768–1199px media query. The publication cards switch to one column at 991px.
- **Testing:** open `index.html` locally, or serve with `python -m http.server 8000` and inspect at widths 375, 768, 820, 1024 and 1440px.

The original Bootstrap 3 / KeenThemes template is retained for ease of comparison. The old restrictive Content-Security-Policy meta tag was removed because it interfered with the template's scripts. The old user-agent device detection script is no longer loaded.

The CV and thesis PDFs are unchanged; update the CV file separately if you have a newer version.

- **Publications scroll:** the list shows four cards at once and scrolls independently. On wide screens this is two columns by two rows; on tablets/phones it is one column by four rows. Change `--publication-row-height` in `css/site-fixes.css` to adjust card height. The list is keyboard-scrollable (Tab to focus it, then arrow keys/Page Down).
- **Li–Malbon–Pinardin:** the Family №2.12 paper is marked as published in *Taiwanese Journal of Mathematics*.

## Disabled code (18 November 2026)

Unused JavaScript and CSS **imports are commented out in `index.html`**, not deleted.
They include the old Swiper carousel and its stylesheet, the progress-bar animation,
`jquery.appear`, the old logo-hover script `neglog.js`, and `jquery-migrate`.
The old device detector and Bootstrap carousel initializer are commented out in
`js/layout.js`. The page now loads this readable file instead of `layout.min.js`.

**Kept active:** Bootstrap navigation, smooth navigation scrolling, the back-to-top
button, WOW animations, parallax background, and equal-height handling.
The old commented-out HTML sections remain as optional examples. Vendor and minified
files are retained in the archive, so you can reactivate features later.

Also corrected stray closing `</link>` and `</meta>` tags in the HTML head.
