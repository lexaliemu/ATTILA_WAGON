import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Awesome movies from awesome people"],
    typeSpeed: 60,
    loop: false
  });
};

export { loadDynamicBannerText };
