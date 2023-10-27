<template>
  <div class="home">
    <img alt="Kube logo" src="~/static/assets/img/kubernetes.png" />
    <h1>Kube Labs</h1>
    <h2>-{{ id }}-</h2>
    <p>
      Aplicación de propósito de <b>pruebas de concepto</b> en la nube. <br />
      El objetivo es implementar una arquitectura de kubernetes.
    </p>
  </div>
</template>

<script>
export default {
  name: 'Home',
  props: ['id'],
  computed: {
    version() {
      return this.$config.NUXT_ENV_APP
    },
  },
}
</script>

<style scoped>
.home {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
img {
  padding: 5px;
  width: 250px;
}
html {
  min-height: 100%;
}
body {
  padding: 2em;
  /* background-image: url(''), linear-gradient(-45deg, #7ccea9, #ffffff); */
  background-repeat: no-repeat;
  background-size: 3em, 100%;
  background-position: center 2em, center center;
}
</style>
