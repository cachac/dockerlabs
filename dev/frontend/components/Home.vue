<template>
  <div class="home">
    <img alt="Docker logo" src="~/static/assets/img/docker.png" />
    <h1>Docker Labs</h1>

    <nuxt-link :to="{ name: 'api' }">API</nuxt-link>

    <p>
      Aplicación de propósito de <b>pruebas de concepto</b> en la nube. <br />
      El objetivo es implementar una arquitectura de contenedores Docker.
    </p>
  </div>
</template>

<script>
export default {
  name: 'Home',
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

