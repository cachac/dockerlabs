<template>
  <DockerHome :id="containerID" />
  <!-- <KubeHome :id="containerID" /> -->
</template>

<script>
export default {
  asyncData({ app }) {
    const containerID = app.context.req?.containerID || '?'

    return { containerID }
  },
}
</script>
