<template>
  <Home :id="id" />
</template>

<script>
export default {
  asyncData({ app, $container }) {
    let id = $container.id

    if (!id) id = 'No es un contenedor'
    else id = id.substr(id.length - 8)
		
    console.log('this.id :>> ', id)

    return { id }
  },
}
</script>
