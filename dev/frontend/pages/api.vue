<template>
  <div class="home">
    <img alt="Docker logo" src="~/static/assets/img/docker.png" />
    <h1>API</h1>

    <input v-model="url" />
    <button @click="check">Check</button>
    <button @click="error">Error</button>

    <div v-if="isLoading">loading...</div>
    <h2 v-if="data">{{ data }}</h2>
    <h2 v-if="isError">{{ errorMessage }}</h2>

    <br />
    <br />
    <br />

    <nuxt-link :to="{ name: 'index' }">back</nuxt-link>
  </div>
</template>

<script>
export default {
  name: 'Check',
  data() {
    return {
      url: 'http://localhost:3000',
      isLoading: false,
      data: '',
      isError: false,
      errorMessage: '',
    }
  },

  methods: {
    async check() {
      this.data = null
      this.isError = false
      this.errorMessage = ''
      this.isLoading = true
      await import('axios').then((ax) => {
        const apiClient = ax.default.create({
          baseURL: this.url,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin-': '*',
            Accept: '*/*',
          },
          timeout: 30000,
        })

        apiClient
          .get('/healthcheck') // demo de get con axios
          .then((response) => {
            this.data = response?.data
            console.log('response', response?.data)
          })
          .catch((error) => {
						this.isError = true
            console.error('err response', error)
            this.errorMessage = error?.response?.data || error?.message || 'Error en la comunicación con API'
          })
          .finally(() => (this.isLoading = false))
      })
    },

		async error() {
      this.data = null
      this.isError = false
      this.errorMessage = ''
      this.isLoading = true
      await import('axios').then((ax) => {
        const apiClient = ax.default.create({
          baseURL: this.url,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin-': '*',
            Accept: '*/*',
          },
          timeout: 3000,
        })

        apiClient
          .get('/500') // demo de get con axios
          .then((response) => {
            this.data = response?.data
            console.log('response', response?.data)
          })
          .catch((error) => {
						this.isError = true
            console.error('err response', error)
            this.errorMessage = error?.response?.data || error?.message || 'Error en la comunicación con API'
          })
          .finally(() => (this.isLoading = false))
      })
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

