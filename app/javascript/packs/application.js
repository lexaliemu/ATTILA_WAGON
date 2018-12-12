import "bootstrap";
import "../search.js";
import "../plugins/slick";
import "../components/banner";
import "../components/stripe";


import { loadDynamicBannerText } from '../components/banner';

if (document.getElementById('banner-typed-text')) {
  loadDynamicBannerText();
};

