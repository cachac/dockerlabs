import { getContainerIdSync } from 'docker-id'

const id = getContainerIdSync() || Math.random().toString(36).substring(2, 15)
const isDocker = Boolean(id)
// eslint-disable-next-line no-console
console.log('isDocker :>> ', isDocker)

export default ({ app }, inject) => {
  inject('container', {
    id,
  })
}
