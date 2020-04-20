// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap/dist/js/bootstrap';
import 'bootstrap'

import Axios from './axios';
Vue.prototype.$axios = Axios;

import Toasted from 'vue-toasted';
Vue.prototype.$toasted = Toasted;

import Vue from 'vue/dist/vue.esm';
import '../styles/application.scss'

import Loading from './components/share/Loading'

document.addEventListener('DOMContentLoaded', () => {
  const app = document.getElementById("app");

  const vue = new Vue({
    el: "#app",
    components: {
      Loading: Loading
    }
  });
  
  const toastOption = { 
    duration: 3000,
    theme: "bubble"
  };
  Vue.use(Toasted, toastOption);
});