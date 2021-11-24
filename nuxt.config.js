export default {
  target: 'static',
  server: {
    host: '0.0.0.0',
    strictPort: true,
    port: 8080,
  },
  head: {
    // title: 'kube-labs',
    title: 'docker-labs',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },

  css: [],

  // plugins: [{ src: '~/plugins/containerID', mode: 'server' }],

  components: true,

  buildModules: ['@nuxtjs/eslint-module'],

  modules: [],

  build: {},

  publicRuntimeConfig: {
    NUXT_ENV_APP: process.env.NUXT_ENV_APP || '',
  },
}
