import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Awesome movies from awesome people"],
    typeSpeed: 60,
    loop: true
  });
};

export { loadDynamicBannerText };
