import "bootstrap";
import "../search.js";
import "../plugins/slick";
import "../components/banner";

import { loadDynamicBannerText } from '../components/banner';

if (document.getElementById('banner-typed-text')) {
  loadDynamicBannerText();
};

