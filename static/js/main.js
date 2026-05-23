/* ============================================================
   jyooi.com — terminal theme runtime
   1) live Penang clock (UTC+8)
   2) keyboard shortcuts: h/e/p/c/g
   3) gentle smooth-scroll for anchor links
   ============================================================ */

(() => {
  'use strict';

  /* ---------------- clock ---------------- */
  const clockEl = document.getElementById('js-clock');
  if (clockEl) {
    const fmt = (n) => String(n).padStart(2, '0');
    const tick = () => {
      const now = new Date();
      const utc = now.getTime() + now.getTimezoneOffset() * 60000;
      const myt = new Date(utc + 8 * 3600000);
      const t = `${fmt(myt.getHours())}:${fmt(myt.getMinutes())}:${fmt(myt.getSeconds())} MYT`;
      clockEl.textContent = t;
    };
    tick();
    setInterval(tick, 1000);
  }

  /* ---------------- keyboard shortcuts ---------------- */
  const targets = {
    h: () => location.href = '/',
    e: () => scrollTo('#experience'),
    p: () => scrollTo('#projects'),
    c: () => scrollTo('#contact'),
    g: () => window.open('https://github.com/jyooi', '_blank', 'noopener'),
  };

  function scrollTo(sel) {
    const el = document.querySelector(sel);
    if (!el) return;
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  document.addEventListener('keydown', (e) => {
    if (e.metaKey || e.ctrlKey || e.altKey) return;
    if (/^(input|textarea|select)$/i.test((e.target.tagName || ''))) return;
    const k = e.key.toLowerCase();
    const fn = targets[k];
    if (fn) {
      e.preventDefault();
      fn();
    }
  });

  /* ---------------- anchor smooth scroll ---------------- */
  document.querySelectorAll('a[href^="#"], a[href*="/#"]').forEach((a) => {
    a.addEventListener('click', (e) => {
      const href = a.getAttribute('href');
      const hash = href.includes('#') ? '#' + href.split('#')[1] : null;
      if (!hash || hash === '#') return;
      const target = document.querySelector(hash);
      if (target && (a.pathname === location.pathname || a.pathname === '/')) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        history.pushState(null, '', hash);
      }
    });
  });
})();
